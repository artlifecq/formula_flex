package com.rpgGame.appModule.role
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
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
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.app.view.uiComponent.menu.Menu;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.events.AvatarEvent;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangGoods;
	import com.rpgGame.coreData.lang.LangMenu;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import flash.geom.Point;
	
	import app.message.EquipType;
	
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.juese_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

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
		
		private var _zhandouliEftContaner:Inter3DContainer;
		private var _zhandouliEft:InterObject3D;
		
		private var _roleData:HeroData;
		private var isMainRole:Boolean;
		private var otherItems:Vector.<ItemInfo>;
		private var _touchID:int;

		private var startX:Number;
		
		
		public function AvatarView(skin:juese_Skin)
		{
			acceptDropFromContainerIdArr=[ItemContainerID.BackPack];
			_skin=skin;
			_avatarContainer=new Inter3DContainer();
			_zhandouliEftContaner=new Inter3DContainer();
			var index:int=_skin.container.getChildIndex(_skin.weapons);
			_skin.container.addChildAt(_avatarContainer,index);
			_skin.footMsg.addChild(_zhandouliEftContaner);
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
					equipGrids[i].x=310;
					equipGrids[i].y=(i-5)*60;
				}
				_skin.weapons.addChild(equipGrids[i]);
			}
		}
		
		private function getGrid(bg:String):DragDropItem
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_48,bg);
			var grid:DragDropItem = render.getGrid();
//			grid.onTouchEndCallBack = onTouchGrid;
			grid.doubleClickFun=onDoubleClick
			return grid;
		}
		
		private function onDoubleClick(grid:IconCDFace):void
		{
			Menu.GetInstance().hide();
			var item:ClientItemInfo=grid.faceInfo as ClientItemInfo;
			if(item){
				ItemSender.unwearEquip(item.itemInfo.itemId);
			}
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
			_avatar.x = _skin.weapons.x + (_skin.weapons.width >> 1)+20;
			_avatar.y = _skin.weapons.y + _skin.weapons.height+20;
			_avatarContainer.addChild3D(_avatar);
			_showAvatarData = new RoleData(0);
			
			_zhandouliEft= _zhandouliEftContaner.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JIEMIAN_ZHANDOULI),135,28,0);
		}
		
		internal function onTouchTarget(target : DisplayObject):Boolean
		{
			if(_skin.roleZone==target){
				_avatar.curRole.stateMachine.transition(RoleStateType.ACTION_SHOW);
				return true;
			}
			return false;
		}
		
		public function show(data:HeroData,items:Vector.<ItemInfo>=null):void
		{
			otherItems=items;
			_roleData=data;
			initEvent();
			
			isMainRole=MainRoleManager.actorInfo==data;
		
			var gridNum:int=equipGrids.length;
			for(var i:int=0;i<gridNum;i++){
				equipGrids[i].dragAble=isMainRole;
			}
			
			updateRole();
			_avatar.curRole.stateMachine.transition(RoleStateType.ACTION_SHOW);
			updateBaseInfo();
			
			if(isMainRole){
				if(!ItemSender.isReqRole){//等待背包请求装备数据一起返回
					EventManager.addEvent(ItemEvent.ITEM_INIT,initDatas);
				}else{
					updateRoleEquip();
				}
			}else{//获取玩家的装备列表
				updateRoleEquip();
			}
		}
		
		private function getGoodsInfoForOther():Array
		{
			var goodsInfo:Array=[];
			var num:int;
			if(otherItems){
				num=otherItems.length
			}else{
				num=0;
			}
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=ItemUtil.convertClientItemInfo(otherItems[i]);
				goodsInfo.push(info);
			}
			return goodsInfo;
		}
		
		private function updateRoleEquip():void
		{
			var goodsInfo:Array ;
			if(isMainRole){
				goodsInfo= _mgr.getAllItem();
			}else{
				goodsInfo=getGoodsInfoForOther();
			}
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
			grid.setQualityImageIconPoint(6,6);
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
			EventManager.addEvent(ItemEvent.ITEM_DROPED, onDropItem);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);//基本属性改变
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_GET, getItem);
			
			EventManager.addEvent(AvatarEvent.EQUIP_CHANGE, equipChange);
		}
		
		private function equipChange(role:SceneRole):void
		{
			if(role== MainRoleManager.actor){
				updateRole();
			}
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
			EventManager.removeEvent(AvatarEvent.EQUIP_CHANGE, equipChange);
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
//			var zoneInddex:int=info.name.indexOf("]")+1;
//			var zone:String=info.name.substr(0,zoneInddex);
//			var roleName:String=info.name.substr(zoneInddex);
			_skin.txt_roleName.text=_roleData.name;
//			_skin.txt_qu.text=zone;
			_skin.txt_type.text=_roleData.jobName;
			_skin.txt_team.text=_roleData.societyName;
		
			_skin.txt_roleName.width=_skin.txt_roleName.textWidth;
			_skin.txt_roleName.x=(_skin.headMsg.width-_skin.txt_roleName.width)/2;
			
			updateTxt();
		}
		
		
		private function updateTxt():void
		{
			_skin.txt_level.text="Lv"+_roleData.totalStat.level;
			
			_skin.txt_loveName.visible=_skin.LoveIcon.visible=false;
			
			_skin.txt_loveName.text=_roleData.loveName.length!=0?_roleData.loveName:"无";
			_skin.Num_zhandouli.number=_roleData.totalStat.getStatValue(CharAttributeType.FIGHTING);
//			_skin.Num_zhandouli.number=1000;
			_skin.Num_zhandouli.x=128+(135-_skin.Num_zhandouli.width)/2;
		}
		
		private function updateRole():void
		{
			var player : SceneRole = MainRoleManager.actor;
			if (null == player || !player.usable) {
				return;
			}
			
			this._showAvatarData.avatarInfo.setBodyResID(_roleData.avatarInfo.bodyResID, _roleData.avatarInfo.bodyAnimatResID);
			this._showAvatarData.avatarInfo.hairResID = _roleData.avatarInfo.hairResID;
			this._showAvatarData.avatarInfo.weaponResID = _roleData.avatarInfo.weaponResID;
			this._showAvatarData.avatarInfo.weaponEffectID = _roleData.avatarInfo.weaponEffectID;
			this._showAvatarData.avatarInfo.weaponEffectScale = _roleData.avatarInfo.weaponEffectScale;
			this._showAvatarData.avatarInfo.deputyWeaponResID = _roleData.avatarInfo.deputyWeaponResID;
			this._showAvatarData.avatarInfo.deputyWeaponEffectID=_roleData.avatarInfo.deputyWeaponEffectID;
			this._showAvatarData.avatarInfo.deputyWeaponEffectScale=_roleData.avatarInfo.deputyWeaponEffectScale;
			
			this._avatar.setRoleData(this._showAvatarData);
			this._avatar.curRole.setScale(1.7);			
		}
		
		public function onTouch(e:TouchEvent):void
		{
			var touch : Touch;
			if(_touchID!=-1){
				touch = e.getTouch(_skin.roleZone,null,this._touchID);
				if (!touch)
					return;
				if (touch.phase == TouchPhase.MOVED)
				{
					var movex:Number=touch.globalX-startX;
					//this._avatar.curRole.rotationY=movex;
                    this._avatar.rotationY = movex;
				}else if (touch.phase == TouchPhase.ENDED)	{
					this._touchID = -1;
					//this._avatar.curRole.rotationY=0;
                    this._avatar.rotationY = 0;
				}
			}else{
				touch = e.getTouch(_skin.roleZone, TouchPhase.BEGAN);
				if(touch){
					this._touchID=touch.id;
					startX=touch.globalX;
				}
			}
		}
	}
}
