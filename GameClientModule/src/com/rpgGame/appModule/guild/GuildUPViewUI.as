package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_Up;
	
	import starling.display.DisplayObject;
	
	public class GuildUPViewUI extends ViewUI
	{
		private var _skin:BangHui_Up;
		
		public function GuildUPViewUI()
		{
			_skin = new BangHui_Up();
			super(_skin);
			addNode(RTNodeID.GUILD_UP,RTNodeID.GUILD_UP_BTN+"-2",_skin.btnUp,112,null);
		}
		override public function show(data:Object=null):void
		{
			super.show(data);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashValue);
			//EventManager.addEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
			refeashValue();
			finishMation(TaskType.MAINTYPE_GUILDDAILYTASK);
		}
		
		override protected function onHide():void
		{
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashValue);
			//EventManager.removeEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
		}
		
		private function finishMation(type:int):void
		{
			// TODO Auto Generated method stub
			if (TaskType.MAINTYPE_GUILDDAILYTASK==type) 
			{
				if (!TaskMissionManager.haveGuildTask)
				{
					GrayFilter.gray(_skin.btnRenwu);
				}
				else
				{
					GrayFilter.unGray(_skin.btnRenwu);
				}
			}
		}
		
		private function refeashValue():void
		{
			if(guildInfo==null)
				return ;
			
			var currentGuildInfo:Q_guild = GuildCfgData.getLevelInfo(guildInfo.level);
			if(currentGuildInfo!=null)
			{
				_skin.lbMsg1.htmlText = currentGuildInfo.q_privilege_show;
			}
			var nextGuildInfo:Q_guild= GuildCfgData.getLevelInfo(guildInfo.level+1);
			if(nextGuildInfo!=null)
			{
				_skin.lbMsg2.htmlText = nextGuildInfo.q_privilege_show;
				_skin.gNext.visible=true;
			}
			else
			{
				_skin.lbMsg2.htmlText = "已满级";
				_skin.gNext.visible=false;
			}
			
			
			
			/*if(GuildManager.instance().getGuildHaveCityByIndex(1))
			{
				_skin.btnZhengba.filter = null
			}else{
				GrayFilter.gray(_skin.btnZhengba);
			}*/
			
			
			var guildLevel:Q_guild = GuildManager.instance().guildLevelInfo;
			var percent:Number = guildInfo.active/guildLevel.q_active;
			if(percent >=1)
				percent = 1;
			_skin.proJindu.value = _skin.proJindu.maximum*percent;
			_skin.lbJindu.text =  guildInfo.active.toString()+"/"+guildLevel.q_active.toString();
			
			_skin.lbBanhuiZhanli.text = guildInfo.battle.toString();
			_skin.lbBanhuiDengji.text = guildInfo.level.toString();
			if(nextGuildInfo == null)
			{
//				_skin.lbMsg2.htmlText = nextGuildInfo.q_privilege_show;
				_skin.btnUp.visible =false;
				_skin.imgmax.visible = true;
			}else{
				_skin.btnUp.visible = GuildManager.instance().canUpgrad;
				_skin.imgmax.visible = false;
			}
			setRTNState(RTNodeID.GUILD_UP_BTN+"-2",GuildManager.instance().hasGuildLevelUp());
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnRenwu:
					GuildManager.instance().gotoTask();
					break;
				case _skin.btnJuanxian:
					AppManager.showApp(AppConstant.GUILD_DONATE_PANEL);
					//FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_INFO,null,false);
					break;
				case _skin.btnZhengba:
					//FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_COMBAT,null,false);
					FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_BANGHUI_WCZB2);
					break;
				case _skin.btnUp:
					GuildManager.instance().guildLevelup();
					break;
			}
		}
		private function get guildInfo():GuildInfo
		{
			return GuildManager.instance().guildData;
		}
		
	}
}