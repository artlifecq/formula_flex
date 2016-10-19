package com.rpgGame.app.sender
{
	import com.rpgGame.coreData.cfg.country.CountryOfficerCfgData;
	
	import app.cmd.CountryModuleMessages;
	import app.cmd.TaskModuleMessages;
	import app.message.CountryOfficerDataProto;
	
	import org.game.netCore.connection.SocketConnection;

	/**
	 * 发送消息
	 * @author 陈鹉光
	 * 
	 */	
	public class MiXinSender extends BaseSender
	{
		/**
		 * 放弃密信
		 */
		public static function giveUpMixin( ):void
		{
			_bytes.clear();
			SocketConnection.send( TaskModuleMessages.C2S_GIVE_UP_MI_XIN ,_bytes);
		}
		
		/**
		 * 开启国家刺探
		 */
		public static function startCountryMiXin():void
		{
			const pos:int = 25;
			var countryOfficerData:CountryOfficerDataProto = CountryOfficerCfgData.getData(pos);
			if(countryOfficerData != null)
			{
				if(!countryOfficerData.canStartMiXin)return;
			}
			_bytes.clear();
			SocketConnection.send( CountryModuleMessages.C2S_START_MI_XIN ,_bytes);
		}
		
		/**
		 * 领取大转盘奖励
		 *
		 * varint32 奖励id
		 */
		public static function collectRoulettePrize(id:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(id);
			SocketConnection.send(TaskModuleMessages.C2S_COLLECT_ROULETTE_PRIZE, _bytes);
		}
	}
}