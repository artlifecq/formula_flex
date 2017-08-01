package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.SpellManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.core.ui.tip.RewardMarkTip;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollPolicy;
	import feathers.controls.ToggleButton;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.wuxue.jineng.jineng_Skin;
	import org.mokylin.skin.app.wuxue.jineng.jineng_jinjie;
	import org.mokylin.skin.app.wuxue.jineng.jineng_shengji;
	import org.mokylin.skin.common.Title_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	/**
	 *技能学习 
	 * @author dik
	 * 
	 */
	public class SkillStudyView extends ViewUI
	{
		private var _skin:jineng_Skin;
		private var _skillContainer:Sprite;
		
//		private var _jobTitle1:Title_Skin;
//		private var _jobTitle2:Title_Skin;
//		private var _jobTl1:Sprite;
//		private var _jobTl2:Sprite;
		private var _lastSp:Sprite;
		private var selectedItem:SkillItem;
		
		private var skillUpgrade:SkillUpgradeView;
		private var skillRise:SkillRiseView;

		private var basicItems:Vector.<SkillItem>;
		private var otherItems:Vector.<SkillItem>;
		
		private var _levelUpTip:RewardMarkTip;
		private var _upGradeTip:RewardMarkTip;
		private var _tabBtns:Array;
		public function SkillStudyView()
		{
			_skin=new jineng_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skillContainer=new Sprite();
			this._skin.vs_bar.width=520;
			this._skin.vs_bar.x=25;
			this._skin.vs_bar.scrollBarDisplayMode = ScrollBarDisplayMode.FIXED_FLOAT;
			this._skin.vs_bar.horizontalScrollPolicy=ScrollPolicy.OFF;
			
//			_jobTitle1=new Title_Skin();
//			_jobTitle2=new Title_Skin();
//			_jobTitle2.labelDisplay.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT13);
//			_jobTl1=_skin.grp_name1.toSprite();
//			_jobTl2=_jobTitle2.toSprite();
			_skillContainer.addChild(_skin.grp_name1);
			_skillContainer.addChild(_skin.grp_name2);
			skillUpgrade=new SkillUpgradeView(_skin.shengji.skin as jineng_shengji,this);
			skillRise=new SkillRiseView(_skin.jinjie.skin as jineng_jinjie,this);
			_skin.grp_name1.y=0;
			var skillNum:int;
			var job:int=MainRoleManager.actorInfo.job;
			var item:SkillItem;
			var i:int;
			var row:int;
			var list:Vector.<Q_skill_model>=SpellDataManager.getBasicSkills(MainRoleManager.actorInfo.job);//基本职业技能
			var data:Q_skill_model;
			skillNum=list.length;
			var skillInfo:SkillInfo;
			basicItems=new Vector.<SkillItem>();
			otherItems=new Vector.<SkillItem>();
			for(i=0;i<skillNum;i++){
				item=new SkillItem();
				basicItems.push(item);
				row=Math.floor(i/2);
				data=MainRoleManager.actorInfo.spellList.getStudySpell(list[i].q_skillID);
				skillInfo=MainRoleManager.actorInfo.spellList.getSkillInfo(list[i].q_skillID);
				if(!data){
					data=list[i];
				}
				item.updateItem(data,skillInfo);
				item.y=row*(item.height+5)+25;
				_skillContainer.addChild(item);
				if(i%2==0){
					item.x=25;
				}else{
					item.x=item.width+30;
				}
				if(i==0){
					selecteSpell(item);					
				}
			}
			row++;
			_skin.grp_name2.y=row*(item.height+5)+25;
			
			_skin.jinjie.visible=false;
			list=SpellDataManager.getBasicSkills(JobEnum.ROLE_0_TYPE);
			skillNum=list.length;
			for(i=0;i<skillNum;i++){
				item=new SkillItem();
				otherItems.push(item);
				row=Math.floor(i/2);
				data=MainRoleManager.actorInfo.spellList.getStudySpell(list[i].q_skillID);
				skillInfo=MainRoleManager.actorInfo.spellList.getSkillInfo(list[i].q_skillID);
				if(!data){
					data=list[i];
				}
				item.updateItem(data,skillInfo);
				item.y=row*(item.height+10)+_skin.grp_name2.y+25;
				_skillContainer.addChild(item);
				if(i%2==0){
					item.x=25;
				}else{
					item.x=item.width+30;
				}
			}
			_lastSp=new Sprite();
			_lastSp.y=item.y+item.height+5;
			_skillContainer.addChild(_lastSp);
			this._skin.vs_bar.addChild(_skillContainer);
			
			
			_tabBtns=[new ToggleButton(),new ToggleButton()];
			_levelUpTip=new RewardMarkTip(_tabBtns[0],85,false);
			_upGradeTip=new RewardMarkTip(_tabBtns[1],85,false);
			_skin.tab_zizhi.tabFactory=onTabCreate;
		}
		
		private function onTabCreate():ToggleButton
		{
			// TODO Auto Generated method stub
			return _tabBtns.shift();
		}
		
		private function updateSkillList():void
		{
			var list:Vector.<Q_skill_model>=SpellDataManager.getBasicSkills(MainRoleManager.actorInfo.job);//基本职业技能
			var data:Q_skill_model;
			var i:int;
			var skillNum:int;
			var item:SkillItem;
			skillNum=list.length;
			var skillInfo:SkillInfo;
			for(i=0;i<skillNum;i++){
				item=basicItems[i];
				data=MainRoleManager.actorInfo.spellList.getStudySpell(list[i].q_skillID);
				skillInfo=MainRoleManager.actorInfo.spellList.getSkillInfo(list[i].q_skillID);
				if(!data){
					data=list[i];
				}
				item.updateItem(data,skillInfo);
			}
			
			list=SpellDataManager.getBasicSkills(JobEnum.ROLE_0_TYPE);
			skillNum=list.length;
			for(i=0;i<skillNum;i++){
				item=otherItems[i];
				data=MainRoleManager.actorInfo.spellList.getStudySpell(list[i].q_skillID);
				skillInfo=MainRoleManager.actorInfo.spellList.getSkillInfo(list[i].q_skillID);
				if(!data){
					data=list[i];
				}
				item.updateItem(data,skillInfo);
			}
			
			skillUpgrade.update(selectedItem.skillCfg,selectedItem.skillInfo);
			skillRise.update(selectedItem.skillCfg,selectedItem.skillInfo);
			var ret:int=SpellManager.canUpOrRise(selectedItem.skillCfg.q_skillID);
			if (_levelUpTip) 
			{
				_levelUpTip.hasReward=(ret==1)||ret==3;
			}
			if (_upGradeTip) 
			{
				_upGradeTip.hasReward=ret==2||ret==3;
			}
			notifyUpdate(RTNodeID.WX_SKILL);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(skillUpgrade.onTouchTarget(target)){
				return
			}
			if(skillRise.onTouchTarget(target)){
				return
			}
		}
		
		override public function hide():void
		{
			_skin.tab_zizhi.removeEventListener(Event.CHANGE, onTab);
			EventManager.removeEvent(SpellEvent.SELECTE_SPELL,selecteSpell);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateChange);
			EventManager.removeEvent(SpellEvent.SPELL_ADD,updateSkillList);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,addItem);
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateChange);
			EventManager.removeEvent(SpellEvent.SPELL_UPGRADE,spellUpgrade);
			EventManager.removeEvent(SpellEvent.SPELL_RISE,spellRise);
			skillUpgrade.onHide();
			skillRise.onHide();
		}
		
		override public function show(data:Object=null):void
		{
			updateZhenqi();
			updateSkillList();
			_skin.tab_zizhi.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(SpellEvent.SELECTE_SPELL,selecteSpell);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateChange);
			EventManager.addEvent(SpellEvent.SPELL_ADD,updateSkillList);
			EventManager.addEvent(ItemEvent.ITEM_ADD,addItem);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateChange);
			EventManager.addEvent(SpellEvent.SPELL_UPGRADE,spellUpgrade);
			EventManager.addEvent(SpellEvent.SPELL_RISE,spellRise);
		}
		
		private function addItem(itemInfo : ClientItemInfo) : void
		{
			if (!itemInfo)
				return;
			updateChange();			
		}
		
		private function spellRise(lv:int):void
		{
			UIPopManager.showAlonePopUI(SkillRisePop);
			skillRise.unlock();
			updateSkillList();
		}
		
		private function spellUpgrade(lv:int):void
		{
			UIPopManager.showAlonePopUI(SkillGradePop,lv);
			updateSkillList();
		}
		
		private function updateChange(type:int=2):void
		{
			if(type!=CharAttributeType.RES_GOLD&&type!=CharAttributeType.RES_MONEY&&
				type!=CharAttributeType.RES_BIND_GOLD&&type!=CharAttributeType.RES_BIND_MONEY&&type!=CharAttributeType.RES_ZHENQI){
				return;
			}
			updateZhenqi();
			updateSkillList();
		}
		
		private function selecteSpell(skillItem:SkillItem):void
		{
			if(selectedItem){
				selectedItem.selected=false;
			}
			selectedItem=skillItem;
			selectedItem.selected=true;
			
			skillUpgrade.update(selectedItem.skillCfg,selectedItem.skillInfo);
			skillRise.update(selectedItem.skillCfg,selectedItem.skillInfo);
			var ret:int=SpellManager.canUpOrRise(selectedItem.skillCfg.q_skillID);
			if (_levelUpTip) 
			{
				_levelUpTip.hasReward=(ret==1)||ret==3;
			}
			if (_upGradeTip) 
			{
				_upGradeTip.hasReward=ret==2||ret==3;
			}
		}
		
		private function updateZhenqi():void
		{
			var _roleData:HeroData=MainRoleManager.actorInfo;
			_skin.pro_zhenqi.maximum=_roleData.maxZhenqi;
			_skin.pro_zhenqi.value=_roleData.curZhenqi;
			_skin.lb_zhenqi.text=_roleData.curZhenqi+"/"+_roleData.maxZhenqi;			
		}
		
		private function onTab(e:Event):void
		{
			_skin.jinjie.visible=_skin.tab_zizhi.selectedIndex!=0;
			_skin.shengji.visible=!_skin.jinjie.visible;
		}
	}
}