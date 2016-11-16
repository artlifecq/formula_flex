package com.rpgGame.coreData.info.guild
{
	import org.game.netCore.net_protobuff.ByteBuffer;

	public class GuildReqJoinData
	{
		public function GuildReqJoinData()
		{
		}
		
		public var name : String;
		public var leader : String;
		public var level : int;
		public var fightAmount:Number;
		public var playerNum:int;
		
		public function readBytes(bytebuff:ByteBuffer):void
		{
			name = bytebuff.readUTF();
			leader = bytebuff.readUTF();
			level = bytebuff.readVarint32();
			fightAmount = bytebuff.readVarint64();
			playerNum = bytebuff.readVarint32();
		}
	}
}