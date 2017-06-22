package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.chat.NoticeManager;
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
		private var _guildLevelInfo:Q_guild;
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
			_skin.chkPutong.toggleGroup = _group;
//			_skin.chkZhanglao.toggleGroup = _group;
			_postList = new Vector.<int>();
			_postList.push(EnumGuildPost.GUILDPOST_CHIEF);
			_postList.push(EnumGuildPost.GUILDPOST_VICE_CHIEF);
			_postList.push(EnumGuildPost.GUILDPOST_OTHER);
			_postList.push(EnumGuildPost.GUILDPOST_ELDERS);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var arr:Array = data as Array;
			_heroId = long(arr[0]);
			_heroInfo = GuildManager.instance().getGuildMemberInfoById(_heroId.hexValue);
			_opaque = 0;
//			EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
			refeashVale();
			
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
			_guildLevelInfo = GuildManager.instance().guildLevelInfo;
			var post:int = EnumGuildPost.GUILDPOST_VICE_CHIEF;
			var count:int = GuildManager.instance().getMemberCountByType(post);
			var postInfo:Q_guild_permission = GuildCfgData.getPermissionInfo(post);
			
			_skin.lbFubangzhu.text = postInfo.q_name+"("+count+"/"+_guildLevelInfo.q_deputy_chief_num+")";
			
			post= EnumGuildPost.GUILDPOST_ELDERS;
			count= GuildManager.instance().getMemberCountByType(post);
			postInfo = GuildCfgData.getPermissionInfo(post);
			
			_skin.lbZhanglao.text = postInfo.q_name+"("+count+"/"+_guildLevelInfo.q_eleder_num+")";
			if(_guildLevelInfo.q_eleder_num==0)
			{
				_skin.chkZhanglao.toggleGroup =null;
			}else{
				_skin.chkZhanglao.toggleGroup = _group;
			}
			_group.selectedIndex = _postList.indexOf(_heroInfo.memberType);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnOk)
			{
				var posttype:int = _postList[_group.selectedIndex];
				if(posttype == _heroInfo.memberType)
					return ;
				if(!checkCount())
				{
					NoticeManager.showNotifyById(60025);
					return ;
				}
				_heroInfo.memberType = posttype;
				_setPostType = posttype;
				GuildManager.instance().guildAppoint(_heroId,_setPostType,0);
				this.hide();
			}else if(target == _skin.chkZhanglao){
				if(_guildLevelInfo.q_eleder_num==0)
				{
					NoticeManager.showNotifyById(60046);
					_skin.chkZhanglao.isSelected = false;
					return ;
				}
			}
		}
		
		private function checkCount():Boolean
		{
			var posttype:int = _postList[_group.selectedIndex];
			switch(posttype)
			{
				case EnumGuildPost.GUILDPOST_VICE_CHIEF:
					return (GuildManager.instance().getMemberCountByType(EnumGuildPost.GUILDPOST_VICE_CHIEF)<_guildLevelInfo.q_deputy_chief_num);
				case EnumGuildPost.GUILDPOST_ELDERS:
					return (GuildManager.instance().getMemberCountByType(EnumGuildPost.GUILDPOST_ELDERS)<_guildLevelInfo.q_eleder_num);
			}
			return true;
		}
		
	}
}