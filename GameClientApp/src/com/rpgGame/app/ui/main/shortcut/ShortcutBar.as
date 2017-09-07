package com.rpgGame.app.ui.main.shortcut {
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.society.SocietyEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.cfg.LostSkillUpData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_up;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.lang.LangUI_2;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.shortcut_Skin;
	
	import starling.display.DisplayObject;
	
	public class ShortcutBar extends SkinUI {
		
		private var autoBar:AutoBar;
		private var skillBar : ShortcutSkillBar;
		private var singBar : SingBar;
		private var _skin : shortcut_Skin;
		
		private var _jumpState:Vector.<UIAsset>;
		
		private var renderUint:RenderUnit3D;
		private var _rollprogress:DodgeProgress;
		private var _jinzhencontent:Inter3DContainer;
		private var _jinzhenList:Vector.<JinZhenControl>;
		
		private var _shortcutMessageBar:ShortcutMessageBar;
		
		public function ShortcutBar() {
			this._skin = new shortcut_Skin();
			super(this._skin);
			
			init();
		}
		public function skin():shortcut_Skin
		{
			return _skin;
		}
		public function getSkillGridSeat(index:int):Point
		{
			return skillBar.getSkillGridSeat(index);
		}
		
		private function useJump():void
		{
			var index:int=0;
			while(index<3){
				if(_jumpState[index].visible){
					_jumpState[index].visible=false;
					break;
				}
				index++;
			}
		}
		
		public function addChild3DAt(child : InterObject3D,index:int) : void
		{
			this.addChildAt(child,index);
			if (!_inter3DObjs)
			{
				_inter3DObjs = new Vector.<InterObject3D>();
			}
			if (_inter3DObjs.indexOf(child) < 0)
			{
				_inter3DObjs.push(child);
				
				_numChildren3D++;
			}
			child.start();
		}
		private function init() : void
		{
			autoBar=new AutoBar();
			this._skin.Icons.addChild(autoBar);
			skillBar = new ShortcutSkillBar(this);
			this._skin.Icons.addChildAt(skillBar,0);
			singBar= new SingBar();
			this._skin.Icons.addChild(singBar);
			
			_shortcutMessageBar=ShortcutMessageBar.instence;
			
			_rollprogress = new DodgeProgress(this._skin);
			var leftp:HpPropgressBar = new HpPropgressBar(this,0,_skin);
			var rightp:HpPropgressBar = new HpPropgressBar(this,1,_skin);
			
			initExp();
			addSheHuiTab();
			LostSkillEffect.instance().bind(_skin.btn_juexue);
			refeashState();
			//			if (!ClientConfig.isBanShu)
			//			{				
			//				TipTargetManager.show(_skin.btnBackpack, TargetTipsMaker.makeSimpleTextTips("背包<br/>快捷键：B"));
			//				TipTargetManager.show(_skin.btnRole, TargetTipsMaker.makeSimpleTextTips("人物<br/>快捷键：C"));
			//				TipTargetManager.show(_skin.btnHaoYou, TargetTipsMaker.makeSimpleTextTips("好友<br/>快捷键：F"));
			//				TipTargetManager.show(_skin.btnZudui, TargetTipsMaker.makeSimpleTextTips("队伍<br/>快捷键：P"));
			//				TipTargetManager.show(_skin.btnSheHui, TargetTipsMaker.makeSimpleTextTips("帮派"));
			//				
			//				TipTargetManager.show(_skin.btnTask, TargetTipsMaker.makeSimpleTextTips("任务<br/>快捷键：L"));
			//				TipTargetManager.show(_skin.btnSpell, TargetTipsMaker.makeSimpleTextTips("技能<br/>快捷键：V"));
			//				TipTargetManager.show(_skin.btnMount, TargetTipsMaker.makeSimpleTextTips("坐骑<br/>快捷键：N"));
			//				TipTargetManager.show(_skin.btnChengJiu, TargetTipsMaker.makeSimpleTextTips("社会<br/>快捷键：J"));
			//				TipTargetManager.show(_skin.btnSheHui, TargetTipsMaker.makeSimpleTextTips("装备<br/>快捷键：Q"));
			//				TipTargetManager.show(_skin.btnShangDian, TargetTipsMaker.makeSimpleTextTips("商店<br/>快捷键：O"));
			//			}
			
			EventManager.addEvent(SocietyEvent.SOCIETY_APPROVE_CHANGE, addSheHuiTab);
			
			if(MainRoleManager.actorInfo.job == JobEnum.ROLE_4_TYPE)
			{
				_jinzhencontent = new Inter3DContainer();
				_skin.jingzhen_yijia.addChild(_jinzhencontent);
				_jinzhenList = new Vector.<JinZhenControl>();
				_jinzhenList.push(new JinZhenControl(_jinzhencontent,0));
				_jinzhenList.push(new JinZhenControl(_jinzhencontent,1));
				_jinzhenList.push(new JinZhenControl(_jinzhencontent,2));
				_jinzhenList.push(new JinZhenControl(_jinzhencontent,3));
				_jinzhenList.push(new JinZhenControl(_jinzhencontent,4));
				EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,refeashJinzhen);
			}
			refeashJinzhen(CharAttributeType.RES_JING_ZHENG);
			
			EventManager.addEvent(LostSkillManager.LostSkill_ChangeSkillId,refeashState);
			EventManager.addEvent(LostSkillManager.LostSkill_UpLevelSkillId,refeashState);
		}
		
		
		private function refeashState():void
		{
			if(TipTargetManager.hasTipsEventListener(_skin.btn_juexue))
				TipTargetManager.remove(_skin.btn_juexue);
			
			var datas:Array = LostSkillData.datas;
			var currentdata:Q_lostskill_open = LostSkillData.getModeInfoById(LostSkillManager.instance().curSkillId);
			if(currentdata == null)
			{
				TipTargetManager.show(_skin.btn_juexue,TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangUI_2.Lostskill_Opentips).replace("$",LostSkillManager.instance().openLevel)));
				_skin.mc_juexue.gotoAndStop(0);
			}else{
				TipTargetManager.show( _skin.btn_juexue, TargetTipsMaker.makeTips( TipType.LOSTSKILL_TIP, currentdata));
				var state:SkillStateInfo = LostSkillManager.instance().getSkillStateInfoById(currentdata.q_id);
				var currentupdate:Q_lostskill_up = LostSkillUpData.getDatabyIdAndLevel(state.skillId,state.level);
				var index:int = datas.indexOf(currentdata);
				_skin.mc_juexue.gotoAndStop(index+1);
			}
		}
		private function refeashJinzhen(type:int):void
		{
			if(MainRoleManager.actorInfo.job!= JobEnum.ROLE_4_TYPE)
			{
				this._skin.jingzhen_yijia.visible=false;
				if(!EventManager.hasEvent(MainPlayerEvent.STAT_RES_CHANGE,refeashJinzhen))
				{
					EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,refeashJinzhen)
				}
				TipTargetManager.show(_skin.jingzhen_yijia, null);
				return ;
			}
			if(type != CharAttributeType.RES_JING_ZHENG)
				return ;
			this._skin.jingzhen_yijia.visible=true;
			var count:int = MainRoleManager.actorInfo.totalStat.getResData(type);
			for(var i:int = 0;i<_jinzhenList.length;i++)
			{
				_jinzhenList[i].visible( i<count);
			}
			_skin.lbl_lastNum.text = count.toString()+"/5";
			var Msg:String = "金针："+count+"/5";
			Msg += "<br/>施放技能会消耗金针<br/>每10秒恢复1个金针";
			TipTargetManager.show(_skin.jingzhen_yijia, TargetTipsMaker.makeSimpleTextTips(Msg));
		}
		
		public function getBtnGlobalPos(btnName : String) : Point
		{
			if (btnName == null || btnName == "")
				return null;
			var dis : DisplayObject = _skin[btnName];
			if (dis && dis.parent)
			{
				return dis.parent.localToGlobal(new Point(dis.x + 5, dis.y + 5));
			}
			return null;
		}
		
		private function initExp() : void
		{
			//			expKArr = [];
			//			
			//			expKArr.push(_skin.imgExpK1, _skin.imgExpK2, _skin.imgExpK3, _skin.imgExpK4, _skin.imgExpK5, _skin.imgExpK6, _skin.imgExpK7, _skin.imgExpK8, _skin.imgExpK9);
			//			
			//			changeExp();
			//			EventManager.addEvent(MainPlayerEvent.MAXEXP_CHANGE, changeExp);
			//			EventManager.addEvent(MainPlayerEvent.NOWEXP_CHANGE, changeExp);
			//			
			//			TipTargetManager.show(_skin.imgExpBg, TargetTipsMaker.makeSimpleTextTips("经验：$/$($%)", null, getExp));
		}
		
		/**
		 * 经验TIPS
		 * @return
		 *
		 */
		private function getExp() : Array
		{
			return [MainRoleManager.actorInfo.curExp, MainRoleManager.actorInfo.maxExp, (MainRoleManager.actorInfo.curExp / MainRoleManager.actorInfo.maxExp * 100).toFixed(2)];
		}
		
		private function changeExp() : void
		{
			var p : Number = MainRoleManager.actorInfo.curExp / MainRoleManager.actorInfo.maxExp;
			if (p > 1)
				p = 1;
			
			//			_skin.imgExp.width = p * expWidth;
			
			//shortcutSkin.imgCurEffect.x = shortcutSkin.imgExp.x + shortcutSkin.imgExp.width - shortcutSkin.imgCurEffect.width / 2;
		}
		
		private function resizeExp(sWidth : int, sHeight : int) : void
		{
			//			expWidth = sWidth - 42;
			//			
			//			_skin.imgExpBg.width = sWidth;
			//			_skin.imgExpBg.x = (_skin.width - sWidth) / 2;
			//			_skin.imgExp.x = _skin.imgExpBg.x + 21;
			
			sortExp();
			
			changeExp();
		}
		
		private function sortExp() : void
		{
			//			var d : int = expWidth / 10;
			//			var len : int = expKArr.length;
			//			var startX : int = _skin.imgExp.x;
			//			for (var i : int = 0; i < len; i++)
			//			{
			//				expKArr[i].x = int(startX + d * (i + 1));
			//			}
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case autoBar.setSkin.btnShezhi:
					autoBar.setAutoFight();
					break;
				case autoBar.setSkin.btnClose:
					autoBar.fightStop();
					break;
				case _skin.btnGuaJi:
					autoBar.guajiClick();
					break;		
				case _skin.btnJieHun:
					if(Mgr.hunyinMgr.hasMarriage()){
						FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_HUNYIN);
					}else{
						if(FunctionOpenManager.checkOpenByFunId(EmFunctionID.EM_HUNYIN)){
							AppManager.showApp(AppConstant.HUNYIN_QIUHUN);
						}else{
							var funcCfg:Q_newfunc=NewFuncCfgData.getFuncCfg(EmFunctionID.EM_HUNYIN);
							NoticeManager.showNotifyById(90203,null,funcCfg.q_name,funcCfg.q_level);
						}
					}
					break;
				//				case _skin.btnBackpack://背包
				//					AppManager.showApp(AppConstant.BACK_PACK_PANEL);
				//					break;
				//				case _skin.btnRole://人物
				//					AppManager.showApp(AppConstant.ROLE_PANEL);
				//					break;
				//				case _skin.btnHaoYou://好友
				//					AppManager.showApp(AppConstant.FRIEND_PANEL);
				//					break;
				//				case _skin.btnZudui://组队
				//					AppManager.showApp(AppConstant.TEAM_PANEL);
				//					break;
				//				case _skin.btnShangDian://商店
				//					AppManager.showApp(AppConstant.SHOP_SYSTEM_PANEL);
				//					break;
				//				case _skin.btnTask://任务
				//					AppManager.showApp(AppConstant.TASK_PANEL);
				//					break;
				//				case _skin.btnSheHui://装备
				//					AppManager.showApp(AppConstant.EQUIP_CHANGE);
				//					break;
				//				case _skin.btnMount://坐骑
				//					if (MainRoleManager.actorInfo.level < int(LanguageConfig.getText(LangMount.MOUNT_TIP_95))) //等级条件
				//					{
				//						NoticeManager.showNotify(LangMount.MOUNT_CMDLISTENER_FAILD_120);
				//						return;
				//					}
				//					MountManager.onCheckOpenPanelCondition(true);
				//					AppManager.showApp(AppConstant.MOUNT_PANEL);
				//					break;
				//				case _skin.btnSpell://技能
				//					AppManager.showApp(AppConstant.SPELL_PANEL);
				//					break;
				//				//				case _skin.btnGm:
				//				//					AppManager.showApp(AppConstant.GM_PANEL);
				//				//					break;
				//				case _skin.btnChengJiu://国家
				//					AppManager.showApp(AppConstant.COUNTRY_PANEL);
				//					break;
			}
		}
		
		
		
		
		/**
		 * 是否显示有人申请入家族的提示
		 *
		 */
		private function addSheHuiTab() : void
		{
			//			if (SocietyManager.hasSomeRequest())
			//			{
			//				PromptUtil.addTabIco(PromptUtil.TAB_PRIZE, _skin.btnSheHui);
			//			}
			//			else
			//			{
			//				PromptUtil.removeTabIco(PromptUtil.TAB_PRIZE, _skin.btnSheHui);
			//			}
		}
		
		public function get shortcutMessageBar() : ShortcutMessageBar
		{
			return _shortcutMessageBar;
		}
		
		public function resize(w : int, h : int) : void {
			this.x = (w - this._skin.width) >> 1;
			this.y = h - this._skin.height;
			CONFIG::netDebug{
				NetDebug.LOG("[ShortcutBar] [resize] x:" + this.x + ", y:" + this.y + ", w:" + this._skin.width + ", h:" + this._skin.height);
			}
		}
	}
}
