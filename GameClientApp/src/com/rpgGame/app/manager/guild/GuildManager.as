package com.rpgGame.app.manager.guild
{
	import com.gameClient.utils.JSONUtil;
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.coreData.lang.LangGuild;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.message.ReqGuildCreateMessage;
	import com.rpgGame.netData.guild.message.ReqGuildInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildInfoMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	/**
	 * 帮派管理类 
	 * @author Mandragora
	 * 
	 */	
	public class GuildManager
	{
		public function GuildManager()
		{
		}
		//------------------------------data-----------------
		private static const MAX_INPUT_TEXT : int = 30;
		private static const MIN_CREATE_LEVEL : int = 45;
		private static var allEvents : Array;
		private var _guildData : GuildInfo;
		/**申请加入我帮派的列表**/
		public var joinGuildList : Array;
		public var guildList : Array;
		
		public var reqJoinGuildList:Array;
		
		public var defaultName:String;
		public var defaultMsg:String;
		
		private var _selfMemberInfo:GuildMemberInfo;
		private var _selfPermissionInfo:Q_guild_permission;
		
		private var _guildLevelInfo:Q_guild;
		private var _memberList: Vector.<GuildMemberInfo>;
		private var _haveDailyGift: int;
		
		private static var _instance:GuildManager;
		public static function instance():GuildManager
		{
			if(_instance==null)
			{
				_instance = new GuildManager();
				_instance.updataSelfInfo();
				_instance.init();
			}
			return _instance;
		}
		private function init():void
		{
			var gd:GuildInfo = new GuildInfo();
			gd.level = 1;
			this.updataGuildData(gd);
		}
		
		private function updataSelfInfo():void
		{
			if(_memberList!=null&&_memberList.length>0)
			{ 
				var length:int = _memberList.length;
				for(var i:int = 0;i<length;i++)
				{
					var menberinfo:GuildMemberInfo = _memberList[i];
					if(MainRoleManager.isSelf(menberinfo.id.ToGID()))
					{
						_selfMemberInfo = menberinfo;
						break;
					}
				}
			}else{
				_selfMemberInfo = new GuildMemberInfo();
			}
			
			if(_selfMemberInfo!=null)
			{
				_selfPermissionInfo = GuildCfgData.getPermissionInfo(_selfMemberInfo.memberType);
			}
		}
		public function requestGuildInfo():void
		{
			SocketConnection.send(new ReqGuildInfoMessage());
		}
		
		public function get memberList():Vector.<GuildMemberInfo>
		{
			return _memberList;
		}
		
		
		public function get guildData():GuildInfo
		{
			return _guildData;
		}
		
		private function updataGuildData(value:GuildInfo):void
		{
			_guildData = value;
			if(_guildData!=null)
				_guildLevelInfo = GuildCfgData.getLevelInfo(_guildData.level);
			else
				_guildLevelInfo = null;
		}
		
		private function updateMemberList(list: Vector.<GuildMemberInfo>):void
		{
			_memberList = list;
			updataSelfInfo();
		}
		
		
		public function setResGuildInfoMessage(msg:ResGuildInfoMessage):void
		{
			this.updataGuildData(msg.guildInfo);
			this.updateMemberList(msg.memberList);
			this._haveDailyGift = msg.haveDailyGift;
		}
		
		public function get haveDailyGift(): int{
			return _haveDailyGift;
		}
		
		private var _allcreateGuildInfo:Array;
		//获取全局配置数据
		
		public function getcreateInfoByIndex(index:int):Object
		{
			if(_allcreateGuildInfo==null)
			{
				_allcreateGuildInfo = new Array();
				_allcreateGuildInfo.push(JSONUtil.decode( GlobalSheetData.getSettingInfo(820).q_string_value));
				_allcreateGuildInfo.push(JSONUtil.decode( GlobalSheetData.getSettingInfo(821).q_string_value));
			}
			return _allcreateGuildInfo[index];
		}
		
		/**获取是否有帮派了**/
		public function get haveGuild():Boolean
		{
			return false;
			return guildData.name != "" &&  guildData.name != null;
		}
		/**创建帮会**/
		public function createGuild(type:int,name:String,banner:String):void
		{
			if(StringFilter.checkBadWords(banner))
			{
				NoticeManager.showNotify("帮派旗号非法。");
				return;
			}
			if(name==""||name== defaultName)
			{
				NoticeManager.showNotify("帮会名字不能为空");
				return ;
			}
			if(StringFilter.checkBadWords(name))
			{
				NoticeManager.showNotify("帮派名非法。");
				return;
			}
			if(haveGuild)
			{
				NoticeManager.showNotify(LangGuild.createGuildHaveGuildFail);
				return;
			}
			
			var item:Object = this.getcreateInfoByIndex(type);
			var money : Number = MainRoleManager.actorInfo.amountInfo.getAmountByType(item["type"]);
			if(money < item["num"])
			{
				NoticeManager.showNotifyById(51001,ItemConfig.getItemName(type));
				return;
			}
			
			var msg:ReqGuildCreateMessage = new ReqGuildCreateMessage();
			msg.costType = type+1;
			msg.name = name;
			msg.note = banner;
			msg.opaque = 1;
			SocketConnection.send(msg);
		}
		//获取自己帮会信息
		public function get selfMemberInfo():GuildMemberInfo
		{
			return _selfMemberInfo;
		}
		
		
		public function get canNotice():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_notice == 1;
		}
		
		
		public function get guildLevelInfo():Q_guild
		{
			return _guildLevelInfo;
		}
		
		
		public function getGuildHaveCityByIndex(index:int):Boolean
		{
			if(index>=3)
				return false;
			return (_guildData.city&(1<<index))>0;
		}
	}
}