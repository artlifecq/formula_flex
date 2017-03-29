package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollPolicy;
	import feathers.layout.RelativePosition;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.wuxue.jineng.JinengTitle_Skin;
	import org.mokylin.skin.app.wuxue.jineng.jineng_Skin;
	import org.mokylin.skin.app.wuxue.jineng.jineng_jinjie;
	import org.mokylin.skin.app.wuxue.jineng.jineng_shengji;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 *技能学习 
	 * @author dik
	 * 
	 */
	public class SkillStudyView
	{
		private var _skin:jineng_Skin;
		private var _skillContainer:Sprite;
		
		private var _jobTitle1:JinengTitle_Skin;
		private var _jobTitle2:JinengTitle_Skin;
		private var _jobTl1:Sprite;
		private var _jobTl2:Sprite;
		private var _lastSp:Sprite;
		private var selectedItem:SkillItem;
		
		private var skillUpgrade:SkillUpgradeView;
		private var skillRise:SkillRiseView;
		private var _panel:SkinUIPanel;

		private var basicItems:Vector.<SkillItem>;
		private var otherItems:Vector.<SkillItem>;
		
		public function SkillStudyView(skin:jineng_Skin,panel:SkinUIPanel)
		{
			_panel=panel;
			_skin=skin;
			initView();
		}
		
		private function initView():void
		{
			_skillContainer=new Sprite();
			this._skin.vs_bar.width=550;
			this._skin.vs_bar.x=20;
			this._skin.vs_bar.scrollBarDisplayMode = ScrollBarDisplayMode.FIXED;
			this._skin.vs_bar.verticalScrollBarPosition =RelativePosition.RIGHT;
//			this._skin.vs_bar.horizontalScrollPolicy = ScrollPolicy.OFF;
			this._skin.vs_bar.verticalScrollPolicy = ScrollPolicy.OFF;
			
			
			_jobTitle1=new JinengTitle_Skin();
			_jobTitle2=new JinengTitle_Skin();
			_jobTitle2.labelDisplay.text="其他技能";
			_jobTl1=_jobTitle1.toSprite();
			_jobTl2=_jobTitle2.toSprite();
			_skillContainer.addChild(_jobTl1);
			_skillContainer.addChild(_jobTl2);
			skillUpgrade=new SkillUpgradeView(_skin.shengji.skin as jineng_shengji,_panel);
			skillRise=new SkillRiseView(_skin.jinjie.skin as jineng_jinjie);
			
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
				item.y=row*(item.height+10)+40;
				_skillContainer.addChild(item);
				if(i%2==0){
					item.x=10;
				}else{
					item.x=item.width+30;
				}
				if(i==0){
					selecteSpell(item);					
				}
			}
			row++;
			_jobTl2.y=row*(item.height+10)+40;
			
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
				item.y=row*(item.height+10)+_jobTl2.y+40;
				_skillContainer.addChild(item);
				if(i%2==0){
					item.x=10;
				}else{
					item.x=item.width+30;
				}
			}
			_lastSp=new Sprite();
			_lastSp.y=item.y+item.height+40;
			_skillContainer.addChild(_lastSp);
			this._skin.vs_bar.addChild(_skillContainer);
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
		}
		
		public function onTouchTarget(target:DisplayObject):Boolean
		{
			if(skillUpgrade.onTouchTarget(target)){
				return true;
			}
			if(skillRise.onTouchTarget(target)){
				return true;
			}
			
			return false;
		}
		
		public function onHide():void
		{
			_skin.tab_zizhi.removeEventListener(Event.CHANGE, onTab);
			EventManager.removeEvent(SpellEvent.SELECTE_SPELL,selecteSpell);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateChange);
			EventManager.removeEvent(SpellEvent.SPELL_UPDATE,updateSkillList);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,updateChange);
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateChange);
			skillUpgrade.onHide();
			skillRise.onHide();
		}
		
		public function onShow():void
		{
			updateZhenqi();
			updateSkillList();
			_skin.tab_zizhi.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(SpellEvent.SELECTE_SPELL,selecteSpell);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateChange);
			EventManager.addEvent(SpellEvent.SPELL_UPDATE,updateSkillList);
			EventManager.addEvent(ItemEvent.ITEM_ADD,updateChange);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateChange);
			EventManager.addEvent(SpellEvent.SPELL_UPGRADE,spellUpgrade);
			EventManager.addEvent(SpellEvent.SPELL_RISE,spellRise);
		}
		
		private function spellRise(lv:int):void
		{
			UIPopManager.showPopUI(SkillOkPop,lv);
			skillUpgrade.update(selectedItem.skillCfg,selectedItem.skillInfo);
			skillRise.update(selectedItem.skillCfg,selectedItem.skillInfo);
		}
		
		private function spellUpgrade(lv:int):void
		{
			UIPopManager.showPopUI(SkillOkPop,lv);
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