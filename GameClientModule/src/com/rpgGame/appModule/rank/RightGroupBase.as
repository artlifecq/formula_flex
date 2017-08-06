package com.rpgGame.appModule.rank
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.JunJieData;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.junjie.bean.JunJieInfo;
	import com.rpgGame.netData.player.bean.PlayerBriefInfo;
	import com.rpgGame.netData.top.bean.TopInfo;
	
	import app.message.EquipType;
	
	import away3d.events.Event;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;

	public class RightGroupBase
	{
		protected var _skin:PaiHang_Right;
		protected var _type:int;
		protected var _topInfo:TopInfo;
		protected var _modleContent:Inter3DContainer;
		protected var _avatar:UIAvatar3D;
		private var equipGrids:Vector.<DragDropItem>;
		private var _vipIcon:DragDropItem;
		private var _marryIcon:DragDropItem;
		private var equipNum:int=10;
		private var bgList:Array=[GridBGType.EQUIP_WEAPON,GridBGType.EQUIP_HELM,GridBGType.EQUIP_ARMOR,GridBGType.EQUIP_LEGHARNESS,GridBGType.EQUIP_SHOE,GridBGType.EQUIP_SCAPULA,
			GridBGType.EQUIP_RING,GridBGType.EQUIP_NECKLACE,GridBGType.EQUIP_BRACER,GridBGType.EQUIP_JADE];
		private var equipsTypes:Array=[EquipType.WEAPON,EquipType.HELM,EquipType.ARMOR,EquipType.LEGHARNESS,EquipType.SHOE,EquipType.SCAPULA,
			EquipType.RING,EquipType.NECKLACE,EquipType.BRACER,EquipType.JADE];
		 
		private var _mgr:RoleEquipmentManager;
		private var listDatas:ListCollection;
		private var containerId:int=ItemContainerID.Role;
		
		protected var _power:int;
		protected var _scale:Number = 1.7;
		public function RightGroupBase(skin:PaiHang_Right,type:int)
		{
			_skin = skin;
			_type = type;
			initView();
		}
		private var _lbName:Label;
		protected function initView():void
		{
			if(_type == RankListType.MOUNT_TYPE)
			{
				_skin.bg_img.styleName = "ui/big_bg/paihangbang/bg_zuoqi.png";
			}else if(_type == RankListType.BEAUTY_TYPE){
				_skin.bg_img.styleName = "ui/big_bg/paihangbang/bg_meiren.png";
			}else{
				_skin.bg_img.styleName = "ui/big_bg/paihangbang/bg0.png";
			}
			refeashEmptyData();
			_modleContent = new Inter3DContainer();
			_skin.grpRight.addChildAt(_modleContent,4);
			_skin.headName.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			_skin.headName.addEventListener(Event.RESIZE,sizeHandler);
			_avatar = new UIAvatar3D(_skin.content,_scale);
		}
		private function sizeHandler(e:Event):void
		{
			_skin.headName.x = (_skin.grpHead.width-_skin.headName.width)/2;
		}
		private function refeashEmptyData():void
		{
			_skin.grpHead.visible = false;
			_skin.gprNo.visible = true;
			_skin.grpKillIcon.visible = false;
			_skin.weapons.visible = false;
			_skin.grpZhanli.visible = false;
		}
		
		
		public function updateModle(info:TopInfo):void
		{
			_topInfo = info; 
			if(_topInfo==null)
			{
				refeashEmptyData();
			}else{
				_skin.gprNo.visible = false;
				refeashValue();
			}
		}
		
		private function refeashValue():void
		{
			initData();
			refeashName();
			refeashModle();
			refeashJunjie();
			refeashEquip();
			refeashSkill();
			refeashPower();
		}
		
		private function setVipData(vip:int):void
		{
			TipTargetManager.remove(_vipIcon);
			if (vip>0) 
			{
				_vipIcon.setIconResName(ClientConfig.getItemIcon(ItemConfig.getQItemByID(VipCfg.getVip(vip).q_mo_tokenID).q_icon+"",IcoSizeEnum.ICON_48));
				TipTargetManager.show(_vipIcon,TargetTipsMaker.makeTips(TipType.VIP_LEVEL_TIP,new DynamicTipData(vip)));
			}
			else
			{
				_vipIcon.clear();
				TipTargetManager.show(_vipIcon,TargetTipsMaker.makeTips(TipType.VIP_NONE_TIP,null));
			}
		}
		private var _lastId:int = 0;
		private var _chenhaoEft:InterObject3D;
		protected function refeashJunjie():void
		{
			if(_lastId == _topInfo.playerBriefInfo.junJieModelId)
				return ;
			_lastId = _topInfo.playerBriefInfo.junJieModelId;
			if(_chenhaoEft!=null)
			{
				_chenhaoEft.dispose();
			}
			var info:JunJieInfo=Mgr.junjieMgr.getInfoById(_lastId);
			if(info == null)
				return ;
			var effName:String=JunJieData.getEffById(info.modelId);
			_chenhaoEft=_modleContent.playInter3DAt(ClientConfig.getEffect(effName),200,100,0);
		}
		
		
		protected function refeashSkill():void
		{
			_skin.grpKillIcon.visible = false;
		}
		
		protected function refeashPower():void
		{
			_skin.NumZhanli.number = _power;
			_skin.grpZhanli.visible = true;
		}
		
		protected function initData():void
		{
			_power = _topInfo.playerBriefInfo.fightpower;
		}
		
		protected function refeashName():void
		{
			_skin.grpHead.visible = true;
			_skin.headName.visible = false;
			_skin.lbName.visible = true;
			_skin.lbName.text = _topInfo.playername;
		}
		protected function refeashModle():void
		{
			this._avatar.updateWithPlayerBriefInfo( _topInfo.playerBriefInfo)
		}
		
		protected function refeashEquip():void
		{
			_skin.weapons.visible = true;
			if(equipGrids==null)
			{
				initEquips();
			}
			
			for(var i:int=0;i<equipNum;i++){
				setGridInfo(i,null);
			}
			for(i=0;i<equipNum;i++){
				if(_topInfo.playerBriefInfo.equips.length<= i)
					break;
				var item:ItemInfo = _topInfo.playerBriefInfo.equips[i];
				if(item!=null)
				{
					var info:ClientItemInfo=ItemUtil.convertClientItemInfo(item);
					var index:int=equipsTypes.indexOf(info.qItem.q_kind);
					info.index=index;
					setGridInfo(index,info);
				}
			}
			setVipData(_topInfo.vipId);
		}
		
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
			var grid:DragDropItem = equipGrids[index];
			if(!grid)return;
			grid.gridInfo = gridInfo;
		}
		
		private function initEquips():void
		{
			equipGrids=new Vector.<DragDropItem>();
			for(var i:int=0;i<equipNum;i++){
				equipGrids.push(getGrid(bgList[i]));
				if(i<5){
					equipGrids[i].x=7;
					equipGrids[i].y=i*59;
				}else{
					equipGrids[i].x=301;
					equipGrids[i].y=(i-5)*59;
				}
				equipGrids[i].dragAble = false;
				_skin.weapons.addChild(equipGrids[i]);
			}
			_vipIcon=new DragDropItem(IcoSizeEnum.ICON_48,-1);
			/*_vipIcon.x=301;
			_vipIcon.y=(10-5)*59;*/
			_vipIcon.bindBg(_skin.Icbg11);
			_skin.weapons.addChild(_vipIcon);
			
			_marryIcon=new DragDropItem(IcoSizeEnum.ICON_48,-1);
			/*_marryIcon.x=7;
			_marryIcon.y=5*59;*/
			_marryIcon.bindBg(_skin.Icbg10);
			_skin.weapons.addChild(_marryIcon);
			
			_mgr=RoleEquipmentManager.instance;
			setGridsCount(equipNum);
		}
		private function setGridsCount(count:int):void
		{
			_mgr.setGridNum(count);
			listDatas=_mgr.gridInfoDatas;
			
			for (var i:int=0; i<equipNum; i++)
			{
				equipGrids[i].gridInfo=listDatas.getItemAt(i) as GridInfo;
			}
		}
		private function getGrid(bg:String):DragDropItem
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_48,bg);
			var grid:DragDropItem = render.getGrid();
			return grid;
		}
		
	}
}