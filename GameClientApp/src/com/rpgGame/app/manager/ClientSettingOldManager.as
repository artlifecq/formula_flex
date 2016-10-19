package com.rpgGame.app.manager
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.sender.MiscSender;
	import com.rpgGame.coreData.enum.EnumClientSettingIndex;
	
	import flash.utils.ByteArray;
	
	import app.client_proto.MainSetProtoC;

	/**
	 * 客户端数据兼容旧版管理器
	 * @author Guodong.Zhang
	 * 
	 */
	public class ClientSettingOldManager
	{
		private static var _byteArray:ByteArray;
		private static var _mainSetProto:MainSetProtoC = new MainSetProtoC();
		
		public static function initData(byteArray:ByteArray):void
		{
			if(byteArray == null)
			{
				return;
			}
			_byteArray = byteArray;
//			trace("parseData_byteArray.length:",_byteArray.length);
			_byteArray.uncompress();
//			trace("parseData_uncompress.length:",_byteArray.length);
			//读取主设置文件
			try
			{
				if(_byteArray.bytesAvailable)
				{
					_mainSetProto.mergeFrom(_byteArray);
				}
			}
			catch(error:Error)
			{
				trace("读取客户端存储主数据错误：ClientSettingOldManager.parseData");
			}
		}
		
		/**
		 * 设置指定数据		保存的是数字类
		 * @param index			参考：EnumClientIntSetting
		 * @param value
		 *
		 */
		public static function reqSetClientOnlyIntConfig(index : int, value : int) : void
		{
			if (index < 0 || index > 19)
			{
				GameLog.add("保存数据超出");
				return;
			}
			if(_mainSetProto.clientOnlyIntConfigs == null)
			{
				_mainSetProto.clientOnlyIntConfigs = [];
			}
			if (_mainSetProto.clientOnlyIntConfigs[index] == value)
			{
				return;
			}
			_mainSetProto.clientOnlyIntConfigs[index] = value;
			savaMainToServer();
		}
		
		/**
		 * 得到指定数值型客户端配置
		 * 注意：重复一遍，读取出来的值需要减1才是真正的值，比如读取到的值为0，则真正的值为-1，此时表示客户端需要使用默认值
		 * @param index				参考：SystemSettingsEnum
		 * @return
		 *
		 */
		public static function getClientOnlyIntConfig(index : int) : int
		{
			if (index < 0 || index > 19)
			{
				GameLog.add("取得数据超出");
				return -1;
			}
			if (_mainSetProto.clientOnlyIntConfigs == null || index >= _mainSetProto.clientOnlyIntConfigs.length)
			{
				return -1;
			}
			
			return _mainSetProto.clientOnlyIntConfigs[index];
		}
		
		private static function savaMainToServer():void
		{
			if(_byteArray == null)
			{
				_byteArray = new ByteArray();
			}
			else
			{
				_byteArray.clear();
			}
			_mainSetProto.writeTo(_byteArray);
//			trace("savaMainToServer_byteArray.length:",_byteArray.length);
			_byteArray.compress();
//			trace("savaMainToServer_compress_length:",_byteArray.length);
			MiscSender.reqSetClientOnlyIntConfig(EnumClientSettingIndex.INDEX_MAIN,_byteArray);
		}
	}
}