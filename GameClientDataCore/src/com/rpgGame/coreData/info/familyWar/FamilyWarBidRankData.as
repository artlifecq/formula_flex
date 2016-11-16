package com.rpgGame.coreData.info.familyWar
{
	import org.game.netCore.net_protobuff.ByteBuffer;
	/**
	 * 王城战竞标数据 
	 * @author Mandragora
	 * 
	 */
	public class FamilyWarBidRankData
	{
		public function FamilyWarBidRankData()
		{
		}
		public var rankDatas : Array;
		public function readByte(bytes:ByteBuffer):void
		{
			if(!rankDatas)
				rankDatas = [];
			else
				rankDatas.length = 0;
			while(bytes.bytesAvailable)
			{
				var rankData : FamilyWarBidRankItemData = new FamilyWarBidRankItemData();
				rankData.familyName = bytes.readUTF();
				rankData.bid = bytes.readVarint64();
				rankData.rank = rankDatas.length+1;
				rankDatas.push(rankData);
			}
		}
		
		public function clearRankDatas():void
		{
			rankDatas.length = 0;
		}
	}
}