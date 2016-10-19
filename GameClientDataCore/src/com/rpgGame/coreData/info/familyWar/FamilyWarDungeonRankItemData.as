package com.rpgGame.coreData.info.familyWar
{
	import org.game.netCore.net.ByteBuffer;

	public class FamilyWarDungeonRankItemData
	{
		public function FamilyWarDungeonRankItemData()
		{
		}
		public var playerId : Number;
		public var rank : int;
		public var name : String;
		public var familyName : String;
		public var killCount : int;
		public var nowKillCount : int;//连续击杀
		public var monster : int;
		/**
		 * 杀人排行榜，已经压缩，附带排行榜数据
		 *
		 * while(buffer.readable()){
		 *      varint64 英雄id，用来判断是不是自己
		 *      UTF8 英雄名称
		 *      varint64 杀人数
		 *      UTF8 所属帮派名
		 *  	varint32 连杀人数
         *      varint32 击杀塔的数量
		 * }
		 * **/
		public function readBytes(bytes:ByteBuffer):void
		{
			playerId = bytes.readVarint64();
			name = bytes.readUTF();
			killCount = bytes.readVarint64();
			familyName = bytes.readUTF();
			nowKillCount = bytes.readVarint32();
			monster = bytes.readVarint32();
			var i : int;
		}
	}
}