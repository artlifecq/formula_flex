package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.chat.ClientSettingChatManager;
	import com.rpgGame.coreData.enum.EnumClientSettingIndex;
	
	import flash.utils.ByteArray;
	
	import app.message.ClientConfigsProto;
	import app.message.ClientConfigsProto.ClientConfigProto;

	/**
	 * 客户端设置数据存储到server管理
	 * 由EnumClientSettingIndex定义存到server的key值
	 * server接收的是数据ByteArray，为了客户端使用方便又减小数据体积，客户端采用自定义protoBuf，然后转换成ByteArray发送给server，接收时逆操作即可
	 * 客户端的protoBuf定义路径为GameClientDataCore/proto/client_custom/proto文件夹下*.proto文件，可参考已有文件,定义完后执行client_custom文件夹下的"编译proto.bat"文件生成AS文件
	 * 客户端的protoBuf生成的AS文件路径为GameClientDataCore/app/client_proto
	 * 由子Manager负责具体系统设置的存储，子Manager代码逻辑部分具体可以参考ClientSettingChatManager
	 * @author Guodong.Zhang
	 * 
	 */
	public class ClientSettingManager
	{
		public static function setup(clientConfig:ClientConfigsProto) : void
		{
			var mainByte:ByteArray;
			var chatByte:ByteArray;
			if (clientConfig != null && clientConfig.datas != null)
			{
				var len:int = clientConfig.datas.length;
				for(var i:int = 0; i < len; i++)
				{
					var configProto:ClientConfigProto = clientConfig.datas[i];
					switch(configProto.index)
					{
						case EnumClientSettingIndex.INDEX_MAIN:
							mainByte = configProto.data;
							break;
						case EnumClientSettingIndex.INDEX_CHAT:
							chatByte = configProto.data;
							break;
					}
				}
			}
			ClientSettingOldManager.initData(mainByte);
			ClientSettingChatManager.initData(chatByte);
		}

	}
}
