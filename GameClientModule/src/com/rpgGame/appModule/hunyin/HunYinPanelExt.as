package com.rpgGame.appModule.hunyin
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.HunYinSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.core.events.HunYinEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.SpellDynamicTipdata;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.hunyin.HunYinHuDongData;
	import com.rpgGame.coreData.cfg.hunyin.HunYinSkillData;
	import com.rpgGame.coreData.cfg.hunyin.JieHunJieZiData;
	import com.rpgGame.coreData.clientConfig.Q_advance_wedding;
	import com.rpgGame.coreData.clientConfig.Q_marriage_skills;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.HunYinEnum;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.marriage.message.SCInteractionMessage;
	
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hunyin.HunYin_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class HunYinPanelExt extends SkinUIPanel
	{
		private var _skin:HunYin_Skin;
		private var _rightPanel:HunYinRightPanel;
		
		private var _modEftContaner:Inter3DContainer;		
		private var _moxing:InterObject3D;
		
		private var _skillList:Vector.<IconCDFace>;
		private var _btnstype:Vector.<int>;
		
		private var _hunjietupoPanel:HunJieTuPoPanelExt;
		private var _itemFace:IconCDFace;
		
		private var _btnsonghuaeff:InterObject3D;
		private var _btnyongbaoeff:InterObject3D;
		private var _btnqinweneff:InterObject3D;
		private var _btndongfangeff:InterObject3D;
		
		public function HunYinPanelExt()
		{
			_skin=new HunYin_Skin();
			_rightPanel=new HunYinRightPanel(_skin);
			super(_skin);
			_modEftContaner = new Inter3DContainer();
			_skin.group.addChild(_modEftContaner);
			initView();
			initEff();
		}
		
		private function initView():void
		{		
			_skillList = new Vector.<IconCDFace>();
			var skillMods:Vector.<Q_marriage_skills>=HunYinSkillData.skillLists;
			skillMods=skillMods.sort(short);
			for(var i:int = 0;i < 3;i ++)
			{
				var skill:Q_skill_model = SpellDataManager.getSpellById(skillMods[i].q_id);
				if(skill)
				{
					var info:BaseFaceInfo=new BaseFaceInfo(skill.q_skillID,skill.q_skillID,FaceTypeEnum.SKILL);
					info.icoName=skill.q_icon;
					info.name=skill.q_skillName;
					info.data=skill;
					var ico:IconCDFace = new IconCDFace(IcoSizeEnum.ICON_48);					
					ico.selectImgVisible = false;	
					_skin.container.addChild(ico);
					var uibg:UIAsset = _skin.container.getChildByName("icon"+(i+1)) as UIAsset;
					ico.bindBg(uibg);
					_skillList.push(ico);
					FaceUtil.SetSkillGrid(ico, info, true);
				}
			}
			_btnstype=new Vector.<int>();
			_btnstype.push(HunYinEnum.HD_DONGFANG);
			_btnstype.push(HunYinEnum.HD_QINWEN);
			_btnstype.push(HunYinEnum.HD_SONGHUA);
			_btnstype.push(HunYinEnum.HD_YONGBAO);
			
			_itemFace=new IconCDFace(IcoSizeEnum.ICON_48);
			_itemFace.selectImgVisible=false;	
			_skin.container.addChild(_itemFace);
			_itemFace.bindBg(_skin.icon4);
		}
		
		private function short(cfg1:Q_marriage_skills,cfg2:Q_marriage_skills):int
		{
			if(cfg1.q_study_needjiezilevel<cfg2.q_study_needjiezilevel) return -1;
			else if(cfg1.q_study_needjiezilevel>cfg2.q_study_needjiezilevel) return 1;
			return 0;
		}
		
		private function initEff():void
		{
			_btnsonghuaeff=new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect("ui_dongfang_xuanze"));
			data.forceLoad=true;//ui上的3d特效强制加载
			var unit : RenderUnit3D = _btnsonghuaeff.addRenderUnitWith(data, 0);	
			_btnsonghuaeff.x=500;
			_btnsonghuaeff.y=145;
			unit.addUnitAtComposite(unit);
			_modEftContaner.addChild3D(_btnsonghuaeff);
			_btnsonghuaeff.stop();
			
			_btnyongbaoeff=new InterObject3D();
			data = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect("ui_dongfang_xuanze"));
			data.forceLoad=true;//ui上的3d特效强制加载
			unit = _btnyongbaoeff.addRenderUnitWith(data, 0);	
			_btnyongbaoeff.x=500;
			_btnyongbaoeff.y=216;
			unit.addUnitAtComposite(unit);
			_modEftContaner.addChild3D(_btnyongbaoeff);
			_btnyongbaoeff.stop();
			
			_btnqinweneff=new InterObject3D();
			data = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect("ui_dongfang_xuanze"));
			data.forceLoad=true;//ui上的3d特效强制加载
			unit = _btnqinweneff.addRenderUnitWith(data, 0);	
			_btnqinweneff.x=500;
			_btnqinweneff.y=287;
			unit.addUnitAtComposite(unit);
			_modEftContaner.addChild3D(_btnqinweneff);
			_btnqinweneff.stop();
			
			_btndongfangeff=new InterObject3D();
			data = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect("ui_dongfang_xuanze"));
			data.forceLoad=true;//ui上的3d特效强制加载
			unit = _btndongfangeff.addRenderUnitWith(data, 0);	
			_btndongfangeff.x=500;
			_btndongfangeff.y=358;
			unit.addUnitAtComposite(unit);
			_modEftContaner.addChild3D(_btndongfangeff);
			_btndongfangeff.stop();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnSonghua:
					if(_skin.btnSonghua.filter!=null)
					{
						NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(92002),["今日送花"]);
					}
					else
						HunYinSender.upCSInteractionMessage(HunYinEnum.HD_SONGHUA);
					break;
				case _skin.btnYongbao:
					if(_skin.btnYongbao.filter!=null)
					{
						NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(92002),["今日拥抱"]);
					}
					else
						HunYinSender.upCSInteractionMessage(HunYinEnum.HD_YONGBAO);
					break; 
				case _skin.btnQinwen:
					if(_skin.btnQinwen.filter!=null)
					{
						NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(92002),["今日亲吻"]);
					}
					else
						HunYinSender.upCSInteractionMessage(HunYinEnum.HD_QINWEN);
					break;
				case _skin.btnDongfang:
					if(_skin.btnDongfang.filter!=null)
					{
						NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(92002),["今日洞房"]);
					}
					else
						HunYinSender.upCSInteractionMessage(HunYinEnum.HD_DONGFANG);
					break;
				case _skin.btnFuben:
					AppManager.showApp(AppConstant.HUNYIN_FUBEN);
					break;
				case _skin.btnLihun:
					Mgr.hunyinMgr.showQiuHunTiShiPanel(5,null,Mgr.hunyinMgr.marriageInfos.marriagePlayerName);
					break;
				case _skin.btnLiaotian:
					EventManager.dispatchEvent(ChatEvent.SWITCH_PRIVATE_CHANNEL,Mgr.hunyinMgr.marriageInfos.marriagePlayerId,Mgr.hunyinMgr.marriageInfos.marriagePlayerName);
					break;
				case _skin.btnJishi:
					AppManager.showApp(AppConstant.HUNYIN_RIZHI);
					break;
				case _skin.btnJinjie:
					btnJinJieHandler();
					break;
				case _skin.lbLaoPo:
					onNameHandler(2);
					break;
				case _skin.lbLaoGong:
					onNameHandler(1);
					break;
			}			
		}
		
		override protected function onShow():void
		{
			super.onShow();
			initEvent();
			chackAllBtnState();
			_rightPanel.show();
			setName();
			updateSkill();
			updateJieHunJieZi();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			clearEvent();
			if(_hunjietupoPanel&&_hunjietupoPanel.parent)
				_hunjietupoPanel.hide();
		}
		
		private function initEvent():void
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH,btnHandler);
			EventManager.addEvent(HunYinEvent.HUNYIN_HUDONG,onHuDongHandler);
			EventManager.addEvent(HunYinEvent.HUNYIN_JINJIE,onJinJieHandler);
			EventManager.addEvent(HunYinEvent.HUNYIN_JINJIE_CHENGGONG,onJinJieHandler);
		}
		
		private function clearEvent():void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH,btnHandler);
			EventManager.removeEvent(HunYinEvent.HUNYIN_HUDONG,onHuDongHandler);
			EventManager.removeEvent(HunYinEvent.HUNYIN_JINJIE,onJinJieHandler);
			EventManager.removeEvent(HunYinEvent.HUNYIN_JINJIE_CHENGGONG,onJinJieHandler);
		}
		
		private function chackAllBtnState():void
		{
			for(var i:int=0;i<_btnstype.length;i++)
			{
				checkbtnisCanClick(_btnstype[i]);
			}
		}
		
		//更新戒子显示
		public function updateJieHunJieZi():void
		{
			var info:Q_advance_wedding=JieHunJieZiData.getModByLv(Mgr.hunyinMgr.JieZiLv);		
			var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(info.q_mod_id);
			FaceUtil.SetItemGrid(_itemFace,itemInfo,true,{"lv":Mgr.hunyinMgr.JieZiLv});
			_skin.numJie.label=Mgr.hunyinMgr.JieZiLv.toString();
		}
		
		public function setName():void
		{
			if(MainRoleManager.actorInfo.sex==1)		
			{
				_skin.lbLaoGong.text=MainRoleManager.actorInfo.name;
				_skin.lbLaoPo.text=Mgr.hunyinMgr.marriageInfos?Mgr.hunyinMgr.marriageInfos.marriagePlayerName:"";
			}
			else
			{
				_skin.lbLaoPo.text=MainRoleManager.actorInfo.name;
				_skin.lbLaoGong.text=Mgr.hunyinMgr.marriageInfos?Mgr.hunyinMgr.marriageInfos.marriagePlayerName:"";
			}
		}
		
		public function updateSkill():void
		{
			var list:Vector.<Q_marriage_skills>=HunYinSkillData.skillLists;
			for(var i:int=0;i<list.length;i++)
			{
				var data:SpellDynamicTipdata = TipTargetManager.getTiipsByTarget(_skillList[i]) as SpellDynamicTipdata;
				if(list[i].q_study_needjiezilevel>Mgr.hunyinMgr.JieZiLv)
				{
					GrayFilter.gray(_skillList[i]);
					if(data!=null)
					{
						data.isActivation = false;
					}
				}
				else{
					_skillList[i].filter=null;
					if(data!=null)
					{
						data.isActivation = true;
					}
				}
			}
		}
		
		protected function btnJinJieHandler():void
		{
			if(!Mgr.hunyinMgr.isCanJinJie())
			{
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(92001));
				return;
			}
			if(Mgr.hunyinMgr.isCanJinJie()&&Mgr.hunyinMgr.isNeedTuPo())
			{
				//显示突破面板
				if(_hunjietupoPanel==null||_hunjietupoPanel.stage==null)
					_hunjietupoPanel=HunJieTuPoPanelExt.showTuPoPanel();
				return;
			}
			var p:Point=new Point(this._skin.btnJinjie.x+this._skin.btnJinjie.width/2,this._skin.btnJinjie.y+this._skin.btnJinjie.height/2);
			p=this._skin.btnJinjie.parent.localToGlobal(p);
			p=this._skin.container.globalToLocal(p);
			this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1,null,addComplete);
			HunYinSender.upCSUpGradeMessage(1,0);
		}
		
		private function addComplete(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		protected function checkbtnisCanClick(type:int):void
		{
			var num:int=Mgr.hunyinMgr.gethudongNumByType(type)+1;
			switch(type)
			{
				case HunYinEnum.HD_SONGHUA:
					if(HunYinHuDongData.isCanClick(type,num,Mgr.vipMgr.vipLv))
					{
						_skin.btnSonghua.filter=null;
					}
					else GrayFilter.gray(_skin.btnSonghua);
					var tipStr:String=Mgr.hunyinMgr.getBtnTip(type,num);
					TipTargetManager.remove(_skin.btnSonghua);
					TipTargetManager.show( _skin.btnSonghua, TargetTipsMaker.makeSimpleTextTips(tipStr));
					break;
				case HunYinEnum.HD_YONGBAO:
					if(HunYinHuDongData.isCanClick(type,num,Mgr.vipMgr.vipLv))
					{
						_skin.btnYongbao.filter=null;
					}
					else GrayFilter.gray(_skin.btnYongbao);
					tipStr=Mgr.hunyinMgr.getBtnTip(type,num);
					TipTargetManager.remove(_skin.btnYongbao);
					TipTargetManager.show( _skin.btnYongbao, TargetTipsMaker.makeSimpleTextTips(tipStr));
					break;
				case HunYinEnum.HD_QINWEN:
					if(HunYinHuDongData.isCanClick(type,num,Mgr.vipMgr.vipLv))
					{
						_skin.btnQinwen.filter=null;
					}
					else GrayFilter.gray(_skin.btnQinwen);
					tipStr=Mgr.hunyinMgr.getBtnTip(type,num);
					TipTargetManager.remove(_skin.btnQinwen);
					TipTargetManager.show( _skin.btnQinwen, TargetTipsMaker.makeSimpleTextTips(tipStr));
					break;
				case HunYinEnum.HD_DONGFANG:
					if(HunYinHuDongData.isCanClick(type,num,Mgr.vipMgr.vipLv))
					{
						_skin.btnDongfang.filter=null;
					}
					else GrayFilter.gray(_skin.btnDongfang);
					tipStr=Mgr.hunyinMgr.getBtnTip(type,num);
					TipTargetManager.remove(_skin.btnDongfang);
					TipTargetManager.show( _skin.btnDongfang, TargetTipsMaker.makeSimpleTextTips(tipStr));
					break;
			}
		}
		
		protected function onNameHandler(sex:int):void
		{
			if(MainRoleManager.actorInfo.sex==sex) return;
			var menus : Array = MenuUtil.getPlayerTargetMenu(Mgr.hunyinMgr.marriageInfos.marriagePlayerId.ToGID(), true);
			MenuManager.showMenu(menus, [Mgr.hunyinMgr.marriageInfos.marriagePlayerId.hexValue, Mgr.hunyinMgr.marriageInfos.marriagePlayerName], -1, -1, 80);
		}
		
		protected function onHuDongHandler(msg:SCInteractionMessage=null):void
		{
			if(msg!=null)
			{
				//这里要依据类型显示不同的特效
				var uieff:String;
				switch(msg.interactionInfo.type)
				{
					case HunYinEnum.HD_SONGHUA:
						uieff="ui_songhua";
						break;
					case HunYinEnum.HD_YONGBAO:
						uieff="ui_yongbao";
						break;
					case HunYinEnum.HD_QINWEN:
						uieff="ui_qinwen";
						break;
					case HunYinEnum.HD_DONGFANG:
						uieff="ui_dongfang";
						break;
				}
				UIPopManager.showAlonePopUI(CenterEftPop,uieff);
			}
			_rightPanel.updateBestWishesValue();
			chackAllBtnState();
		}
		
		protected function onJinJieHandler():void
		{
			updateSkill();
			updateJieHunJieZi();
			_rightPanel.showPower(true);
			_rightPanel.updateAttribute();
			_rightPanel.updateBestWishesValue();
		}
		
		protected function btnHandler(e:TouchEvent):void
		{
			var t:Touch=e.getTouch(_skin.btnSonghua);
			if(!t){
				_btnsonghuaeff.stop();
			}
			else
			{
				t=e.getTouch(_skin.btnSonghua,TouchPhase.HOVER);
				if(t){			
					_btnsonghuaeff.play(0);
				}
			}
			
			t=e.getTouch(_skin.btnYongbao);
			if(!t){
				_btnyongbaoeff.stop();;
			}
			else
			{
				t=e.getTouch(_skin.btnYongbao,TouchPhase.HOVER);
				if(t){			
					_btnyongbaoeff.play(0);
				}
			}
			
			t=e.getTouch(_skin.btnQinwen);
			if(!t){
				_btnqinweneff.stop();
			}
			else
			{
				t=e.getTouch(_skin.btnQinwen,TouchPhase.HOVER);
				if(t){			
					_btnqinweneff.play(0);
				}
			}
			
			t=e.getTouch(_skin.btnDongfang);
			if(!t){
				_btndongfangeff.stop();
			}
			else
			{
				t=e.getTouch(_skin.btnDongfang,TouchPhase.HOVER);
				if(t){			
					_btndongfangeff.play(0);
				}
			}
		}
	}
}