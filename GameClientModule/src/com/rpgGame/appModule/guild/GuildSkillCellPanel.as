package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.guild.GuildSkillVo;
	import com.rpgGame.core.ui.tip.RewardMarkTip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.GuildSkillCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_guildskill;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.banghui.ProSkill_Item;

	public class GuildSkillCellPanel
	{
		private var _skin:ProSkill_Item;
		private var _skillId:int;
		private var _currentinfo:GuildSkillVo;
		private var _nextdata:Q_guildskill;
		//不冒泡了
		private var _rewardTip:RewardMarkTip;
		public function GuildSkillCellPanel(id:int,skin:ProSkill_Item):void
		{
			_skin = skin;
			_skillId = id;
			_skin.btnUp.addEventListener(Event.TRIGGERED,triggetedHandler);
			//SkinUI.addNode(RTNodeID.GUILD_SKILL_SELF,RTNodeID.GUILD_SKILL_SELF_BTN+_skillId,_skin.btnUp,88,null);
			_rewardTip=new RewardMarkTip(_skin.btnUp,88);
		}
		
		private function triggetedHandler(e:Event):void
		{
			GuildManager.instance().guildSkillLevelup(1,_nextdata);
		}
		
		public function updata():void
		{
			_currentinfo = GuildManager.instance().getSkillInfoById(_skillId);
			var currentLevel:int;
			if(_currentinfo == null)
			{
				currentLevel = 0
			}else{
				currentLevel = _currentinfo.level;
			}
			
			var guildSkill:int = GuildManager.instance().guildSkillMaxLevel
			_skin.lbLevel.text = LanguageConfig.replaceStr("等级$/$",currentLevel,guildSkill);
			_skin.icon.styleName = "ui/app/banghui/icon/"+_skillId.toString()+".png";
			_skin.uiName.styleName = "ui/app/banghui/word/"+_skillId.toString()+".png";
			var data:Q_guildskill = GuildSkillCfgData.getSkill(_skillId,currentLevel);
			var att:Q_att_values;
			var attpropId:int ;
			var attpropValue:String;
			var attname:String;
			if(data==null)
			{
				_skin.lbXiaoguo.text = "未提升";
			}else{
				att = AttValueConfig.getAttInfoById(data.q_property);
				attpropId= att.q_type1;
				attpropValue= AttValueConfig.getDisAttValueStr(att.q_type1,att.q_value1);
				attname= CharAttributeType.getCNName(attpropId);
				_skin.lbXiaoguo.htmlText = attname+HtmlTextUtil.getTextColor(0xCFC6AE," +"+attpropValue);
			}
			
			_nextdata = GuildSkillCfgData.getSkill(_skillId,currentLevel+1);
			
			if(_nextdata==null)
			{
				_skin.uiOk.visible = true;
				_skin.grpHide.visible = false;
			}else{
				_skin.uiOk.visible = false;
				_skin.grpHide.visible = true;
				att = AttValueConfig.getAttInfoById(_nextdata.q_property);
				attpropId= att.q_type1;
				attpropValue= AttValueConfig.getDisAttValueStr(att.q_type1,att.q_value1);
				attname= CharAttributeType.getCNName(attpropId);
				_skin.lbNextXiaguo.htmlText = attname+" +"+HtmlTextUtil.getTextColor(0xCFC6AE,attpropValue);
				
				var contribution:int =0;
				if(GuildManager.instance().haveGuild)
					contribution = GuildManager.instance().selfMemberInfo.contribution;
				_skin.lbXiaohao.text = LanguageConfig.replaceStr("帮贡$/$",contribution,_nextdata.q_costvalue);
				if(_nextdata.q_costvalue>contribution)
					_skin.lbXiaohao.color = 0xff0000;
				else
					_skin.lbXiaohao.color = 0x6bcc08;
			}
			
			if(!GuildManager.instance().haveGuild)
			{
				_skin.lbTips.visible = true;
				_skin.lbTips.text = "请加入帮会";
				_skin.btnUp.visible = false;
			}else if(currentLevel>=guildSkill){
				_skin.btnUp.visible = false;
				if(_nextdata==null)
				{
					_skin.lbTips.visible = false;
				}else{
					_skin.lbTips.visible = true;
					_skin.lbTips.text = "需帮派等级"+(GuildManager.instance().guildLevelInfo.q_level+1)+"级";
				}
			}else{
				_skin.btnUp.visible = true;
				_skin.lbTips.visible = false;
			}
			
			_rewardTip.hasReward=GuildManager.instance().hasPersonalSkill2LevelUpBySkillId(_skillId);
		}
	}
}