package com.rpgGame.appModule.role
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.lang.LangGoods;
	import com.rpgGame.coreData.lang.LangMenu;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import flash.geom.Point;
	
	import app.message.EquipType;
	
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.juese_Skin;

	/**
	 *装备部分
	 * @author dik
	 * 
	 */
	public class AvatarView
	{
		private var _skin : juese_Skin;
		
		private var _avatar : InterAvatar3D;
		private var _showAvatarData : RoleData;
		private var _avatarContainer:Inter3DContainer;
		private var equipNum:int=10;
		private var bgList:Array=[GridBGType.EQUIP_WEAPON,GridBGType.EQUIP_HELM,GridBGType.EQUIP_ARMOR,GridBGType.EQUIP_LEGHARNESS,GridBGType.EQUIP_SHOE,GridBGType.EQUIP_SCAPULA,
			GridBGType.EQUIP_RING,GridBGType.EQUIP_NECKLACE,GridBGType.EQUIP_BRACER,GridBGType.EQUIP_JADE];
		private var equipsTypes:Array=[EquipType.WEAPON,EquipType.HELM,EquipType.ARMOR,EquipType.LEGHARNESS,EquipType.SHOE,EquipType.SCAPULA,
			EquipType.RING,EquipType.NECKLACE,EquipType.BRACER,EquipType.JADE];
		private var equipGrids:Vector.<DragDropItem>;
		private var listDatas:ListCollection;
		private var _mgr:RoleEquipmentManager;
		private var containerId:int=ItemContainerID.Role;
		
		
		public var acceptDropFromContainerIdArr:Array;
		
		public function AvatarView(skin:juese_Skin)
		{
			acceptDropFromContainerIdArr=[ItemContainerID.BackPack];
			
			_skin=skin;
			_avatarContainer=new Inter3DContainer();
			var index:int=_skin.container.getChildIndex(_skin.weapons);
			_skin.container.addChildAt(_avatarContainer,index);
			_mgr=RoleEquipmentManager.instance;
			initAvatar();
			initEquips();
			setGridsCount(equipNum);
		}
		
		private function initEquips():void
		{
			equipGrids=new Vector.<DragDropItem>();
			for(var i:int=0;i<equipNum;i++){
				equipGrids.push(getGrid(bgList[i]));
				if(i<5){
					equipGrids[i].x=0;
					equipGrids[i].y=i*60;
				}else{
					equipGrids[i].x=284;
					equipGrids[i].y=(i-5)*60;
				}
				_skin.weapons.addChild(equipGrids[i]);
			}
		}
		
		private function getGrid(bg:String):DragDropItem
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_48,bg);
			var grid:DragDropItem = render.getGrid();
			grid.onTouchEndCallBack = onTouchGrid;
			return grid;
		}
		
		private function onTouchGrid(grid:DragDropItem ):void
		{
			if(!grid.gridInfo.data){
				return;
			}
			var pos:Point = grid.parent.localToGlobal(new Point(grid.x+2,grid.y+IcoSizeEnum.SIZE_40));
			MenuManager.showMenu([LangMenu.GET_ITEM],  grid.gridInfo, pos.x, pos.y, 40, _skin.container);
		}
		
		private function initAvatar():void
		{
			_avatar = new InterAvatar3D();
			_avatar.x = _skin.weapons.x + (_skin.weapons.width >> 1);
			_avatar.y = _skin.weapons.y + _skin.weapons.height;
			_avatarContainer.addChild3D(_avatar);
			_showAvatarData = new RoleData(0);
		}
		
		public function show():void
		{
			initEvent();
			
			updateRole();
			updateBaseInfo();
			if(!ItemSender.isReqRole){
				ItemSender.getItemsByType(containerId);
			}else{
				updateRoleEquip();
			}
		}
		
		private function updateRoleEquip():void
		{
			var goodsInfo:Array = _mgr.getAllItem();
			var i:int =0;
			var goodsLen:int = goodsInfo ? goodsInfo.length : 0;
			for (i=0; i<equipNum; i++)
			{
				if(i < goodsLen)
				{
					setGridInfo(i, goodsInfo[i]);
				}
				else
				{
					setGridInfo(i, null);
				}
			}
		}
		
		/**
		 * 设置格子数据 
		 * @param index
		 * @param itemInfo
		 * @param gridIndex 不为-1表示背包格子需要显示不能使用的索引
		 */		
		private function setGridInfo(index:int, itemInfo:ClientItemInfo, gridIndex:int = -1):void
		{
			var gridInfo:GridInfo = listDatas.getItemAt(index) as GridInfo;
			if(!gridInfo)
				return;
			gridInfo.data = itemInfo;
			gridInfo.isEnabled = _mgr.isEnabled(index);
			gridInfo.isUnlock = GoodsContainerMamager.isUnlock(containerId,index);
			if(itemInfo && gridIndex == -1)
			{
				gridInfo.isShowLockAsset = GoodsContainerMamager.getIsShowLockAsset(containerId, itemInfo.index);
			}
			else
			{
				gridInfo.isShowLockAsset = GoodsContainerMamager.getIsShowLockAsset(containerId, gridIndex);
			}
			listDatas.updateItemAt(index);
			if(this.containerId != gridInfo.containerID)
			{
				NoticeManager.showNotify("有一个格子的数据出错了！！！");
			}
			var grid:DragDropItem = getGridByIndex(index);
			if(!grid)return;
			grid.gridInfo = gridInfo;
		}
		
		/**
		 * 获得指定索引可拖拽格子 
		 * @param index
		 * @return 
		 * 
		 */		
		private function getGridByIndex(index:int):DragDropItem
		{
			var gridInfo:GridInfo = listDatas.getItemAt(index) as GridInfo;
			var i:int = gridInfo.realIndex;
			return ( i >= 0 && i < equipGrids.length ) ? equipGrids[i] : null;
		}
		
		private function initEvent():void
		{
			if(!ItemSender.isReqRole){
				EventManager.addEvent(ItemEvent.ITEM_INIT,initDatas);
			}else{
				updateRoleEquip();
			}
			
		
			EventManager.addEvent(ItemEvent.ITEM_DROPED, onDropItem);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);//基本属性改变
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_GET, getItem);
		}
		
		private function getItem(info:GridInfo):void
		{
			if(info.containerID!=ItemContainerID.Role){
				return;
			}
			var item:ClientItemInfo=info.data as ClientItemInfo;
			ItemSender.unwearEquip(item.itemInfo.itemId);
		}
		private function onFreshItems(info:ClientItemInfo=null):void
		{
			if(info&&info.containerID!=ItemContainerID.Role){
				return;
			}
			updateRoleEquip();
		}
		
		public function onHide():void
		{
			EventManager.removeEvent(ItemEvent.ITEM_DROPED, onDropItem);
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);//基本属性改变
			
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_GET, getItem);
		}
		
		/**
		 * 拖动物品放下时 
		 * @param srcGrid
		 * @param dstGrid
		 * 
		 */		
		private function onDropItem(srcGrid:GridInfo, dstGrid:GridInfo):void
		{
			//虽在战场，但战火未扔到自己身上
			if(dstGrid == null || dstGrid.containerID != containerId)return;
			
			if(!_mgr.isEnabled(srcGrid.index) ||  !_mgr.isEnabled(dstGrid.index) )
				return;
			if(_mgr.getIsShowBindLock())
			{
				NoticeManager.showNotify(LangGoods.GOODS_CANT_MOVE);
				return;
			}
			//是否接受从 containerId 拖过来的物品
			if( isAcceptDropFromContainer(srcGrid.containerID))
			{
				onItemDroped(srcGrid, dstGrid);
			}
		}
		
		public function onItemDroped(srcGrid:GridInfo, dstGrid:GridInfo):void
		{
			var sitem : ClientItemInfo = srcGrid.data as ClientItemInfo;
			var type:int=equipsTypes[dstGrid.realIndex];
			if(sitem.qItem.q_kind!=type){
				trace("这个位置不是装备"+sitem.qItem.q_location+"类型装备的！");
				return;
			}
			
			if(!sitem)
			{
				trace("try move grid fail ,index :",srcGrid.index);
				return;
			}
			ItemUseManager.useItem(srcGrid.data as ClientItemInfo);
		}
		
		/**
		 * 是否接受从 containerId 拖过来的物品
		 * 
		 */		
		private function isAcceptDropFromContainer(containerId:int):Boolean
		{
			return  (acceptDropFromContainerIdArr && acceptDropFromContainerIdArr.indexOf(containerId) != -1);
		}
		
		private function initDatas(containerId:int):void 
		{
			if(containerId!=ItemContainerID.Role){
				return;
			}
			EventManager.removeEvent(ItemEvent.ITEM_INIT,initDatas);
			updateRoleEquip();
		}
		
		private function setGridsCount(count:int):void
		{
			_mgr.setGridNum(count);
			listDatas=_mgr.gridInfoDatas;
			
			for (var i:int=0; i<equipNum; i++)
			{
				equipGrids[i].gridInfo=listDatas.getItemAt(i) as GridInfo;
			}
			updateRoleEquip();
		}
		
		private function updateBaseInfo():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			var zoneInddex:int=info.name.indexOf("]")+1;
			var zone:String=info.name.substr(0,zoneInddex);
			var roleName:String=info.name.substr(zoneInddex);
			_skin.txt_roleName.text=roleName;
			_skin.txt_qu.text=zone;
			_skin.txt_type.text=info.jobName;
			_skin.txt_team.text=info.societyName;
		
			updateTxt();
		}
		
		
		private function updateTxt():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			_skin.txt_level.text="Lv"+info.totalStat.level;
			
			_skin.txt_loveName.text=info.loveName.length!=0?info.loveName:"无";
			_skin.Num_zhandouli.number=info.totalStat.getStatValue(CharAttributeType.FIGHTING);
		}
		
		private function updateRole():void
		{
			var player : SceneRole = MainRoleManager.actor;
			if (null == player || !player.usable) {
				return;
			}
			var playerData : RoleData = player.data as RoleData;
			this._showAvatarData.avatarInfo.setBodyResID(playerData.avatarInfo.bodyResID, playerData.avatarInfo.bodyAnimatResID);
			this._showAvatarData.avatarInfo.hairResID = playerData.avatarInfo.hairResID;
			this._showAvatarData.avatarInfo.weaponResID = playerData.avatarInfo.weaponResID;
			this._showAvatarData.avatarInfo.weaponEffectID = playerData.avatarInfo.weaponEffectID;
			this._showAvatarData.avatarInfo.weaponEffectScale = playerData.avatarInfo.weaponEffectScale;
			this._showAvatarData.avatarInfo.deputyWeaponResID = playerData.avatarInfo.deputyWeaponResID;
			
			this._avatar.setRoleData(this._showAvatarData);
			this._avatar.curRole.setScale(1.45);			
		}
	}
}