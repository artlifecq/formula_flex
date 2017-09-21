package  com.rpgGame.app.manager.ctrl
{
	import com.game.engine3D.utils.MathUtil;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.manager.WalkToRoleManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.DropGoodsManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneDropGoodsManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import org.game.netCore.data.long;
	


	
	/**
	 * 智能拾取 
	 * @author yfl
	 */
	public class ControlAutoPick 
	{
		private static const JOBARR:Array=[JobEnum.ROLE_0_TYPE,JobEnum.ROLE_1_TYPE,JobEnum.ROLE_2_TYPE,JobEnum.ROLE_4_TYPE];
		/**最大搜寻距离**/
		public static const AUTO_SEARCH_MAX_DIS :int = 550;//像素
		/**直接捡取不用寻路距离**/
		public static const AUTO_DIRECT_SEND_PICK:int=150;
		// 这个目前就让主玩家有吧
		private var _mainplayer :SceneRole = null;
		private var _isPicking :Boolean = false;
		//比如距离109需要寻路，寻路到距离物品100地方，相当于走9个距离，但是寻路修正坐标小于10就会返回false，用这个标记告诉自动战斗不进行
		private var _isArrivePk:Boolean=false;
	
		// 当前准备拾取的掉落物品GID
		private var _curPickX:int = 0;
		private var _curPickY:int = 0;
		private var _curPickingItem :Number;
		
		
		private var _lastshortPickTime :int = 0;		
		//被快捷拾取过的物品 用来防止快捷重复拾取    gid :拾取时间 
		private var _shortNearPickCache :HashMap = new HashMap();
		
		private var _latelySendCache :HashMap = new HashMap();
		
		// 扔掉的物品
		private var _throwItemHash :HashMap = new HashMap();
		// 屏蔽理由：开始拾取物品，可能处于攻击状态使拾取失败，进入拾取列表后不然再次优先拾取，导致顺序混乱 pbk 2016-6-25
		//		// 自动拾取过的物品
		//		private var _autoPickCache :HashMap = new HashMap();
		// 上次尝试自动拾取的时间
		private var _autoPickTryTime :int = 0;
		// 刷新扔掉道具列表
		private var _refreshThrowItemTime :int = 0;

		/**
		 * 
		 */
		public function get isArrivePk():Boolean
		{
			return _isArrivePk;
		}

		/**
		 * @private
		 */
		public function set isArrivePk(value:Boolean):void
		{
			_isArrivePk = value;
		}

		public function clearState():void
		{
			_curPickingItem = 0;
			_curPickX = 0;
			_curPickY = 0;
			_isPicking=false;
		}
		public function ControlAutoPick( tar :SceneRole )
		{
			
			_mainplayer = tar as SceneRole;
		}
		
		 public function dispose():void
		{
			_mainplayer = null;
			
		}
		
		/**
		 * 点击场景物品 
		 * @param sitem
		 */
		public function ClickSceneItem( sitem :SceneRole ):void
		{
			BeginPickDropItem( sitem );
		}
		
		
		private function canPick(sItem:SceneRole):Boolean
		{
			if (!sItem||sItem.type!=SceneCharType.DROP_GOODS) 
			{
				return false;
			}
			if (isOthers(sItem)) 
			{
				return false;
			}
			return true;
		}
		private function isOthers(sitem:SceneRole):Boolean
		{
			var data:SceneDropGoodsData = sitem.data as SceneDropGoodsData;
			if (data.goodsDatas.validPickups.length>0) 
			{
				for each (var id:long in data.goodsDatas.validPickups) 
				{
					if (id.EqualTo(MainRoleManager.serverID)) 
					{
						return false;
					}
				}
				
			}
			var owerId:Number=data.goodsDatas.ownerId.ToGID();
			var myId:int=MainRoleManager.serverGid;
			if (owerId==0) 
			{
				return false;
			}
			else if (owerId!=myId) 
			{
				//策划要求可以见队友的
//				if (Mgr.teamMgr.isInMyTeam(data.goodsDatas.ownerId)) 
//				{
//					return false;
//				}
				return true;
			}
			return false;
		}
		private function getPos(sItem:SceneRole,ret:Point=null):Point
		{
			var pt:Point;
			
			if (ret!=null) 
			{
				pt=ret;
			}
			else
			{
				pt=new Point();
			}
			pt.x=sItem.pos.x;
			pt.y=sItem.pos.y;
			return pt;
		}
		/**
		 * 快捷键拾取，就是一直按 
		 */
		public function DoShortcutPick():void
		{
			if ( _isPicking )
				return;
			
			// 记录最近的
			var lestItem :SceneRole = null;
			var lestdis :int = int.MAX_VALUE;
			var lestPri :int = int.MAX_VALUE;
			
			// 记录已经被扫过里面最近的
			var lestItemShort :SceneRole = null;
			var lestDisShort :int = int.MAX_VALUE;
			var lestPriShort :int = int.MAX_VALUE;
			
			var lestItemAll :SceneRole = null;
			var lestDisAll :int = int.MAX_VALUE;
			var lestPriAll :int = int.MAX_VALUE;
			
			var shortCountinueNum :int = 0; // 统计快捷键拾取缓存中物品数量
			var shortInNum :int = 0;
			
			// 10秒不按，就清除最近拾取状态
			if ( ( getTimer() - _lastshortPickTime ) > 10000 )
			{
				_shortNearPickCache.clear();
			}
			
			_lastshortPickTime = getTimer();
			
			var items :Array = DropGoodsManager.getInstance().getAllSceneItems();
			var itemPt:Point=new Point();
			for each ( var sitem :SceneRole in items )
			{
				var itemmodel :Q_item = sitem.data.qitem;
				if ( itemmodel == null )
					continue;
				
				var gid :Number = sitem.id;
				if (canPick(sitem) == false)
					continue;
				
				var middleGridPt :Point = getPos(_mainplayer,middleGridPt);
				getPos(sitem,itemPt);
				var midDis :int = MathUtil.getDistance(itemPt.x,itemPt.y,middleGridPt.x,middleGridPt.y);
				var inArea :Boolean = midDis<=AUTO_SEARCH_MAX_DIS;
				
				
				var pri :int = itemmodel.q_loot_priority;
				
				if ( inArea )
				{
					// 在拾取范围内
					shortInNum++;
					if (true)
					{
						// 附近被扫过的
						if ( _shortNearPickCache.containsKey( gid ) )
						{
							shortCountinueNum++;
							
							if ( lestPriShort > pri )
							{
								lestDisShort = midDis;
								lestItemShort = sitem;
								lestPriShort = pri;
							}
							else if ( lestPriShort == pri )
							{
								if ( lestdis > midDis )
								{
									lestDisShort = midDis;
									lestItemShort = sitem;
									lestPriShort = pri;
								}
							}
							continue;
						}
					}
					
					if ( lestPri > pri )
					{
						lestdis = midDis;
						lestItem = sitem;
						lestPri = pri;
					}
					else if ( lestPri == pri )
					{
						if ( lestdis > midDis )
						{
							lestdis = midDis;
							lestItem = sitem;
							lestPri = pri;
						}
					}
				}
			}// for each end
			
			if ( lestItemShort == null && lestItem == null )
			{			
				if ( lestItemAll != null )
				{
					lestItem = lestItemAll;
					lestdis = lestDisAll;
					lestPri = lestPriAll;
				}
				else
				{
					
					//NoticeManager.( "周围没有可拾取物品" ) ;
				}
			}
			
			// 快捷键已经扫过周围物品一遍才会清再次拾取状态
			if ( shortInNum == shortCountinueNum )
			{ 
				_shortNearPickCache.clear();
				
				if ( lestItemShort != null )
				{
					BeginPickDropItem( lestItemShort );
					_shortNearPickCache.put( lestItemShort.id, getTimer() );
					lestItem = null;
				}
			}
			
			if ( lestItem != null )
			{
				BeginPickDropItem( lestItem );
				_shortNearPickCache.put( lestItem.id, getTimer() );
			}
		}
		
	
		
		/**
		 * 开始拾取一个道具 
		 * @param isAuto
		 * @return 
		 */
		public function BeginPickDropItem( sitem :SceneRole, isAuto :Boolean = false):Boolean
		{
			if (canPick(sitem) == false)
			{
				return false;
			}
			
			if ( isAuto && CheckBagFull(sitem) )
			{
				//Mgr.promptMgr.AddPersonInfo( 1, "背包已满，自动拾取失败！请清理背包" );
				SetPickingState( false );
				_curPickingItem = 0;
				return false;
			}
			if ( CheckCanSendPick( sitem ) )
			{Lyt.a("拾取物品："+sitem.data.qitem.q_name);
				// 请求拾取道具
				reqPickDropItem( sitem );
				_curPickingItem = 0;
				SetPickingState( false );
				return true;
			}
			else
			{
				var ret:Boolean=WalkToRoleManager.walkToRole(sitem)
				if ( ret )
				{
					var itemPt:Point=getPos(sitem);
					_curPickingItem = sitem.id;
					_curPickX =itemPt.x;
					_curPickY = itemPt.y;
					SetPickingState( true );
					return true;
				}
				else
				{
					SetPickingState( false );
					return false;
				}
			}
			
			return false;
		}
		

		
		private function CheckBagFull( sitem:SceneRole):Boolean
		{
			if (BackPackManager.instance.haveEmptyGrid())
				
				return false;
			
			var itemm:Q_item = sitem.data.qitem;
			
			if (!ItemUtil.IsCurrency( itemm.q_type ))
			{// 不是钱的话，检查能否叠加
				var items:Vector.<ClientItemInfo> =BackPackManager.instance.getItemsById(itemm.q_id);
				for (var i:int = 0; i < items.length; ++i)
				{
//					if (items[i].hasOverdue)
//						continue;
					
//					if (items[i].isBind && !(sitem.isBind || itemm.q_bind == 1))
//						continue;
//					if (!items[i].isBind && (sitem.isBind || itemm.q_bind == 1))
//						continue;
					
					if (items[i].count + sitem.data.goodsDatas.num<= itemm.q_max)
					{
						return false;
					}
				}
				return true;
			}
			return false;
		}
		
		private function CheckCanSendPick( sitem :SceneRole ):Boolean
		{
			var dis :int = AUTO_DIRECT_SEND_PICK;
			var myPt:Point=getPos(_mainplayer);
			var itemPt:Point=getPos(sitem);
			var curdis :int = MathUtil.getDistance(myPt.x,myPt.y,itemPt.x,itemPt.y);
			
			if ( curdis <= dis )
				return true;
			
			return false;
		}
		
		public  function SetPickingState( value :Boolean ):void
		{
			_isPicking = value;
		}
		
		private function reqPickDropItem( sitem :SceneRole ):void 
		{
		
			SceneDropGoodsManager.selectedDropGoods(sitem.data as SceneDropGoodsData);
			// 5秒内拾取过的道具
			_latelySendCache.put( sitem.id, getTimer() + 5000 );
			
			trace( "req:", sitem.name );
		}
		public function hasSth2Pick():Boolean
		{
			var itemArray :Array = DropGoodsManager.getInstance().getAllSceneItems();
			var itemPt:Point=new Point();
			var playerPt :Point = getPos(_mainplayer);
			for each ( var item :SceneRole in itemArray )
			{
				var gid :Number = item.id;
				if ( _throwItemHash.containsKey( gid ) )
				{
					continue;
				}
				
				if ( isOthers(item) )
				{
					continue;
				}
				
				if ( IsNotAutoPick(( item.data as SceneDropGoodsData).goodsDatas.dropGoodsId ) )
				{
					continue;
				}
				
				if (canPick(item)== false)
				{
					continue;
				}
				itemPt=getPos(item,itemPt);
				var dis:int=MathUtil.getDistance(playerPt.x,playerPt.y,item.x,itemPt.y);
				
				var isInAutoArea :Boolean = (dis<=AUTO_SEARCH_MAX_DIS);
				if ( !isInAutoArea )// 超过最大拾取距离
				{
					continue;
				}
				
				var ret :int = CanPassFilter( item );
				if ( ret != 0 )// 不可拾取类型
				{
					continue;
				}
				return true;
			}
			return false;
		}
		/**
		 * 自动拾取物品
		 */
		public function TryAutoPickItem():Boolean
		{
			if (_isPicking) 
			{
				return true;
			}
			_isArrivePk=false;
			var isMoving:Boolean=_mainplayer.stateMachine.isRunning||_mainplayer.stateMachine.isWalking||_mainplayer.stateMachine.isWalkMoving||_mainplayer.stateMachine.isSpriteUp;
			if (isMoving)
			{
				return false;
			}
			var isFighting:Boolean=_mainplayer.stateMachine.isAttacking||_mainplayer.stateMachine.isAttackHarding;
			if (isFighting) 
			{
				return false;
			}
			if ( _autoPickTryTime == 0 )
				_autoPickTryTime =getTimer();
			var diff :int = getTimer() - _autoPickTryTime;
			
			// 先刷新一下扔掉的道具列表
			_refreshThrowItemTime += diff;
			if ( _refreshThrowItemTime > 1000 )
			{
				RefreshThrowList();
				_refreshThrowItemTime = 0;
			}
			
						
			if ( _mainplayer.stateMachine.isJumping || _mainplayer.stateMachine.isDead )
			{
				SetPickingState( false );
				return false;
			}
			//切换地图中呢
			if ( !SceneSwitchManager.isChangeSceneComplete )
			{
				SetPickingState( false );
				return false;
			}
			
			var playerPt :Point = getPos(_mainplayer);
			
			var lestItem :SceneRole = null;
			var lestdis :Number = 30; // 20*20 + 20*20 开方不会有这么大
			var lestPri :int = int.MAX_VALUE;
			
			var itemArray :Array = DropGoodsManager.getInstance().getAllSceneItems();
			var itemPt:Point=new Point();
			for each ( var item :SceneRole in itemArray )
			{
				var gid :Number = item.id;
				if ( _throwItemHash.containsKey( gid ) )
				{
					continue;
				}
				
				if ( isOthers(item) )
				{
					continue;
				}
				
				if ( IsNotAutoPick(( item.data as SceneDropGoodsData).goodsDatas.dropGoodsId ) )
				{
					continue;
				}
				
				if (canPick(item)== false)
				{
					continue;
				}
				itemPt=getPos(item,itemPt);
				var dis:int=MathUtil.getDistance(playerPt.x,playerPt.y,item.x,itemPt.y);
				
				var isInAutoArea :Boolean = (dis<=AUTO_SEARCH_MAX_DIS);
				if ( !isInAutoArea )// 超过最大拾取距离
				{
					continue;
				}
				
				var ret :int = CanPassFilter( item );
				if ( ret != 0 )// 不可拾取类型
				{
					continue;
				}
				
				
				var model :Q_item = item.data.qitem;
				var pri :int = model == null ? int.MAX_VALUE : model.q_loot_priority;
				
				if ( pri < lestPri )// 检测优先级
				{
					lestdis = dis;
					lestItem = item;
					lestPri = pri;
				}
				else if ( pri == lestPri )
				{
					if ( lestdis > dis )// 检测拾取距离
					{
						lestdis = dis;
						lestItem = item;
						lestPri = pri;
					}
				}
			}
			
			if ( lestItem != null )
			{
				return BeginPickDropItem( lestItem, true );
			}
			
			SetPickingState( false );
			return false;
		}
		private function checkEquipPick(qItem:Q_item):Boolean
		{
			if (!qItem||!ItemUtil.IsEquip(qItem.q_type)) 
			{
				return false;
			}
			var pickEquip:Boolean=SystemSetManager.autoSelect;
			if (!pickEquip) 
			{
				return false;
			}
			var pickJobIndex:int=SystemSetManager.job;
			var pickJob:int=JOBARR[pickJobIndex];
			if (pickJob!=JobEnum.ROLE_0_TYPE&&pickJob!=qItem.q_job) 
			{
				return false;
			}
//			var pickLv:int=SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_DENGJIE);
//			//是大于多少阶数
//			if (qItem.q_levelnum<=pickLv) 
//			{
//				return false;
//			}
			var qua:int=SystemSetManager.quality;
			if (qItem.q_default<qua) 
			{
				return false;
			}
			return true;
		}
		/**
		 * return 0 才可以捡
		 */		
		private function CanPassFilter( sitem:SceneRole ):int
		{
		
			if ( sitem == null )
				return -1;
			
			var itemm :Q_item = sitem.data.qitem;
			if ( itemm == null )
				return -1;
			
			if ( CheckBagFull(sitem) )
				return -2;
			
		
//			if (ItemUtil.IsCurrency( itemm.q_type )) 
//			{
//				if ( !SystemSetManager.getinstance().getBooleanByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_MONEY) )//ItemUtil.isCurrency() )
//				{
//					return -1;
//				}
//			}
			
			 if ( ItemUtil.IsEquip( itemm.q_type ) )
			{
				if (!checkEquipPick(itemm)) 
				{
					return -1;
				}
				
			}
//			else if (ItemUtil.IsMedical( itemm.q_type ) )
//			{
//				if ( !SystemSetManager.getinstance().getBooleanByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_DRUGS) ) 
//				{
//					return -1;
//				}
//				
//			}
//			else if ( ItemUtil.IsMaterial( itemm.q_type ) )
//			{
//				if ( !SystemSetManager.getinstance().getBooleanByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_MATERIAL)) 
//				{
//					return -1;
//				}
//				
//			}
			else if (  ItemUtil.IsTaskItem( itemm.q_type ) )
			{
				return 0;
			}
			
			
			return 0;
		}
		
		/**
		 *  
		 * @param sidStr
		 */
		public function IsNotAutoPick( id :int ):Boolean
		{
			if ( _latelySendCache.containsKey( id ) )
			{
				var t :int = _latelySendCache.get( id );
				if ( getTimer() > t )
				{
					_latelySendCache.remove( id );
					return false;
				}
				
				return true;
			}
			
			return false;
		}
		
		public function AddThrowItem( id :uint ):void
		{
			_throwItemHash.put( id, { id :id, time :getTimer() } );
		}
		
		private function RefreshThrowList():void
		{
			var now :int = getTimer();
			var arr :Array = _throwItemHash.values();
			var length :int = arr.length;
			var obj :Object;
			for ( var i :int = 0; i < length; i++ )
			{
				obj = arr[i];
				if ( now - obj.time > 60 * 1000 )
				{
					_throwItemHash.remove( obj.id );
				}
			}
		}
		
		
		public function get isPicking():Boolean
		{
			return _isPicking;
		}
	}
}