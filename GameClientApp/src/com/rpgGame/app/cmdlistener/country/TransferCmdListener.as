package com.rpgGame.app.cmdlistener.country
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.coreData.lang.LangTransfer;
	
	import app.cmd.TransferModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 移民消息处理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-27 上午10:05:12
	 *
	 */
	public class TransferCmdListener extends BaseBean
	{
		public function TransferCmdListener()
		{
		}

		override public function start() : void
		{
			SocketConnection.addCmdListener(TransferModuleMessages.S2C_CHANGE_COUNTRY_FAIL, onChangeCountryFail);
			SocketConnection.addCmdListener(TransferModuleMessages.S2C_CHANGE_COUNTRY_BROADCAST, onChangeCountryBroadcast);

			finish();
		}

		/**
		 * 移民失败，附带varint32错误码
		 *
		 * 1. 国家非法
		 * 2. 物品不够
		 * 3. 内部错误, 稍后再试
		 * 4. 没在普通场景
		 * 5. 有家族
		 * 6. 目标国家等级太高
		 * 7. 王城官员
		 * 11. 还没连服
		 * 12. 国家系统没有开启
		 * 13. 7天内无法移民
		 * 14. 移民时有镖车
		 */
		private function onChangeCountryFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_1;
					break;
				case 2:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_2;
					break;
				case 3:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_3;
					break;
				case 4:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_4;
					break;
				case 5:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_5;
					break;
				case 6:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_6;
					break;
				case 7:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_7;
					break;
				case 8:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_8;
					break;
				case 9:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_9;
					break;
				case 10:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_10;
					break;
				case 11:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_11;
					break;
				case 12:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_12;
					break;
				case 13:
					failReason = LangTransfer.TRANSFER_CHANGE_COUNTRY_FAIL_13;
					break;
				case 13:
					failReason = "移民时有镖车";
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 国家改变广播
		 * varint64 英雄id
		 * varint32 英雄原来的国家id
		 * varint32 英雄新的的国家id
		 * bytes 英雄的名字
		 *
		 * 收到这个消息，要将所有的这个英雄的国家改成新的国家，但是考虑这个可能很难改全，
		 * 所以客户端先将下面的这些处理了，其他的等测试发现之后再改
		 * 1、好友列表[清空自己的好友列表]
		 * 2、场景中的角色
		 */
		private function onChangeCountryBroadcast(buffer : ByteBuffer) : void
		{
			var roleId : Number = buffer.readVarint64();
			var orgCountry : int = buffer.readVarint32();
			var changeCountry : int = buffer.readVarint32();
			var roleName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CountryManager.countryTransfer(roleId, orgCountry, changeCountry, roleName);
		}
	}
}
