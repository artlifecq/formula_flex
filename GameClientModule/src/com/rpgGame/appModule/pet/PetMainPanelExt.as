package com.rpgGame.appModule.pet
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.PetManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.appModule.common.touch.TouchCtrl;
	import com.rpgGame.appModule.jingmai.sub.TweenScaleScrollUitlExt;
	import com.rpgGame.appModule.pet.sub.PetAttrCon;
	import com.rpgGame.appModule.pet.sub.PetZoneBall;
	import com.rpgGame.core.events.PetEvent;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
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
		private var _bgIco:BgIcon;
		private var _touchCtrl:TouchCtrl;
		private var _blessPanel:PetLevelUPPanelExt;
		public function PetMainPanelExt()
		{
			_skin=new MeiRen_Skin();
			super(_skin);
			initConfig();
		}
		private function initConfig():void
		{
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
			
			_bgIco=new BgIcon(IcoSizeEnum.ICON_42);
			_skin.icon.addChild(_bgIco);
			//
			this._skin.btnTiaozhan.addEventListener(Event.TRIGGERED,onFightBtnClick);
			this._skin.btnYuanbao.addEventListener(Event.TRIGGERED,onGoldAdd);
			this._skin.btnLijin.addEventListener(Event.TRIGGERED,onBindGoldAdd);
			this._skin.btnJinjie.addEventListener(Event.TRIGGERED,onJinjie);
			
			_touchCtrl=new TouchCtrl(_skin.btnJinjie,onShowLevelUpPanel,onShowAttrAdd,onHideAttrAdd);
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
			
		}
		private function onBindGoldAdd(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onJinjie(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		private function onGoldAdd(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onFightBtnClick(eve:Event):void
		{
			// TODO Auto Generated method stub
			
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
			_curSelectItem.setSelect(true);
			showSubPetData(_curSelectItem.data);
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
			if (!qPet) 
			{
				return;
			}
			_skin.uiName.styleName="ui/app/meiren/head_icon/name"+qPet.q_id+".png"
			if (data.actived) 
			{
				_skin.uiLevel.visible=true;
				_skin.uiLevel.styleName="ui/app/meiren/jieshu/"+data.rank+".png";
			}
			else
			{
				_skin.uiLevel.visible=false;
			}
			//战斗力
			var qPetAdv:Q_girl_advance=PetAdvanceCfg.getPet(data.modelId,data.rank);
			if (!qPetAdv) 
			{
				return;
			}
			_skin.NumZhanli.label=FightValueUtil.calFightPowerByAttValue(AttValueConfig.getAttInfoById(qPetAdv.q_attid_master),MainRoleManager.actorInfo.job)+"";
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
					nextAttrId=qPetAdvNext.q_attid_master;
				}
			}
			_attrCon.setData(qPetAdv.q_attid_master,nextAttrId);
			_bgIco.setIconResName(ClientConfig.getSkillIcon(qPetAdv.q_skill_id.split("_")[0].toString(),IcoSizeEnum.ICON_42));
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
			if (data.rank==qPet.q_max_grade) 
			{
				if (_blessPanel&&this.contains(_blessPanel)) 
				{
					MCUtil.removeSelf(_blessPanel);
					updatePos();
				}
			}
		}
		private function updateBtnState(pet:PetInfo):void
		{
			_skin.gBuy.visible=false;
			_skin.lbContent.visible=false;
			if (pet.actived==0) 
			{
				_skin.lbContent.visible=true;
				var qPet:Q_girl_pet=PetCfg.getPet(pet.modelId);
				//首冲
				if (qPet.q_need_first_pay==0) 
				{
					_skin.btnTiaozhan.label="充值";
					_skin.lbContent.text="参与首冲可获得";
				}
				else
				{
					_skin.btnTiaozhan.label="挑战";
					_skin.gBuy.visible=true;
					_skin.lbContent.text="一次性通关副本可获得";
				}
			}
			else
			{
				if (Mgr.petMgr.curPetId==pet.modelId) 
				{
					_skin.btnTiaozhan.label="休息";
				}
				else
				{
					_skin.btnTiaozhan.label="出站";
				}
			}
		}
		override protected function onShow():void
		{
			EventManager.addEvent(PetEvent.PET_DATA_CHANGE,onPetChange);
			super.onShow();
			//重新设置数据
			for each (var item:PetHeadItemExt in _headItems) 
			{
				item.setServerData(Mgr.petMgr.getPet(item.config.q_id))
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
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(PetEvent.PET_DATA_CHANGE,onPetChange);
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