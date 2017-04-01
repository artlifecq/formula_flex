package com.rpgGame.coreData.info.guild
{
	import org.game.netCore.net_protobuff.ByteBuffer;

	public class GuildBeenInviteData
	{
		public function GuildBeenInviteData()
		{
		}
		/**
		 * 收到别的帮派的入帮邀请
		 *
		 * 缓存2分钟, 2分钟后删掉
		 *
		 * 附带
		 *
		 * varint64 对方id
		 * UTF 对方玩家名字
		 * varint32 帮派的等级
		 * bytes 帮派名字
		 */
		public function readBytes(bytes:ByteBuffer):void
		{
			id = bytes.readVarint64();
			name = bytes.readUTF();
			level = bytes.readVarint32();
			guildName = bytes.readUTFBytes(bytes.bytesAvailable);
		}
		
		public var id : Number;
		public var name:String;
		public var level:int;
		public var guildName : String;
	}
}