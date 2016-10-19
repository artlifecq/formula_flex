package com.rpgGame.app.sender
{
	import com.game.engine3D.vo.SenderReferenceSet;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	
	import app.cmd.GuildModuleMessages;
	import app.cmd.NpcModuleMessages;

	public class GuildSender extends BaseSender
	{
		public function GuildSender()
		{
		}
		
//		private static const SEND_JOIN_GUILD_LIST : Number = 15000;
//		
//		private static var _reqGetOfficeReferenceSet : SenderReferenceSet = new SenderReferenceSet(onReqGetOffice, SEND_JOIN_GUILD_LIST);
		/**
		 * 请求家族加入帮派的列表
		 *
		 * 只有有权限的官员才可以申请,两次申请间隔必须为15秒
		 */
		public static function getJoinGuildList():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_GET_FAMILY_REQUEST_JOIN_GUILD_LIST,_bytes);
		}
		/**
		 * 请求本国帮派列表,请求时间间隔15秒
		 */
		public static function getGuildList():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_GET_GUILD_LIST,_bytes);
		}
		/**
		 * 请求加入别的帮派, 返回前不能再请求, 或者回复别的帮派的邀请
		 *
		 * 请求时必须自己有家族, 且是有权限申请的人, 且要求加入的帮派没满
		 *
		 * 附带
		 *
		 * bool true(发送申请)/false(取消申请)
		 * 
		 *
		 * byte 要求加入的帮派名字
		 */
		public static function reqJoinGuild(guild:String,isJoin:Boolean):void
		{
			_bytes.clear();
			_bytes.writeBoolean(isJoin);
			_bytes.writeUTFBytes(guild);
			send(GuildModuleMessages.C2S_REQUEST_JOIN,_bytes);
		}
		/**
		* bool 是否同意(true同意,false不同意)
		* bytes 目标家族名字
		*/
		public static function replyJoinReq(isAgree:Boolean,guild:String):void
		{
			_bytes.clear();
			_bytes.writeBoolean(isAgree);
			_bytes.writeUTFBytes(guild);
			send(GuildModuleMessages.C2S_REPLY_JOIN_REQUEST,_bytes);
		}
		/**请求帮派基本数据**/
		public static function getGuildBaseData():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_GUILD_BASIC,_bytes);
		}
		private static const GET_GUILD_BASE_DATA : Number = 15000;
		
		private static var _reqGetGuildBaseDataSet : SenderReferenceSet = new SenderReferenceSet("onGetGuildBaseData",onGetGuildBaseData, GET_GUILD_BASE_DATA);
		private static function onGetGuildBaseData():void
		{
			getGuildBaseData();
		}
		
		public static function addGetGuildBaseDataReference(ref : Object) : void
		{
			_reqGetGuildBaseDataSet.addRef(ref);
		}
		
		public static function removeGetGuildBaseDataReference(ref : Object) : void
		{
			_reqGetGuildBaseDataSet.removeRef(ref);
		}
		
		/**
		 * 查看所有向我们帮派发送过申请的人
		 *
		 * 申请间隔，30S
		 */
		public static function getReqJoinGuildList():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_GET_REQUEST_JOIN_DETAIL,_bytes);
		}
		/**邀请**/
		public static function inviteJoin(heroId : Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(heroId);
			send(GuildModuleMessages.C2S_INVITE_JOIN,_bytes);
		}
		/**
		 * 回复收到的入帮邀请, 在收到返回前不能再回复邀请
		 *
		 * */
		public static function replyJoinInvite(isAgree:Boolean,guild:String):void
		{
			_bytes.clear();
			_bytes.writeBoolean(isAgree);
			_bytes.writeUTFBytes(guild);
			send(GuildModuleMessages.C2S_REPLY_JOIN_INVITE,_bytes);
		}
		/**离开帮派**/
		public static function leaveGuild():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_LEAVE_GUILD,_bytes);
		}
		/**提出**/
		public static function kickGuildMember(name:String):void
		{
			_bytes.clear();
			_bytes.writeUTFBytes(name);
			send(GuildModuleMessages.C2S_KICK_GUILD_MEMBER,_bytes);
		}
		/**
		 * 设置公告
		 * <p>
		 * bytes 公告内容,自己屏蔽屏蔽字,长度不超过100个汉字
		 */
		public static function setAnnouncement(str : String):void
		{
			_bytes.clear();
			_bytes.writeUTFBytes(str);
			send(GuildModuleMessages.C2S_SET_ANNOUNCEMENT,_bytes);
		}
		/**获取公告**/
		public static function getAnnouncement():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_GET_ANNOUCEMENT,_bytes);
		}
		
		public static function setPos(name:String,isset:Boolean,pos:int):void
		{
			_bytes.clear();
			_bytes.writeUTF(name);
			_bytes.writeBoolean(isset);
			_bytes.writeVarint32(pos);
			send(GuildModuleMessages.C2S_SET_POS,_bytes);
		}
		/**申请升级**/
		public static function upgradeLevel():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_UPGRADE_LEVEL,_bytes);
		}
		/**
		 * 领取帮派奖励
		 */
		public static function getSalary():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_COLLECT_PRIZE,_bytes);
		}
		/**
		 * 领取王帮奖励
		 */
		public static function getKingSalary():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_COLLECT_KING_PRIZE,_bytes);
		}
		/**
		 * 请求帮派日志,请求间隔30S
		 */
		public static function getGuildLog():void
		{
			_bytes.clear();
			send(GuildModuleMessages.C2S_GUILD_LOG,_bytes);
		}
		/**帮派创建
		 *    	varint32 要扣除的物品在背包的位置
         *      varint32 底纹
         *      varint32 底框
         *      utf 旗号(策划说只能够是一个汉字)
         *      bytes 帮派名字
		 * **/
		public static function createGuild(npcId:int,dialog : int,pos:int,diwen:int,dikuang:int,banner:String,name:String):void
		{
			_bytes.clear();
			_bytes.writeVarint64(npcId);
			_bytes.writeVarint32(dialog);
			_bytes.writeVarint32(pos);
			_bytes.writeVarint32(diwen);
			_bytes.writeVarint32(dikuang);
			_bytes.writeUTF(banner);
			_bytes.writeUTFBytes(name);
			send(NpcModuleMessages.C2S_ON_CLICK_NPC,_bytes);
		}
		/**
		 * 帮派捐献
		 * <p>
		 * varint32 捐献基数的倍数,必须>=1
		 */
		public static function donate(silver:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint32(silver/GuildCfgData.guildMiscData.donateMoneyBase);
			send(GuildModuleMessages.C2S_DONATE,_bytes);
		}
		
		public static function getFamilyData(name:String):void
		{
			_bytes.clear();
			_bytes.writeUTFBytes(name);
			send(GuildModuleMessages.C2S_GUILD_FAMILY_MEMBERS,_bytes);
		}
			
	}
}