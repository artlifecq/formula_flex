package com.rpgGame.coreData.info.society
{
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 召唤令牌数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-07-13 上午10:30:12
	 *
	 */
	public class SummonTokenData
	{
		public var tokenType : int;
		public var summonId : int;
		public var leaderName : String;
		public var sceneId : int;
		public var x : int;
		public var y : int;
		public var countryType : int;
		public var timeoutTime : int;
		public var msg : String;

		public function SummonTokenData()
		{
		}

		public function readFrom(buffer : ByteBuffer) : void
		{
			tokenType = buffer.readVarint32();
			summonId = buffer.readVarint32();
			leaderName = buffer.readUTF();
			sceneId = buffer.readVarint32();
			x = buffer.readVarint32();
			y = buffer.readVarint32();
			countryType = buffer.readVarint32();
			timeoutTime = buffer.readVarint64();
			msg = buffer.readUTFBytes(buffer.bytesAvailable);
		}
	}
}
