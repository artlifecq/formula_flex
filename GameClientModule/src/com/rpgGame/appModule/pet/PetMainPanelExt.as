package com.rpgGame.appModule.pet
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.PetSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.common.touch.TouchCtrl;
	import com.rpgGame.appModule.jingmai.sub.TweenScaleScrollUitlExt;
	import com.rpgGame.appModule.pet.sub.PetAttrCon;
	import com.rpgGame.appModule.pet.sub.PetZoneBall;
	import com.rpgGame.core.events.PetEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import away3d.events.Event;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.meiren.MeiRen_Skin;
	
	import starling.display.Sprite;
	
	public class PetMainPanelExt extends SkinUIPanel
	{
		private var _skin:MeiRen_Skin;
		private var _headItems:Array;
		private var _headCon:Sprite;
		private var _tweenS:TweenScaleScrollUitlExt;
		private var _zoneBalls:Vector.<PetZoneBall>;
		private var _curSelectItem:PetHeadItemExt;
		private var _attrCon:PetAttrCon;
		private var _bgIco:IconCDFace;
		private var _touchCtrl:TouchCtrl;
		private var _blessPanel:PetLevelUPPanelExt;
		
		private var goldBuyText:String="";
		private var goldBuyMod:Q_global;
		private var bindGoldBuyMod:Q_global;
		
		private var _modContaner:Inter3DContainer;
		private var _avatar : InterAvatar3D;
		private var _avatarData : RoleData;
		public function PetMainPanelExt()
		{
			_skin=new MeiRen_Skin();
			super(_skin);
			initConfig();
		}
		private function initConfig():void
		{
			_modContaner=new Inter3DContainer();
			this._skin.container.addChildAt(_modContaner,4);
			goldBuyMod=GlobalSheetData.getSettingInfo(845);
			bindGoldBuyMod=GlobalSheetData.getSettingInfo(846);
			var pets:Array=PetCfg.dataArr;
			var len:int=pets.length;
			_headItems=[];
			var tmp:PetHeadItemExt;
			_headCon=new Sprite();
			_headCon.x=25;
			_headCon.y=142;
			this.addChild(_headCon);
			var qPet:Q_girl_pet;
			PetHeadItemExt.clickMe=onPetClick;
			for (var i:int = 0; i < len; i++) 
			{
				qPet=pets[i];
				tmp=new PetHeadItemExt(qPet);
				tmp.x=0;
				tmp.y=(2+tmp.height)*i;
				//tmp.setServerData(Mgr.petMgr.getPet(qPet.q_id));
				_headCon.addChild(tmp);
				_headItems.push(tmp);
			}
			_tweenS=new TweenScaleScrollUitlExt(_headCon,_headItems,_skin.btnPrev,_skin.btnNext,1,109,101*4,101,0.5/4,false);
			_tweenS.setStep(4);
			
			_zoneBalls=new Vector.<PetZoneBall>();
			for (var j:int = 0; j < 9; j++) 
			{
				_zoneBalls.push(new PetZoneBall(_skin["icon"+(j+1)]));
			}
			_attrCon=new PetAttrCon();
			_attrCon.x=687;
			_attrCon.y=257;
			this.addChild(_attrCon);
			
			_bgIco=new IconCDFace(IcoSizeEnum.ICON_42);
			//			_bgIco.x=784;
			//			_bgIco.y=460;
			_bgIco.bindBg(_skin.icon);
			_bgIco.showCD=false;
			_bgIco.selectImgVisible=false;
			this._skin.container.addChild(_bgIco);
			//
			this._skin.btnTiaozhan.addEventListener(Event.TRIGGERED,onFightBtnClick);
			this._skin.btnYuanbao.addEventListener(Event.TRIGGERED,onGoldAdd);
			this._skin.btnLijin.addEventListener(Event.TRIGGERED,onBindGoldAdd);
			//			this._skin.btnJinjie.addEventListener(Event.TRIGGERED,onJinjie);
			
			_touchCtrl=new TouchCtrl(_skin.btnJinjie,onShowLevelUpPanel,onShowAttrAdd,onHideAttrAdd);
			TipTargetManager.show( _skin.btnInfo, TargetTipsMaker.makeTips( TipType.MEIREN_GUIZE_TIP, "" ,true) );
		}
		
		private function onHideAttrAdd():void
		{
			// TODO Auto Generated method stub
			_attrCon.showAttrAdd(false);
		}
		
		private function onShowAttrAdd():void
		{
			// TODO Auto Generated method stub
			_attrCon.showAttrAdd(true);
		}
		
		private function onShowLevelUpPanel():void
		{
			// TODO Auto Generated method stub
			if(_curSelectItem == null) return;
			if(_curSelectItem.data.actived!=1)
			{
				NoticeManager.showNotifyById(90300);
				return;
			}	
			
			if(_blessPanel==null || _blessPanel.stage==null) 
			{
				_blessPanel = new PetLevelUPPanelExt();
				this.addChild(_blessPanel);
				_blessPanel.x=this._skin.width;
				_blessPanel.y=44;
			}
			onStageResize(_stage.stageWidth-_blessPanel.getwidth(),_stage.stageHeight);
			_blessPanel.setData(_curSelectItem.data);
		}
		
		private function onBindGoldAdd(eve:Event):void
		{
			// TODO Auto Generated method stub
			if(isCanChangeNum(2))
			{
				PetSender.reqExaBuyMessage(2);
			}
		}
		
		private function onJinjie(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onGoldAdd(eve:Event):void
		{
			// TODO Auto Generated method stub
			if(isCanChangeNum(1))
			{
				PetSender.reqExaBuyMessage(1);
			}
		}
		
		private function onFightBtnClick(eve:Event):void
		{
			// TODO Auto Generated method stub
			if(_curSelectItem==null) return;
			if (_curSelectItem.data.actived==0) 
			{
				var qPet:Q_girl_pet=_curSelectItem.config;
				//首冲
				if (qPet.q_need_first_pay==0) 
				{
					//充值链接
				}
				else
				{
					//挑战请求
					PetSender.reqEnterNextLevelMessage(qPet.q_zones_id);
				}
			}
			else
			{
				if (Mgr.petMgr.curPetId==_curSelectItem.data.modelId) 
				{
					//休息请求
					PetSender.reqPetDebut(_curSelectItem.data.modelId);
				}
				else
				{
					//出战请求
					PetSender.reqPetDebut(_curSelectItem.data.modelId);
				}
			}			
		}
		
		private function isCanChangeNum(type:int):Boolean
		{
			if(type==1)
			{
				var arr:Array=JSONUtil.decode(goldBuyMod.q_string_value);
				var nowNum:int=Mgr.petMgr.glodNum;
				var maxNum:int=arr.length;
				if(nowNum>=maxNum)
				{
					NoticeManager.showNotifyById(21000);
					return false;
				}
				else if(arr[nowNum]>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD))
				{
					NoticeManager.showNotifyById(21005);
					return false;
				}
			}
			else
			{
				arr=JSONUtil.decode(bindGoldBuyMod.q_string_value);
				nowNum=Mgr.petMgr.bindGlodNum;
				maxNum=arr.length;
				if(nowNum>=maxNum)
				{
					NoticeManager.showNotifyById(21000);
					return false;
				}
				else if(arr[nowNum]>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_GOLD))
				{
					NoticeManager.showNotifyById(2013);
					return false;
				}
			}
			return true;
		}
		
		private function hideZoneBall():void
		{
			_skin.grpIcon.visible=false;
			for each (var ball:PetZoneBall in _zoneBalls) 
			{
				ball.setEffect(false);
			}
		}
		private function showZoneBall(num:int):void
		{
			_skin.grpIcon.visible=true;
			var len:int=_zoneBalls.length;
			for (var i:int = 0; i < len; i++) 
			{
				_zoneBalls[i].setEffect(i<num);
				_zoneBalls[i].setData(_curSelectItem.data,(i+1),true);
			}
		}
		private function onPetClick(item:PetHeadItemExt):void
		{
			// TODO Auto Generated method stub
			selectItem(item);
		}
		private function selectItem(item:PetHeadItemExt,force:Boolean=false):void
		{
			if (!force&&item==_curSelectItem) 
			{
				return;
			}
			if (_curSelectItem!=null) 
			{
				_curSelectItem.setSelect(false);
			}
			_curSelectItem=item;
			showPetModEff(_curSelectItem.data);
			_curSelectItem.setSelect(true);
			showSubPetData(_curSelectItem.data);			
			if(_blessPanel&&_blessPanel.visible&&_curSelectItem.data.actived==1)
			{
				_blessPanel.setData(_curSelectItem.data);
			}
			else
			{
				MCUtil.removeSelf(_blessPanel);
			}
		}
		
		private function showPetModEff(data:PetInfo):void
		{
			var qPet:Q_girl_pet=PetCfg.getPet(data.modelId);
			if(this._avatar==null)
			{
				_avatar=new InterAvatar3D();
				_modContaner.addChild3D(_avatar);
				_avatar.x = 420;
				_avatar.y =490;
			}
			_avatarData=new RoleData(0);		
			this._avatarData.avatarInfo.setBodyResID(qPet.q_panel_show_id, null);
			this._avatar.setRoleData(this._avatarData);
			this._avatar.curRole.setScale(2.3);	
			this._avatar.curRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
		}
		
		private function showSubPetData(data:PetInfo):void
		{
			updateBtnState(data);
			//激活了或者待激活
			if (data.actived>0) 
			{
				hideZoneBall();
			}
			else
			{
				var qPet:Q_girl_pet=PetCfg.getPet(data.modelId);
				//首冲
				if (qPet.q_need_first_pay==0) 
				{
					hideZoneBall();
				}
				else
				{
					showZoneBall(data.passlevel);
				}	
			}
			updateRightData(data);
		}
		private function updateRightData(data:PetInfo):void
		{
			var qPet:Q_girl_pet=PetCfg.getPet(data.modelId);
			if(data.rank==0) data.rank=1;
			if (!qPet) 
			{
				return;
			}
			_skin.uiName.styleName="ui/app/meiren/head_icon/name"+qPet.q_id+".png"
			if (data.actived) 
			{
				_skin.uiLevel.visible=true;
				_skin.uiLevel.styleName="ui/mainui/meirenHead/jieshu/"+data.rank+".png";
			}
			else
			{
				_skin.uiLevel.visible=false;
			}
			//战斗力
			var qPetAdv:Q_girl_advance=PetAdvanceCfg.getPet(data.modelId,data.rank);
			var addid:int=0;
			if (!qPetAdv) 
			{
				return;
			}
			addid=Mgr.petMgr.getAttId(qPetAdv.q_attid_master);
			_skin.NumZhanli.label=FightValueUtil.calFightPowerByAttValue(AttValueConfig.getAttInfoById(addid),MainRoleManager.actorInfo.job)+"";
			var nextAttrId:int=0;
			if(!data.actived||data.rank==qPet.q_max_grade) 
			{
				nextAttrId=0;
			}
			else
			{
				var qPetAdvNext:Q_girl_advance=PetAdvanceCfg.getPet(data.modelId,data.rank+1);
				if (qPetAdvNext) 
				{
					nextAttrId=Mgr.petMgr.getAttId(qPetAdvNext.q_attid_master);
				}
			}
			_attrCon.setData(addid,nextAttrId);
			
			var skill:Q_skill_model=SpellDataManager.getSpellById(qPetAdv.q_skill_id);
			FaceUtil.SetSkillGrid(_bgIco, FaceUtil.chanceSpellToFaceInfo(skill), true);
			//			_bgIco.setIconResName(ClientConfig.getSkillIcon(qPetAdv.q_skill_id.split("_")[0].toString(),IcoSizeEnum.ICON_42));
			if (!data.actived) 
			{
				GrayFilter.gray(_bgIco);
				GrayFilter.gray(_skin.btnJinjie);
			}
			else
			{
				GrayFilter.unGray(_bgIco);
				GrayFilter.unGray(_skin.btnJinjie);
				//最大阶数
			}
			_skin.btnJinjie.visible=data.rank!=qPet.q_max_grade;
			_skin.uiOK.visible=data.rank==qPet.q_max_grade;
			if(_skin.uiOK.visible)
				_skin.uiOK.y=550;
			if (data.rank==qPet.q_max_grade) 
			{
				if (_blessPanel&&this.contains(_blessPanel)) 
				{
					MCUtil.removeSelf(_blessPanel);
				}
			}
		}
		
		private function updateBtnState(pet:PetInfo):void
		{
			_skin.gBuy.visible=false;
			_skin.lbContent.visible=false;
			var tipStr:String="";
			if (pet.actived==0) 
			{
				_skin.lbContent.visible=true;
				var qPet:Q_girl_pet=PetCfg.getPet(pet.modelId);
				//首冲
				if (qPet.q_need_first_pay==0) 
				{
					_skin.btnTiaozhan.label="充值";
					_skin.lbContent.text="参与首冲可获得";
					tipStr="参与首冲可获得";
				}
				else
				{
					_skin.btnTiaozhan.label="挑战";
					_skin.gBuy.visible=true;
					_skin.lbContent.text="一次性通关副本可获得";
					tipStr="点击进入挑战，一次性通关所有关卡可获得美人";
				}
			}
			else
			{
				if (Mgr.petMgr.curPetId==pet.modelId) 
				{
					_skin.btnTiaozhan.label="休息";
					tipStr="点击休息按钮美人停止作战\n无论美人出战与否都会永久提升主角属性";
				}
				else
				{
					_skin.btnTiaozhan.label="出战";
					tipStr="点击出战按钮美人协助作战\n无论美人出战与否都会永久提升主角属性";
				}
			}	
			TipTargetManager.remove(_skin.btnTiaozhan);
			TipTargetManager.show( _skin.btnTiaozhan, TargetTipsMaker.makeSimpleTextTips(tipStr));
		}
		override protected function onShow():void
		{
			EventManager.addEvent(PetEvent.PET_UP_RESULT,onUpdateExp);
			EventManager.addEvent(PetEvent.PET_DATA_CHANGE,onPetChange);
			EventManager.addEvent(PetEvent.PET_BUYNUM_CHANGE,onBuyNumChange);
			EventManager.addEvent(PetEvent.PET_CHANGE,onUpdatePetChuZhanOrXiuzhan);
			super.onShow();
			onBuyNumChange();
			//重新设置数据
			for each (var item:PetHeadItemExt in _headItems) 
			{
				item.setServerData(Mgr.petMgr.getPet(item.config.q_id))
				item.setSelect(false);
			}
			
			var tmp:PetHeadItemExt=null;
			if (_curSelectItem!=null) 
			{
				tmp=_curSelectItem;
			}
			else
			{
				var len:int=_headItems.length;
				var i:int=0;
				var outPet:int=Mgr.petMgr.curPetId;
				//选择出站的
				for (i=0; i < len; i++) 
				{
					if (PetHeadItemExt(_headItems[i]).data.modelId==outPet) 
					{
						tmp=_headItems[i];
						break;
					}
				}
				//选择最大激活的
				if (!tmp) 
				{
					for (i=0; i < len; i++) 
					{
						if (PetHeadItemExt(_headItems[i]).data.actived>0) 
						{
							tmp=_headItems[i];
						}
					}
				}
				//第一个吧
				if (!tmp) 
				{
					tmp=_headItems[0]
				}
			}
			selectItem(tmp);
			_tweenS.scroll2Index(_headItems.indexOf(tmp));
		}
		
		private function onUpdateExp(...arg):void
		{
			if(_curSelectItem)
			{
				var petId:int=arg[0];
				var exp:int=arg[1];
				var isSuccess:int=arg[2];
				if (petId==_curSelectItem.data.modelId) 
				{
					if (isSuccess==1) 
					{
						_curSelectItem.setServerData(Mgr.petMgr.getPet(petId));
						updateRightData(_curSelectItem.data);
					}
				}
			}
		}
		
		private function onPetChange(pet:PetInfo):void
		{
			// TODO Auto Generated method stub
			for each (var item:PetHeadItemExt in _headItems) 
			{
				if (item.data.modelId==pet.modelId) 
				{
					item.setServerData(pet);
					if (item==_curSelectItem) 
					{
						selectItem(item,true);
					}
					break;
				}
			}		
		}		
		
		private function onUpdatePetChuZhanOrXiuzhan():void
		{			
			if(_curSelectItem!=null)
				updateBtnState(_curSelectItem.data);
			for(var i:int=0;i<_headItems.length;i++)
			{
				var item:PetHeadItemExt=_headItems[i] as PetHeadItemExt;
				item.updateIsChuZhan();
			}
		}
		
		private function onBuyNumChange():void
		{
			// TODO Auto Generated method stub
			var price:int;
			var nowNum:int;
			var maxNum:int;
			var arr:Array;
			arr=JSONUtil.decode(goldBuyMod.q_string_value);
			nowNum=Mgr.petMgr.glodNum;
			maxNum=arr.length;
			if(nowNum<maxNum)
			{
				price=arr[nowNum];
				goldBuyText=HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"消耗")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,price.toString())+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"元宝临时提高实力")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"（已使用"+nowNum+"/"+maxNum+"次）\n")+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"可获得伤害加深")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+3%")+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"或防御提升")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+3%");
			}
			else
			{
				goldBuyText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,"已达上限");					
			}
			TipTargetManager.show( _skin.btnYuanbao, TargetTipsMaker.makeSimpleTextTips(goldBuyText));
			
			arr=JSONUtil.decode(bindGoldBuyMod.q_string_value);
			nowNum=Mgr.petMgr.bindGlodNum;
			maxNum=arr.length;
			if(nowNum<maxNum)
			{
				price=arr[nowNum];
				goldBuyText=HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"消耗")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,price.toString())+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"礼金临时提高实力")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"（已使用"+nowNum+"/"+maxNum+"次）\n")+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"可获得伤害加深")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+3%")+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"或防御提升")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+3%");
			}
			else
			{
				goldBuyText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,"已达上限");					
			}
			TipTargetManager.show( _skin.btnLijin, TargetTipsMaker.makeSimpleTextTips(goldBuyText));
		}
		
		override protected function onHide():void
		{
			super.onHide();
			if(_blessPanel)
				MCUtil.removeSelf(_blessPanel);
			if(this._avatar)
			{
				this._avatar.dispose();
				this._avatar=null;
			}
			_curSelectItem=null;
			EventManager.removeEvent(PetEvent.PET_UP_RESULT,onUpdateExp);
			EventManager.removeEvent(PetEvent.PET_DATA_CHANGE,onPetChange);
			EventManager.removeEvent(PetEvent.PET_BUYNUM_CHANGE,onBuyNumChange);
			EventManager.removeEvent(PetEvent.PET_CHANGE,onUpdatePetChuZhanOrXiuzhan);
		}
		public function updatePos():void
		{
			onStageResize(_stage.stageWidth,_stage.stageHeight);
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			var w:int = this.width;
			this.x =(sw - w)/2;
			this.y =(sh - this.height)/2;
		}
		
	}
}