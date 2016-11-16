package com.rpgGame.coreData.info.guild
{
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 * 帮派列表中的单行列表数据 
	 * @author Mandragora
	 * 
	 */	
	public class GuildListItemData
	{
		public function GuildListItemData()
		{
		}
		
		public var guildName : String;
		public var guildLevel : int;
		public var guildLeader : String;
		public var societyNum : int;
		public var fanRongDu : int;
		public var isOnLine : Boolean;
		
		/**
		 * 返回本国帮派列表
		 *
		 * while(buffer.readable()){
		 *      utf 帮派名字
		 *      utf 帮主名字
		 *      varint32 帮派等级
		 *      varint32 家族数量
		 *      varint32 家族繁荣度
		 *      bool 是否有官员在线
		 * }
		 */
		public function readByte(byte:ByteBuffer):void
		{
			guildName = byte.readUTF();
			guildLeader = byte.readUTF();
			guildLevel = byte.readVarint32();
			societyNum = byte.readVarint32();
			fanRongDu = byte.readVarint32();
			isOnLine = byte.readBoolean();
		}
	}
}