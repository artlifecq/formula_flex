package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.fight.spell.NumberChangeEffect;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.shop.ItemGetAdvisePanelExt;
	import com.rpgGame.appModule.systemset.TouchToState;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.HorseSpellData;
	import com.rpgGame.coreData.clientConfig.Q_horse_skills;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import away3d.events.Event;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zuoqi.ZuoqiCont_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MountView extends ViewUI
	{
		private static var isMouseOut : Boolean = true;
		private var _skin:ZuoqiCont_Skin;
		private var _spellIconList:Vector.<IconCDFace>;
		private var _mountContent:MountContent;
		private var _propContent:MountProps;
		private var _mountupContent:MountUpExpConent;
		private var _mountShowData:MountShowData;
		private var _extraItemList:Vector.<ExtraButton>;
		private var _touchState:TouchToState;
		public function MountView():void
		{
			_skin = new ZuoqiCont_Skin();
			super(_skin);
			init();
		}
		private function init():void
		{
			_mountShowData = new MountShowData();
			initView();
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			_mountShowData.heroJob = MainRoleManager.actorInfo.job;
			_mountShowData.horsedataInfo =  HorseManager.instance().horsedataInfo;
			_mountContent.refeashMode(_mountShowData.mountLevel);
			refeashPropHandler();
			/*_propContent.refeashPropShow(false);
			_mountupContent.updataInfo(_mountShowData);*/
			refeashExpHandler();
			refeashSpellIcon();
			_mountupContent.isAutoing = false;
			initEvent();
		}
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			var name : String = target.name;
			switch (name)
			{
				case "btn_kaishi":
					onMouseOut();
					if(_mountShowData.isSelf)
					{
						if(!HorseManager.instance().eatItemHorse(_mountShowData))
						{
							if(!_mountShowData.canUpLevel())
								showShopPane();
						}
						_mountupContent.isAutoing = false;
					}
					break;
				case "btn_zidong":
					onMouseOut();
					if(_mountShowData.isSelf)
					{
						if(HorseManager.instance().eatItemHorse(_mountShowData))
						{
							_mountupContent.isAutoing = true;
						}else{
							if(!_mountShowData.canUpLevel())
								showShopPane();
							_mountupContent.isAutoing = false;
						}
					}
					break;
				case "btn_next":
					_mountContent.buttonRight();
					break;
				case "btn_prev":
					_mountContent.buttonLeft();
					break;
				case "btn_tingzhi":
					_mountupContent.isAutoing = false;
					break;
			}
		}
		
		private var _uplevelSuccess:MountUpLevelSucessPane;
		private function showUplevel():void
		{
			if(_uplevelSuccess==null)
			{
				_uplevelSuccess = new MountUpLevelSucessPane();
				_uplevelSuccess.addEventListener(Event.REMOVED_FROM_STAGE,removePropHandler);
				StarlingLayerManager.topUILayer.addChild(_uplevelSuccess);
				_uplevelSuccess.x = int((_uplevelSuccess.stage.stageWidth - _uplevelSuccess.width) / 2);
				_uplevelSuccess.y = int((_uplevelSuccess.stage.stageHeight - _uplevelSuccess.height) / 2);
			}
			_uplevelSuccess.updateinfo(_mountShowData);
			
		}
		private function removePropHandler(e:Event):void
		{
			_uplevelSuccess =  null;
			refeashSpellIcon();
			refeashExpHandler();
		}
		
		private function refeashSpellIcon():void
		{
			var arr:Array = HorseSpellData.allSpell;
			for(var i:int = 0;i<_spellIconList.length;i++)
			{
				var icon:IconCDFace = _spellIconList[i];
				var qdata:Q_horse_skills = arr[i];
				if(qdata.q_study_needhorselevel>_mountShowData.mountLevel)
				{
					if(icon.filter==null)
					{
						GrayFilter.gray(icon);
					}
				}else{
					icon.filter = null;
				}
			}
		}
		private function initView():void
		{
			_spellIconList = new Vector.<IconCDFace>();
			var spellList:Vector.<BaseFaceInfo> = HorseManager.instance().spellList; 
			var icon:IconCDFace = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_1,IcoSizeEnum.ICON_48);
			FaceUtil.SetSkillGrid(icon, spellList[0], true);
			icon.setIconPoint(6,6);
			_spellIconList.push(icon);
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_2,IcoSizeEnum.ICON_48);
			FaceUtil.SetSkillGrid(icon, spellList[1], true);
			icon.setIconPoint(6,6);
			_spellIconList.push(icon);
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_3,IcoSizeEnum.ICON_48);
			FaceUtil.SetSkillGrid(icon, spellList[2], true);
			icon.setIconPoint(6,6);
			_spellIconList.push(icon);
			
			_mountContent = new MountContent(_skin);
			_propContent = new MountProps(_skin);
			_mountupContent = new MountUpExpConent(_skin);
			_extraItemList = new Vector.<ExtraButton>();
			_extraItemList.push(new ExtraButton(_skin.btn_zizhidan,506));
			_extraItemList.push(new ExtraButton(_skin.btn_chengzhangdan,507));
			_touchState = new TouchToState(_skin.lab_xuyaowupin,labTouchHandler);
			
			addNode(RTNodeID.HORSE,RTNodeID.HORSE_UP,_skin.btn_kaishi,110,null);
		
		}
		private function labTouchHandler(touch:Touch):void
		{
			if(touch.phase!= TouchPhase.ENDED)
				return ;
			showShopPane();
		}
		private function showShopPane():void
		{
			MountPanel(this.parent).buyItem(_mountShowData.upLevelItem.qItem.q_id);
		}
		
		private function initEvent():void
		{
			_skin.btn_kaishi.addEventListener(TouchEvent.TOUCH, onTouch);
			_skin.btn_zidong.addEventListener(TouchEvent.TOUCH, onTouch);
			EventManager.addEvent(HorseManager.HorseUpLevel,refeashLevel);
			EventManager.addEvent(HorseManager.HorseChangeExp,refeashExpHandler);
			EventManager.addEvent(HorseManager.HorseExtraItemNum,refeashPropHandler);
			EventManager.addEvent(ItemEvent.ITEM_ADD,addItemHandler);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,addItemHandler);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,addItemHandler);
		}
		
		private function addItemHandler(info:ClientItemInfo):void
		{
			if(info.cfgId!= _mountShowData.upLevelItem.cfgId)
				return ;
			refeashExpHandler();
		}
		private function refeashExpHandler():void
		{
			_mountupContent.updataInfo(_mountShowData);
			_propContent.refeashPropValue();
			_mountContent.refeashMode(_mountShowData.mountLevel);
			for each(var eb:ExtraButton in _extraItemList)
			{
				eb.refeash(_mountShowData);
			}
			if(_mountShowData.isAutoing)
			{
				_mountupContent.isAutoing =HorseManager.instance().eatItemHorse(_mountShowData)
			}
			setRTNState(RTNodeID.HORSE_UP,_mountShowData.isSelf&&_mountShowData.canUpLevel());
		}
		private function refeashLevel():void
		{
			_mountupContent.isAutoing = false;
			showUplevel();
		}
		private function removeEvent():void
		{
			_skin.btn_kaishi.removeEventListener(TouchEvent.TOUCH, onTouch);
			_skin.btn_zidong.removeEventListener(TouchEvent.TOUCH, onTouch);
			EventManager.removeEvent(HorseManager.HorseUpLevel,refeashLevel);
			EventManager.removeEvent(HorseManager.HorseChangeExp,refeashExpHandler);
			EventManager.removeEvent(HorseManager.HorseExtraItemNum,refeashPropHandler);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,addItemHandler);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,addItemHandler);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,addItemHandler);
		}
		private function refeashPropHandler():void
		{
			_mountShowData.useExtraItem(HorseManager.instance().useExtraItem1,HorseManager.instance().useExtarItem2);
			_propContent.updataInfo(_mountShowData);
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
				_mountContent.refeashMode(_mountShowData.mountLevel);
				onMouseOver();
				return;
			}
		}
		private function onMouseOver():void
		{
			_mountContent.playTarget(true);
			_propContent.refeashPropShow(true);
		}
		private function onMouseOut():void
		{
			_mountContent.playTarget(false);
			_propContent.refeashPropShow(false);
		}
		
		
		override public function hide():void
		{
			//			if(_shopPane!=null)
			//			{
			//				_shopPane.removeEventListener(Event.REMOVED,panleremoveFormSatgeHander);
			//				if(_shopPane.parent!=null)
			//					_shopPane.parent.removeChild(_shopPane,true);
			//				_shopPane = null;
			//			}
			ItemGetAdvisePanelExt.hidePanel();
			removeEvent();
			super.hide();
		}
	}
}