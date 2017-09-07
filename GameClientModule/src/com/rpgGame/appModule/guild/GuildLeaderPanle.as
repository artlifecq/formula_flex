package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.enum.EnumGuildPost;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
	import feathers.core.ToggleGroup;
	
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
		private var _currentValue:int;
		private var _maxValue:int;
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
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var arr:Array = data as Array;
			_heroId = long(arr[0]);
			_heroInfo = GuildManager.instance().getGuildMemberInfoById(_heroId.hexValue);
			refeashVale();
			
		}
		
		private function refeashVale():void
		{
			_skin.lbMsg.htmlText = LanguageConfig.replaceStr("你想任命$为统帅？",HtmlTextUtil.getTextColor(0x5DBD37,_heroInfo.name));
			refeashShowInfo();
		}
		
		private function refeashShowInfo():void
		{
			var guildLevelInfo:Q_guild = GuildManager.instance().guildLevelInfo;
			_currentValue = GuildManager.instance().getLeaderCount();
			_maxValue = guildLevelInfo.q_commander_num;
			_skin.lbLead.text = "统帅("+_currentValue+"/"+_maxValue+")";
			_group.selectedIndex = _heroInfo.isLeader==1?0:1;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnOk)
			{
				var posttype:int = _postList[_group.selectedIndex];
				if(posttype == lastLeaderType)
					return ;
				
				if(!_heroInfo.isLeader&&_currentValue>=_maxValue)
				{
					NoticeManager.showNotifyById(60024);
					return ;
				}
				_setPostType =  (posttype==EnumGuildPost.GUILDPOST_LEADER?1:0);
				GuildManager.instance().guildAppoint(_heroId,posttype,1);
				this.hide();
			}
		}
		
		private function get lastLeaderType():int
		{
			return _heroInfo.isLeader==1?EnumGuildPost.GUILDPOST_LEADER:EnumGuildPost.GUILDPOST_OTHER;
		}
		
	}
}