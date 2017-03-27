package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import feathers.controls.Scroller;
	
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
		private var selectedCfg:Q_skill_model;
		private var selectedInfo:SkillInfo;
		
		public function SkillStudyView(skin:jineng_Skin)
		{
			_skin=skin;
			initView();
		}
		
		private function initView():void
		{
			this._skin.vs_bar.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			this._skin.vs_bar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			this._skin.vs_bar.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			this._skin.vs_bar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			_skillContainer=new Sprite();
			this._skin.vs_bar.width=550;
			this._skin.vs_bar.x=20;
			_jobTitle1=new JinengTitle_Skin();
			_jobTitle2=new JinengTitle_Skin();
			_jobTitle2.labelDisplay.text="其他技能";
			_jobTl1=_jobTitle1.toSprite();
			_jobTl2=_jobTitle2.toSprite();
			_skillContainer.addChild(_jobTl1);
			_skillContainer.addChild(_jobTl2);
			
			var skillNum:int;
			var job:int=MainRoleManager.actorInfo.job;
			var item:SkillItem;
			var i:int;
			var row:int;
			var list:Vector.<Q_skill_model>=SpellDataManager.getBasicSkills(MainRoleManager.actorInfo.job);//基本职业技能
			var data:Q_skill_model;
			skillNum=list.length;
			var skillInfo:SkillInfo;
			for(i=0;i<skillNum;i++){
				item=new SkillItem();
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
			}
			row++;
			_jobTl2.y=row*(item.height+10)+40;
			
			_skin.jinjie.visible=false;
			list=SpellDataManager.getBasicSkills(JobEnum.ROLE_0_TYPE);
			skillNum=list.length;
			for(i=0;i<skillNum;i++){
				item=new SkillItem();
				row=Math.floor(i/2);
				data=list[i];
				skillInfo=MainRoleManager.actorInfo.spellList.getSkillInfo(list[i].q_skillID);
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
			_lastSp.y=item.y+item.height;
			_skillContainer.addChild(_lastSp);
			this._skin.vs_bar.addChild(_skillContainer);
		}
		
		public function onTouchTarget(target:DisplayObject):Boolean
		{
			return false;
		}
		
		public function onHide():void
		{
			_skin.tab_zizhi.removeEventListener(Event.CHANGE, onTab);
		}
		
		public function onShow():void
		{
			updateZhenqi();
			_skin.tab_zizhi.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(SpellEvent.SELECTE_SPELL,selecteSpell);
		}
		
		private function selecteSpell(skillItem:SkillItem):void
		{
			if(selectedItem){
				selectedItem.selected=false;
			}
			selectedItem=skillItem;
			selectedCfg=selectedItem.skillCfg;
			selectedInfo=selectedItem.skillInfo;
			updateShenji();
			updateJinjie();
		}
		
		private function updateJinjie():void
		{
			var skin:jineng_jinjie=_skin.jinjie.skin as jineng_jinjie;
			skin.lb_name.text=selectedCfg.q_skillName;
			skin.lb_dengji.text=getTitleText("等级",selectedInfo.skillChildLv+"/"+selectedCfg.q_max_level);
			skin.lb_leixing.text=getTitleText("技能类型",selectedCfg.q_skill_type);
			skin.lb_xiaohao.text=getTitleText("消耗",selectedCfg.q_need_mp);
			skin.lb_lengque.text=getTitleText("冷却时间",selectedCfg.q_cd/1000);
		}
		
		private function updateShenji():void
		{
			var skin:jineng_shengji=_skin.shengji.skin as jineng_shengji;
			skin.lb_name.text=selectedCfg.q_skillName;
			skin.lb_dengji.text=getTitleText("等级",selectedInfo.skillChildLv+"/"+selectedCfg.q_max_level);
			skin.lb_leixing.text=getTitleText("技能类型",selectedCfg.q_skill_type);
			skin.lb_xiaohao.text=getTitleText("消耗",selectedCfg.q_need_mp);
			skin.lb_lengque.text=getTitleText("冷却时间",selectedCfg.q_cd/1000);
			
			skin.lb_miaoshu.htmlText=selectedCfg.q_skillpanel_description1;
			
			//升级效果
			var myLv:int=MainRoleManager.actorInfo.totalStat.level;
			var myMp:int=MainRoleManager.actorInfo.curZhenqi;
			var myMon:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY);
			var upNum:int=1;
			var needMp:int=0;
			var needMy:int=0;
			var lv:int=selectedInfo.skillChildLv;
			var id:int=selectedCfg.q_skillID;
			var key:String=id+"_"+lv;
			var playerLv:int=0;
			var lvData:Q_skill_ignore=SkillLvLDataManager.getData(key);
			if(lvData){
				needMp+=lvData.q_energy;
				needMy+=lvData.q_copper;
				playerLv=lvData.q_playerlevel;
				while(lv<selectedCfg.q_max_level){
					lv++;
					upNum++;
					key=id+"_"+lv;
				
					lvData=SkillLvLDataManager.getData(key);
					if(lvData){
						if(needMp+lvData.q_energy>myMp){
							break;
						}
						if(needMy+lvData.q_copper>myMon){
							break;
						}
						if(lvData.q_playerlevel>myLv){
							break;
						}
						needMp+=lvData.q_energy;
						needMy+=lvData.q_copper;
						if(lvData.q_playerlevel!=0){
							playerLv=lvData.q_playerlevel;
						}
					}else{
						break;
					}
				}
			}
		
			
//			skin.lb_shengji.htmlText=selectedCfg.q_skillpanel_description1;
//			skin.lb_shanghai.htmlText=selectedCfg.q_skillpanel_description1;
			
			//升级条件
			skin.lb_renwudengji.htmlText=getTitleText("人物等级",playerLv.toString());
			skin.lb_renwudengji.htmlText=getTitleText("消耗真气",needMp.toString());
			skin.lb_renwudengji.htmlText=getTitleText("消耗绑银",needMy.toString());
		}
		
		
		private function getTitleText(title:String,value:*):String
		{
			if(value is int){
				if(value==0){
					value="无";
				}
			}
			if(title=="冷却时间"&&value!="无"){
				value+="s";
			}
			return title+":"+value;
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