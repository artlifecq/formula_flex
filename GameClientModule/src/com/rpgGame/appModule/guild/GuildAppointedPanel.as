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
	import org.mokylin.skin.app.banghui.TanKuang_ZhiWeiRenMing;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GuildAppointedPanel extends SkinUIPanel
	{
		private var _skin:TanKuang_ZhiWeiRenMing;
		private var _heroId:long;
		private var _heroInfo:GuildMemberInfo;
		private var _group:ToggleGroup;
		private var _postList:Vector.<int>;
		private var _opaque:int;
		private var _setPostType:int;
		public function GuildAppointedPanel():void
		{
			_skin = new TanKuang_ZhiWeiRenMing();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_group = new ToggleGroup();
			_skin.chkBangzhu.toggleGroup = _group;
			_skin.chkFubangzhu.toggleGroup = _group;
			_skin.chkZhanglao.toggleGroup = _group;
			_skin.chkPutong.toggleGroup = _group;
			_postList = new Vector.<int>();
			_postList.push(EnumGuildPost.GUILDPOST_CHIEF);
			_postList.push(EnumGuildPost.GUILDPOST_VICE_CHIEF);
			_postList.push(EnumGuildPost.GUILDPOST_ELDERS);
			_postList.push(EnumGuildPost.GUILDPOST_OTHER);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var arr:Array = data as Array;
			_heroId = new long(arr[0]);
			_heroInfo = GuildManager.instance().getGuildMemberInfoById(arr[0]);
			_opaque = 0;
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
			_skin.lbMsg.htmlText = LanguageConfig.replaceStr("你想任命$什么职位？",HtmlTextUtil.getTextColor(0x5DBD37,_heroInfo.name));
			_skin.chkBangzhu.isEnabled = GuildManager.instance().canMinister;
			_skin.chkFubangzhu.isEnabled = GuildManager.instance().canViceMinister;
			_skin.chkZhanglao.isEnabled = GuildManager.instance().canElder;
			_skin.chkPutong.isEnabled = GuildManager.instance().canNormal;
			refeashShowInfo();
		}
		
		private function refeashShowInfo():void
		{
			var guildLevelInfo:Q_guild = GuildManager.instance().guildLevelInfo;
			var post:int = EnumGuildPost.GUILDPOST_VICE_CHIEF;
			var count:int = GuildManager.instance().getMemberCountByType(post);
			var postInfo:Q_guild_permission = GuildCfgData.getPermissionInfo(post);
			
			_skin.lbFubangzhu.text = postInfo.q_name+"("+count+"/"+guildLevelInfo.q_deputy_chief_num+")";
			
			post= EnumGuildPost.GUILDPOST_ELDERS;
			count= GuildManager.instance().getMemberCountByType(post);
			postInfo = GuildCfgData.getPermissionInfo(post);
			
			_skin.lbZhanglao.text = postInfo.q_name+"("+count+"/"+guildLevelInfo.q_deputy_chief_num+")";
			_group.selectedIndex = _postList.indexOf(_heroInfo.memberType);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnOk)
			{
				if(_opaque>=0)
					return ;
				var posttype:int = _postList[_group.selectedIndex];
				if(posttype == _heroInfo.memberType)
					return ;
				_heroInfo.memberType = posttype;
				_opaque = GuildManager.opaque;
				_setPostType = posttype;
				GuildManager.instance().guildAppoint(_heroId,_setPostType,_opaque);
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
		}
	}
}