package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.netData.guild.bean.GuildBriefnessInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.TanKuang_JianJie;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GuildPorpInfoPanel extends SkinUIPanel
	{
		private var _skin:TanKuang_JianJie;
		private var _guildId:long;
		private var _levelInfo:Q_guild;
		public function GuildPorpInfoPanel():void
		{
			_skin = new TanKuang_JianJie();
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_guildId = data as long;
//			refeashView();
			EventManager.addEvent(GuildEvent.GUILD_INFO_CHANGE,refeashView);
			GuildManager.instance().reqGuildBriefnessInfo(_guildId,0);
		}
		
		private function refeashView(info:GuildBriefnessInfo):void
		{
			_levelInfo = GuildCfgData.getLevelInfo(info.level);
			_skin.lbBanghuiName.text = info.name;
			_skin.lbXuanyan.text = info.memberNum.toString()+"/"+_levelInfo.q_max_num.toString();
			_skin.lbBangZhuName.text = info.chiefName;
			_skin.lbXuanyan.text = info.note;
			_skin.lbVip.visible = info.chiefVip == 1;
			
			_skin.btnOk.visible = !GuildManager.instance().haveGuild;
		}
		
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(GuildEvent.GUILD_INFO_CHANGE,refeashView);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnOk)
			{
				GuildManager.instance().reqGuildJoin(_guildId,0);
			}
		}
	}
}