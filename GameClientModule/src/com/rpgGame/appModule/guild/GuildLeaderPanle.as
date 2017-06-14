package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.coreData.enum.EnumGuildPost;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
	import feathers.core.ToggleGroup;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.TanKuang_TongShuaiRenMing;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GuildLeaderPanle extends SkinUIPanel
	{
		private var _skin:TanKuang_TongShuaiRenMing;
		private var _group:ToggleGroup;
		private var _heroId:long;
		private var _heroInfo:GuildMemberInfo;
		private var _opaque:int;
		private var _setPostType:int;
		private var _postList:Vector.<int>;
		public function GuildLeaderPanle():void
		{
			_skin = new TanKuang_TongShuaiRenMing();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_group = new ToggleGroup();
			_skin.chkLead.toggleGroup = _group;
			_skin.chkMember.toggleGroup = _group;
			_postList = new Vector.<int>();
			_postList.push(EnumGuildPost.GUILDPOST_LEADER);
			_postList.push(EnumGuildPost.GUILDPOST_OTHER);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var arr:Array = data as Array;
			_heroId = new long(arr[0]);
			_heroInfo = GuildManager.instance().getGuildMemberInfoById(arr[0]);
			EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
			refeashVale();
			
		}
		private function refeashAppoint(msg:ResGuildOperateResultMessage):void
		{
			if(_opaque<=0)
				return ;
			if(msg.opaque == _opaque)
			{
				_heroInfo.memberType = _setPostType;
				_opaque = 0;
				refeashVale();
			}
		}
		private function refeashVale():void
		{
			_skin.lbMsg.htmlText = LanguageConfig.replaceStr("你想任命$为统帅？",HtmlTextUtil.getTextColor(0x5DBD37,_heroInfo.name));
			refeashShowInfo();
		}
		
		private function refeashShowInfo():void
		{
			var guildLevelInfo:Q_guild = GuildManager.instance().guildLevelInfo;
			var count:int = GuildManager.instance().getLeaderCount();
			
			_skin.lbLead.text = "统帅("+count+"/"+guildLevelInfo.q_deputy_chief_num+")";
			_group.selectedIndex = _heroInfo.isLeader==1?0:1;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnOk)
			{
				if(_opaque>=0)
					return ;
				var posttype:int = _postList[_group.selectedIndex];
				
				
				if(posttype == lastLeaderType)
					return ;
				_heroInfo.memberType = (posttype==EnumGuildPost.GUILDPOST_LEADER?1:0);
				_opaque = GuildManager.opaque;
				_setPostType = posttype;
				GuildManager.instance().guildAppoint(_heroId,_setPostType,_opaque);
			}
		}
		
		private function get lastLeaderType():int
		{
			return _heroInfo.isLeader==1?EnumGuildPost.GUILDPOST_LEADER:EnumGuildPost.GUILDPOST_OTHER;
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
		}
	}
}