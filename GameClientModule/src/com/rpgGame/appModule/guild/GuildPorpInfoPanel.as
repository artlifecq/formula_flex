package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.netData.guild.bean.GuildBriefnessInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.TanKuang_JianJie;
	
	import starling.display.DisplayObject;
	
	public class GuildPorpInfoPanel extends SkinUI
	{
		private static var _instance:GuildPorpInfoPanel;
		
		public static function get instance():GuildPorpInfoPanel
		{
			if(_instance==null)
			{
				_instance = new GuildPorpInfoPanel();
			}
			return _instance;
		}
		private var _skin:TanKuang_JianJie;
		private var _guildId:long;
		private var _levelInfo:Q_guild;
		public function GuildPorpInfoPanel():void
		{
			_skin = new TanKuang_JianJie();
			super(_skin);
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(GuildEvent.GUILD_INFO_CHANGE,refeashView);
			this.x = (stage.stageWidth- this._skin.width)/2;
			this.y = (stage.stageHeight - this._skin.height)/2;
		}
		public function show(guild:long):void
		{
			_guildId = guild;
			if(this.parent==null)
			{
				StarlingLayerManager.topUILayer.addChild(this);
			}
			GuildSender.reqGuildBriefnessInfo(_guildId,0);
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
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GUILD_INFO_CHANGE,refeashView);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnOk)
			{
				GuildSender.reqGuildJoin(_guildId,0);
			}
		}
	}
}