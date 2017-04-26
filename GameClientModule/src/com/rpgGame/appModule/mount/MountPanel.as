package com.rpgGame.appModule.mount
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import org.mokylin.skin.app.zuoqi.Shuxing_Item;
	import org.mokylin.skin.app.zuoqi.Zuoqi_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MountPanel extends SkinUIPanel
	{
		private static var isMouseOut : Boolean = true;
		private var _skin:Zuoqi_Skin;
		private var _curShowHorse:int = 0;
		private var _spellIconList:Vector.<IconCDFace>;
		private var _itemIconList:Vector.<IconCDFace>;
		private var _propList:Vector.<MountPropView>;
		private var _currentPower:int;
		private var _nextPower:int;
		private var _mountContent:MountContent;
		public function MountPanel():void
		{
			_skin = new Zuoqi_Skin();
			super(_skin);
			init();
		}
		private function init():void
		{
			initData();
			initView();
			initEvent();
		}
		private function initData():void
		{
			
		}
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			var name : String = target.name;
			switch (name)
			{
				case "btn_kaishi":
					onMouseOut();
					break;
				case "btn_zidong":
					onMouseOut();
					break;
				case "btn_next":
					refeashPropView(_curShowHorse+1);
					break;
				case "btn_prev":
					refeashPropView(_curShowHorse-1);
					break;
			}
		}
		private function initView():void
		{
			_spellIconList = new Vector.<IconCDFace>();
			var spellList:Vector.<BaseFaceInfo> = HorseManager.instance().spellList; 
			var icon:IconCDFace = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_1,IcoSizeEnum.ICON_64);
			FaceUtil.SetSkillGrid(icon, spellList[0], false);
			_spellIconList.push(icon);
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_2,IcoSizeEnum.ICON_64);
			FaceUtil.SetSkillGrid(icon, spellList[1], false);
			_spellIconList.push(icon);
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_3,IcoSizeEnum.ICON_64);
			FaceUtil.SetSkillGrid(icon, spellList[2], false);
			_spellIconList.push(icon);
			
			_propList = new Vector.<MountPropView>();
			_propList.push(new MountPropView(_skin.lab_1.skin as Shuxing_Item,1));
			_propList.push(new MountPropView(_skin.lab_2.skin as Shuxing_Item,2));
			_propList.push(new MountPropView(_skin.lab_3.skin as Shuxing_Item,3));
			_propList.push(new MountPropView(_skin.lab_4.skin as Shuxing_Item,4));
			_propList.push(new MountPropView(_skin.lab_5.skin as Shuxing_Item,5));
			_propList.push(new MountPropView(_skin.lab_6.skin as Shuxing_Item,6));
			_propList.push(new MountPropView(_skin.lab_7.skin as Shuxing_Item,7));
			_propList.push(new MountPropView(_skin.lab_8.skin as Shuxing_Item,8));
			
			_mountContent = new MountContent();
			this.addChildAt(_mountContent,this.getChildIndex(_skin.bg_2)+1);
			refeashPropView(HorseManager.instance().houseLevel);
			refeashPropShow(false);
			
			_itemIconList = new Vector.<IconCDFace>();
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.grid_1,IcoSizeEnum.ICON_48);
			_itemIconList.push(icon);
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.grid_2,IcoSizeEnum.ICON_48);
			_itemIconList.push(icon);
			refeashLevel();
		}
		private function initEvent():void
		{
			_skin.btn_kaishi.addEventListener(TouchEvent.TOUCH, onTouch);
			_skin.btn_zidong.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		private function onTouch(e : TouchEvent) : void
		{
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				onMouseOut();
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				refeashPropView(HorseManager.instance().houseLevel);
				onMouseOver();
				return;
			}
		}
		private function onMouseOver():void
		{
			if(_isSHowNext)
				return ;
			refeashPropShow(true);
			_mountContent.playTarget(true);
		}
		private function onMouseOut():void
		{
			if(!_isSHowNext)
				return ;
			refeashPropShow(false);
			_mountContent.playTarget(false);
		}
		private var _isSHowNext:Boolean = true;
		private function refeashPropShow(bool:Boolean):void
		{
			_isSHowNext = bool;
			var level:int = _curShowHorse;
			if(!bool)
				level -=1;
			_skin.mc_name.gotoAndStop(level);
			_skin.mc_jieshu.gotoAndStop(level);
			for each(var view:MountPropView in _propList)
			{
				view.showUpLevelView(bool);
			}
			if(bool)
			{
				_skin.num_zhandouli.number = _nextPower;
			}else{
				_skin.num_zhandouli.number = _currentPower;
			}
		}
		private function refeashPropView(level:int):void
		{
			if(_curShowHorse==level)
				return ;
			_curShowHorse = level;
			var housedata:Q_horse = HorseConfigData.getMountDataById(_curShowHorse)
			var currentatt:Q_att_values = AttValueConfig.getAttInfoById(int(housedata.q_attid));
			var nextatt:Q_att_values;
			var nextShet:Q_horse = HorseConfigData.getMountDataById(_curShowHorse+1);
			var job:int = MainRoleManager.actorInfo.job;
			_currentPower = FightValueUtil.calFightPowerByAttValue(currentatt,job);
			_skin.num_zhandouli.number = _currentPower;
			if(nextShet!=null)
			{
				nextatt = AttValueConfig.getAttInfoById(nextShet.q_attid);
				_nextPower = FightValueUtil.calFightPowerByAttValue(nextatt,job);
			}
			
			for each(var view:MountPropView in _propList)
			{
				view.updataAtt(currentatt,nextatt);
			}
			_mountContent.addMode(housedata,nextShet);
			_skin.btn_prev.visible = _curShowHorse>1;
			_skin.btn_next.visible = _curShowHorse<HorseConfigData.maxCount;
			_skin.mc_name.gotoAndStop(_curShowHorse-1);
			_skin.mc_jieshu.gotoAndStop(_curShowHorse-1);
		}
		
		private function refeashLevel():void
		{
			var housedata:Q_horse = HorseConfigData.getMountDataById(HorseManager.instance().houseLevel);
			var itemInfos:Object = JSONUtil.decode( housedata.q_update_gift);
			var index:int = 0;
			for each(var iteminfo:Object in itemInfos)
			{
				var itemModeId:int = iteminfo["mod"];
				if(ItemConfig.getQItemByID(itemModeId)==null)
					continue;
				var item:ItemInfo = new ItemInfo();
				item.itemModelId = iteminfo["mod"];
				item.num = iteminfo["num"];
				item.isbind = iteminfo["bind"];
				_itemIconList[index].visible = true;
				FaceUtil.SetSkillGrid(_itemIconList[index], ItemUtil.convertClientItemInfo(item), true);
				index++;
			}
			for(;index<_itemIconList.length;index++)
			{
				_itemIconList[index].visible = false;
			}
		}
	}
}