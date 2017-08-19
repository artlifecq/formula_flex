package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.coreData.info.society.SummonTokenData;
	import com.rpgGame.coreData.lang.LangMisc;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	import parse.TokenType;

	/**
	 *
	 * 召唤消息侦听
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 下午4:50:25
	 *
	 */
	public class SummonCmdListener extends BaseBean
	{
		public function SummonCmdListener()
		{
			super();
		}
		
		override public function start() : void
		{
//			SocketConnection_protoBuffer.addCmdListener(SummonModuleMessages.S2C_FAMILY_LEADER_SUMMON, onFamilyLeaderSummon);
//			SocketConnection_protoBuffer.addCmdListener(SummonModuleMessages.S2C_COUNTRY_OFFICER_SUMMON, onCountryOfficerSummon);
//			SocketConnection_protoBuffer.addCmdListener(SummonModuleMessages.S2C_COUNTRY_OFFICER_SUMMON_FAIL, onCountryOfficerSummonFail);

			finish();
		}

		/**
		 * 帮主召唤
		 *
		 * varint32 TokenType令牌类型
		 *
		 * varint32 召唤的id
		 * utfbytes 官员名字
		 * varint32 场景
		 * varint32 x
		 * varint32 y
		 * varint32 CountryType 场景所属国家，0表示中立区
		 * varint64 召唤过期时间
		 * bytes 召唤文本
		 */
		private function onFamilyLeaderSummon(buffer : ByteBuffer) : void
		{
			var tokenData : SummonTokenData = new SummonTokenData();
			tokenData.readFrom(buffer);
//			if (tokenData.tokenType == TokenType.FAMILY_LEADER)
//			{
//				SocietyManager.setLeaderSummon(tokenData);
//			}
		}

		private function onCountryOfficerSummon(buffer : ByteBuffer) : void
		{
		}

		/**
		 * 回应召唤失败，返回varint32错误码
		 *
		 * 1. 没有人召唤过你
		 * 2. 条件不满足
		 */
		private function onCountryOfficerSummonFail(buffer : ByteBuffer) : void
		{
			var failId : int = buffer.readVarint32();
			switch (failId)
			{
				case 1:
					NoticeManager.showNotify(LangMisc.COUNTRY_OFFICER_SUMMON_FAIL1);
					return;
				case 2:
					NoticeManager.showNotify(LangMisc.COUNTRY_OFFICER_SUMMON_FAIL2);
					return;
			}
		}
	}
}
