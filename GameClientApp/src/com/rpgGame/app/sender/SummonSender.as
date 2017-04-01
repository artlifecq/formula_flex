package com.rpgGame.app.sender
{
	import app.cmd.SummonModuleMessages;

	import org.game.netCore.connection.SocketConnection_protoBuffer;

	/**
	 *
	 * 召唤消息发送
	 * @author L.L.M.Sunny
	 * 创建时间：2016-07-13 上午10:05:12
	 *
	 */
	public class SummonSender extends BaseSender
	{
		public function SummonSender()
		{
		}

		/**
		 * 回应官员召唤
		 *
		 * varint32 召唤id
		 */
		public static function reqCountryOfficerSummon(summonId : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(summonId);
			SocketConnection_protoBuffer.send(SummonModuleMessages.C2S_COUNTRY_OFFICER_SUMMON, _bytes);
		}
	}
}
