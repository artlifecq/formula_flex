package com.rpgGame.coreData.info.familyWar
{
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 * 王成战副本数据 
	 * @author Mandragora
	 * 
	 */
	public class FamilyWarDungeonRankData
	{
		
		public function FamilyWarDungeonRankData()
		{
		}
		
		
		public var rankDatas : Vector.<FamilyWarDungeonRankItemData>;
		/**
		 * 杀人排行榜，已经压缩，附带排行榜数据
		 *
		 * while(buffer.readable()){
		 *      varint64 英雄id，用来判断是不是自己
		 *      UTF8 英雄名称
		 *      varint64 杀人数
		 *      UTF8 所属帮派名
		 *      varint32 连杀人数
		 *      varint32 击杀塔的数量
		 * }
		 */
		public function readByte(bytes:ByteBuffer):void
		{
			if(!rankDatas)
				rankDatas = new Vector.<FamilyWarDungeonRankItemData>();
			else
				rankDatas.length = 0;
			while(bytes.bytesAvailable)
			{
				var rankData : FamilyWarDungeonRankItemData = new FamilyWarDungeonRankItemData();
				rankData.readBytes(bytes);
				rankData.rank = rankDatas.length+1;
				rankDatas.push(rankData);
			}
		}
		
		public var broadcasts : Vector.<FamilyWarBroadcastData>;
		/**读取所有的战报广播**/
//		public function readBroadcasts(data:Array):void
//		{
//			if(!broadcasts)
//				broadcasts = new Vector.<FamilyWarBroadcastData>();
//			else
//				broadcasts.length = 0;
//			for each(var oneof:KingWarBroadcastProto in data)
//			{
//				addOneBroadcast(oneof);
//			}
//		}
//		/**添加一条战场广播**/
//		public function addOneBroadcast(oneof:KingWarBroadcastProto):FamilyWarBroadcastData
//		{
//			if(!broadcasts)
//				broadcasts = new Vector.<FamilyWarBroadcastData>();
//			var familyBroadcast : FamilyWarBroadcastData = new FamilyWarBroadcastData();
//			familyBroadcast.setData(oneof);
//			broadcasts.push(familyBroadcast);
//			return familyBroadcast;
//		}
	}
}