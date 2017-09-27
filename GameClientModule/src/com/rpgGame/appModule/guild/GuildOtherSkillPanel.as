package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.guild.GuildSkillVo;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.GuildSkillCfgData;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_guildskill;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import away3d.events.Event;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.Skill_TongShuai;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class GuildOtherSkillPanel extends GuildSkillBase
	{
		private static var isMouseOut : Boolean = true;
		private var _skin:Skill_TongShuai;
		private var _propList:Vector.<SkillPropCell>;
		private var _currentinfo:GuildSkillVo;
		private var _nextdata:Q_guildskill;
		private var _skillId:int = 11;
		public function GuildOtherSkillPanel(skin:Skill_TongShuai):void
		{
			_skin = skin;
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_propList = new Vector.<SkillPropCell>();
			_propList.push(new SkillPropCell(CharAttributeType.WAI_GONG,_skin.skinGongji));
			_propList.push(new SkillPropCell(CharAttributeType.DEFENSE_PER,_skin.skinFangyu));
			_propList.push(new SkillPropCell(CharAttributeType.MAX_HP,_skin.skinShengming));
			_skin.btnUP.addEventListener(TouchEvent.TOUCH, onTouch);
			_skin.btnUP.addEventListener(Event.TRIGGERED, triggeredHandler);
			SkinUI.addNode(RTNodeID.GUILD_SKILL_LEADER,RTNodeID.GUILD_SKILL_SELF_LEADER_BTN,_skin.btnUP,177,GuildManager.instance().hasLeaderSkill2LevelUp);
		}
		
		private function triggeredHandler(e:Event):void
		{
			GuildManager.instance().guildSkillLevelup(2,_nextdata);
		}
		private function onTouch(e : TouchEvent) : void
		{
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				showHide(false);
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				showHide(true);
				return;
			}
		}
		override protected function show():void
		{
			EventManager.addEvent(GuildEvent.GUILD_SKILLINFO_CHAGE,refeashView);
			refeashView();
		}
		
		private function refeashView():void
		{
			_currentinfo = GuildManager.instance().getLeaderSkillInfoById(_skillId);
			var currentLevel:int;
			if(_currentinfo == null)
			{
				currentLevel = 0;
			}else{
				currentLevel = _currentinfo.level;
			}
			var data:Q_guildskill = GuildSkillCfgData.getSkill(_skillId,currentLevel);
			var currentatt:Q_att_values;
			if(data!=null)
				currentatt = AttValueConfig.getAttInfoById(data.q_property);
			_nextdata = GuildSkillCfgData.getSkill(_skillId,currentLevel+1);
			var nextatt:Q_att_values;
			if(_nextdata!=null)
				nextatt = AttValueConfig.getAttInfoById(_nextdata.q_property);
			for each(var cell: SkillPropCell in _propList)
			{
				cell.setValue(currentatt,nextatt);
			}
			
			
			_skin.lbYuanbao.text = "元宝:"+MainRoleManager.actorInfo.totalStat.getResData(3);
			if(_nextdata==null)
			{
				_skin.lbXiaohao.visible = false;
				_skin.btnUP.visible = false;
				_skin.imgmax.visible = true;
				showHide(false);
			}else{
				_skin.lbXiaohao.visible = true;
				_skin.btnUP.visible = true;
				_skin.imgmax.visible = false;
				_skin.btnUP.label = "升级到LV"+int(currentLevel+1).toString();
				_skin.lbXiaohao.htmlText = "本次花费元宝"+HtmlTextUtil.getTextColor(0x5DBD37,_nextdata.q_costvalue.toString());
			}
			SkinUI.notifyUpdate(RTNodeID.GUILD_SKILL_SELF_LEADER_BTN);
		}
		
		
		override protected function hide():void
		{
			super.hide();
			EventManager.removeEvent(GuildEvent.GUILD_SKILLINFO_CHAGE,refeashView);
		}
		
		private function showHide(value:Boolean):void
		{
			for each(var cell: SkillPropCell in _propList)
			{
				cell.showHide(value);
			}
		}
	}
}
import com.rpgGame.coreData.cfg.AttValueConfig;
import com.rpgGame.coreData.clientConfig.Q_att_values;
import com.rpgGame.coreData.type.CharAttributeType;

import feathers.controls.UINumber;


class SkillPropCell
{
	private var _attid:int;
	private var _skin:UINumber;
	public function SkillPropCell(id:int,skin:UINumber)
	{
		_attid = id;
		_skin = skin;
		refeashValue();
		showHide(false);
	}
	private var _currentValue:int;
	private var _nextValue:int;
	public function setValue(currentatt:Q_att_values,nextatt:Q_att_values):void
	{
		if(currentatt!=null)
		{
			if(CharAttributeType.WAI_GONG== _attid)
				_currentValue =  AttValueConfig.getDisAttValue(_attid,currentatt.q_value1);
			else if(CharAttributeType.DEFENSE_PER== _attid)
				_currentValue =  AttValueConfig.getDisAttValue(_attid,currentatt.q_value2);
			else
				_currentValue = AttValueConfig.getDisAttValue(_attid,currentatt.q_value3);
			
		}else{
			_currentValue = 0;
		}
		
		if(nextatt!=null)
		{
			if(CharAttributeType.WAI_GONG== _attid)
				_nextValue = AttValueConfig.getDisAttValue(_attid,nextatt.q_value1);
			else if(CharAttributeType.DEFENSE_PER== _attid)
				_nextValue = AttValueConfig.getDisAttValue(_attid,nextatt.q_value2);
			else
				_nextValue = AttValueConfig.getDisAttValue(_attid,nextatt.q_value3);
		}else{
			_nextValue = 0;
		}
		
		refeashValue();
		showHide(_showHide);
	}
	
	private function  refeashValue():void
	{
//		_skin.lbGongji.text = str+_currentValue.toString();
//		_skin.lbUp.text = "+"+(_nextValue-_currentValue).toString();
		_skin.label="x"+_currentValue;
		
	}
	private var _showHide:Boolean;
	public function showHide(value:Boolean):void
	{
		_showHide = value;
//		_skin.lbUp.visible = value;
//		_skin.uiUp.visible = value;
	}
}