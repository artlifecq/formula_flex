package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import org.mokylin.skin.app.wuxue.jineng.JinengTankuang_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 
	 * @author dik
	 * 
	 */
	public class SkillAlertPanel extends SkinUIPanel
	{
		private var _skin:JinengTankuang_Skin;
		private var _skillData:Q_skill_model;
		private var _skillInfo:SkillInfo;
		
		public function SkillAlertPanel()
		{
			_skin=new JinengTankuang_Skin();
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_skillData=data.cfg as Q_skill_model;
			_skillInfo=data.info as SkillInfo;
			updateView();
		}
		
		private function updateView():void
		{
			//升级效果
			var myLv:int=MainRoleManager.actorInfo.totalStat.level;
			var myMp:int=MainRoleManager.actorInfo.curZhenqi;
			var myMon:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			var upNum:int=1;
			var needMp:int=0;
			var needMy:int=0;
			var lv:int=_skillInfo.skillChildLv;
			var id:int=_skillData.q_skillID;
			var key:String=id+"_"+lv;
			var playerLv:int=0;
			var lvData:Q_skill_ignore=SkillLvLDataManager.getData(key);//这儿又是技能id和等级
			
			var i:int=0
			var changeValue:Array=[];
			var preValue:Array=SkillLvLDataManager.getAttrValueByType(_skillData.q_skill_attr_type,lvData);
			var nextValue:Array;
			var changeDes:String=LanguageConfig.getText( LangSpell["SPELL_"+id] );
			var desList:Array=changeDes.split("|");
			var num:int=desList.length;
			for(i=0;i<num;i++){
				changeValue.push(0);
			}
			if(lvData){
				needMp+=lvData.q_energy;
				needMy+=lvData.q_copper;
				playerLv=lvData.q_playerlevel;
				while(lv<_skillData.q_max_level){//计算下一级的情况
					lv++;
					upNum++;
					key=id+"_"+lv;
					
					lvData=SkillLvLDataManager.getData(key);
					nextValue=SkillLvLDataManager.getAttrValueByType(_skillData.q_skill_attr_type,lvData);
					for(i=0;i<nextValue.length;i++){
						changeValue[i]+=nextValue[i]-preValue[i];
					}
					preValue=nextValue;
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
			
			var des:String=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT14);
			des=des.replace("$",HtmlTextUtil.getTextColor(StaticValue.Q_GREEN,String(_skillInfo.skillChildLv+upNum-1)));
			
			_skin.lb1.htmlText=des;
			
			for(i=0;i<num;i++){
				_skin["lb"+(i+2)].visible=true;
				_skin["icon"+(i+2)].visible=true;
				var changeValueH:String=SkillLvLDataManager.getPercentValue(_skillData.q_skill_attr_type,changeValue[i],i);
				_skin["lb"+(i+2)].htmlText=desList[i].replace("$",changeValueH);
			}
			
			if(num==1){
				_skin.lb3.visible=false;
				_skin.icon3.visible=false;
			}
			
			var w:int;
			var xx:int
			w=_skin.lb1.textWidth+8;
			w=w>_skin.lb2.textWidth+8?w:_skin.lb2.textWidth+8;
			w=w>_skin.lb3.textWidth+8?w:_skin.lb3.textWidth+8;
			xx=(330-w)>>1;
			_skin.icon1.x=_skin.icon2.x=_skin.icon3.x=xx;
			_skin.lb1.x=_skin.lb2.x=_skin.lb3.x=xx+8;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.chk_ok:
					SpellDataManager.unAlert=_skin.chk_ok.isSelected;
					break;
				case _skin.btn_ok:
					SpellSender.reqSkillLevelUp(_skillData.q_skillID,0,1);
					if(_skin.chk_ok.isSelected){
						SpellDataManager.oneKeyup=true;
					}	
					this.hide();
					break;
				case _skin.btn_cancel:
					SpellSender.reqSkillLevelUp(_skillData.q_skillID,0,0);
					if(_skin.chk_ok.isSelected){
						SpellDataManager.oneKeyup=false;
					}
					this.hide();
					break;
			}
		}
	}
}