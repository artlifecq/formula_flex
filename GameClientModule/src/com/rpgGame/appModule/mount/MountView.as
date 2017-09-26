package com.rpgGame.appModule.mount
{
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.AttChangeView;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.shop.ItemGetAdvisePanelExt;
	import com.rpgGame.appModule.systemset.TouchToState;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.core.view.ui.tip.vo.SpellDynamicTipdata;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HorseSpellData;
	import com.rpgGame.coreData.clientConfig.Q_horse_skills;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.AttChangeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import away3d.events.Event;
	
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zuoqi.ZuoqiCont_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MountView extends AttChangeView
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
			attChangeTypes=[AttChangeEnum.MOUNT_MODLE];
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
			_mountContent.refreshMode(_mountShowData.mountLevel);
			refeashPropHandler();
			_mountupContent.updataInfo(_mountShowData);
			_mountupContent.updateExp();
			refeashSpellIcon();
			refeashExpHandler();
			initEvent();
			eft=this.playInter3DAt(ClientConfig.getEffect("ui_zuoqizhandouli"),_skin.grpZhanli.x+100,_skin.grpZhanli.y+75,0);
			_skin.container.addChild(_skin.grpZhanli);
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
					//					showUplevel();
					break;
				case "btn_zidong":
					onMouseOut();
					if(_mountShowData.isSelf)
					{
						_mountShowData.isAutoing=true;
						if(HorseManager.instance().eatItemHorse(_mountShowData))
						{
							_mountupContent.isAutoing = true;
							autoReq=TweenLite.delayedCall(0.25,refeashsendMsg);
						}else{
							if(!_mountShowData.canUpLevel())
								showShopPane();
							_mountupContent.isAutoing = false;
							if(autoReq){
								autoReq.kill();
								autoReq=null;
							}
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
					if(autoReq){
						autoReq.kill();
						autoReq=null;
					}
					break;
			}
		}
		
		private var _uplevelSuccess:MountUpLevelSucessPane;
		private var autoReq:TweenLite;
		private var eft:InterObject3D;
		private function showUplevel():void
		{
			if(_uplevelSuccess==null)
			{
				_uplevelSuccess = new MountUpLevelSucessPane();
				_uplevelSuccess.addEventListener(Event.REMOVED_FROM_STAGE,removePropHandler);
				_uplevelSuccess.show();
				_uplevelSuccess.x = int((_uplevelSuccess.stage.stageWidth - _uplevelSuccess.width) / 2);
				_uplevelSuccess.y = int((_uplevelSuccess.stage.stageHeight - _uplevelSuccess.height) / 2);
			}
			_uplevelSuccess.updateinfo(_mountShowData);
			attChangeEft.clear();
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
				var data:SpellDynamicTipdata = TipTargetManager.getTiipsByTarget(_spellIconList[i]) as SpellDynamicTipdata;
				var icon:IconCDFace = _spellIconList[i];
				var qdata:Q_horse_skills = arr[i];
				if(qdata.q_study_needhorselevel>_mountShowData.mountLevel)
				{
					if(icon.filter==null)
					{
						GrayFilter.gray(icon);
						if(data!=null)
						{
							data.isActivation = false;
						}
					}
				}else{
					icon.filter = null;
					if(data!=null)
					{
						data.isActivation = true;
					}
				}
			}
		}
		private function initView():void
		{
			_spellIconList = new Vector.<IconCDFace>();
			var spellList:Vector.<BaseFaceInfo> = HorseManager.instance().spellList; 
			spellList=spellList.sort(short);
			var partner:DisplayObjectContainer = _skin.kuang_1.parent;
			var icon:IconCDFace = IconCDFace.create(IcoSizeEnum.ICON_42);
			icon.showCD=false;
			icon.bindBg(_skin.kuang_1);
			FaceUtil.SetSkillGrid(icon, spellList[0], true);
			partner.addChild(icon);
			_spellIconList.push(icon);
			icon = IconCDFace.create(IcoSizeEnum.ICON_42);
			icon.bindBg(_skin.kuang_2);
			FaceUtil.SetSkillGrid(icon, spellList[1], true);
			partner.addChild(icon);
			_spellIconList.push(icon);
			
			icon = IconCDFace.create(IcoSizeEnum.ICON_42);
			icon.bindBg(_skin.kuang_3);
			FaceUtil.SetSkillGrid(icon, spellList[2], true);
			partner.addChild(icon);
			_spellIconList.push(icon);
			
			_mountContent = new MountContent(_skin);
			_propContent = new MountProps(_skin);
			_mountupContent = new MountUpExpConent(_skin);
			_extraItemList = new Vector.<ExtraButton>();
			_extraItemList.push(new ExtraButton(_skin.btn_zizhidan,_skin.lbZhizi,507));
			_extraItemList.push(new ExtraButton(_skin.btn_chengzhangdan,_skin.lbJinjie,506));
			_touchState = new TouchToState(_skin.lab_xuyaowupin,labTouchHandler);
			
			addNode(RTNodeID.HORSE,RTNodeID.HORSE_UP,_skin.btn_kaishi,110,null);
			
		}
		
		private function short(info1:BaseFaceInfo,info2:BaseFaceInfo):int
		{
			var cfg1:Q_horse_skills = HorseSpellData.getCfgById((info1.data as Q_skill_model).q_skillID);
			var cfg2:Q_horse_skills = HorseSpellData.getCfgById((info2.data as Q_skill_model).q_skillID);
			if(cfg1.q_study_needhorselevel<cfg2.q_study_needhorselevel)return -1;
			else if(cfg1.q_study_needhorselevel>cfg2.q_study_needhorselevel) return 1;
			return 0;
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
			_skin.btn_kaishi.addEventListener(TouchEvent.TOUCH, onTouchHandler);
			_skin.btn_zidong.addEventListener(TouchEvent.TOUCH, onTouchHandler);
			
			EventManager.addEvent(HorseManager.HorseUpLevel,refeashLevel);
			EventManager.addEvent(HorseManager.HorseChangeExp,updateExp);
			EventManager.addEvent(HorseManager.HorseExtraItemNum,refeashPropHandler);
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,addItemHandler);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,addItemHandler);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,addItemHandler);
		}
		
		private function addItemHandler(info:ClientItemInfo):void
		{
			refeashExpHandler();
		}
		
		private function updateExp(exp:int,count:int):void
		{
			refeashExpHandler();
			_mountupContent.updateExp(exp,count);
		}
		
		private function refeashExpHandler():void
		{
			_mountupContent.updataInfo(_mountShowData);
			_propContent.refeashPropValue();
			_mountContent.refreshMode(_mountShowData.mountLevel);
			var bool:Boolean = false;
			for each(var eb:ExtraButton in _extraItemList)
			{
				eb.refeash(_mountShowData);
				if(eb.canShow)
					bool = true;
			}
			_skin.lberror.visible = bool;
			
			setRTNState(RTNodeID.HORSE_UP,_mountShowData.isSelf&&_mountShowData.canUpLevel());
		}
		
		private function refeashsendMsg():void
		{
			if(_mountShowData.isAutoing)
			{
				_mountupContent.isAutoing =HorseManager.instance().eatItemHorse(_mountShowData);
				autoReq=TweenLite.delayedCall(0.25,refeashsendMsg);
			}
		}
		
		private function refeashLevel():void
		{
			_mountupContent.isAutoing = false;
			showUplevel();
			_mountupContent.updateExp();
			if(autoReq){
				autoReq.kill();
				autoReq=null;
			}
		}
		
		
		private function removeEvent():void
		{
			_skin.btn_kaishi.removeEventListener(TouchEvent.TOUCH, onTouchHandler);
			_skin.btn_zidong.removeEventListener(TouchEvent.TOUCH, onTouchHandler);
			EventManager.removeEvent(HorseManager.HorseUpLevel,refeashLevel);
			EventManager.removeEvent(HorseManager.HorseChangeExp,updateExp);
			EventManager.removeEvent(HorseManager.HorseExtraItemNum,refeashPropHandler);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,addItemHandler);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,addItemHandler);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,addItemHandler);
		}
		private function refeashPropHandler():void
		{
			_mountShowData.useExtraItem(HorseManager.instance().useExtraItem1,HorseManager.instance().useExtarItem2);
			_propContent.updataInfo(_mountShowData);
			for each(var eb:ExtraButton in _extraItemList)
			{
				eb.refeash(_mountShowData);
			}
		}
		private function onTouchHandler(e : TouchEvent) : void
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
				_mountContent.refreshMode(_mountShowData.mountLevel);
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
		
		
		override public function hideView():void
		{
			super.hideView();
			ItemGetAdvisePanelExt.hidePanel();
			removeEvent();
			if(autoReq){
				autoReq.kill();
				autoReq=null;
			}
			_mountupContent.isAutoing = false;
			_mountupContent.hide();
			if(eft){
				eft.stop();
				eft.dispose();
				eft=null;
			}
		}
	}
}