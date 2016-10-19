package com.rpgGame.coreData.info.chat
{
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	
	import flash.utils.ByteArray;

	public class ChatSetData
	{
		private var _dataObj : Object;

		public function ChatSetData()
		{
			_dataObj = new Object();
			initValues();
		}

		private function initValues() : void
		{
			if(!nameArr)
				nameArr = ["自定义"];
			if(!channelArr)
				channelArr = [[EnumChatChannelType.CHAT_CHANNEL_SILIAO, EnumChatChannelType.CHAT_CHANNEL_COUNTRY, EnumChatChannelType.CHAT_CHANNEL_FAMILY]];
			if(!clientOnlyIntConfigs)
				clientOnlyIntConfigs = [];
			if(!version)
				version = 0;
			if(!clientOnlyConfig1Low)
				clientOnlyConfig1Low = 0;
			if(!clientOnlyConfig1High)
				clientOnlyConfig1High = 0;
		}

		public function get data() : ByteArray
		{
			var bytes : ByteArray = new ByteArray();
			bytes.writeObject(_dataObj);
			bytes.compress();
			return bytes;
		}

		public function set data(value : ByteArray) : void
		{
			if (value)
			{
				value.uncompress();
				value.position = 0;
				_dataObj = value.readObject();
			}
			else
			{
				_dataObj = new Object();
			}
			initValues();
		}

		public function get nameArr():Array
		{
			return _dataObj["nameArr"];
		}
		public function set nameArr(value:Array):void
		{
			_dataObj["nameArr"] = value;
		}
		
		public function get channelArr():Array
		{
			return _dataObj["channelArr"];
		}
		public function set channelArr(value:Array):void
		{
			_dataObj["channelArr"] = value;
		}
		public function get clientOnlyIntConfigs():Array
		{
			return _dataObj["clientOnlyIntConfigs"];
		}
		public function set clientOnlyIntConfigs(value:Array):void
		{
			_dataObj["clientOnlyIntConfigs"] = value;
		}
		public function get version():int
		{
			return _dataObj["version"];
		}
		public function set version(value:int):void
		{
			_dataObj["version"] = value;
		}
		public function get clientOnlyConfig1Low():int
		{
			return _dataObj["clientOnlyConfig1Low"];
		}
		public function set clientOnlyConfig1Low(value:int):void
		{
			_dataObj["clientOnlyConfig1Low"] = value;
		}
		public function get clientOnlyConfig1High():int
		{
			return _dataObj["clientOnlyConfig1High"];
		}
		public function set clientOnlyConfig1High(value:int):void
		{
			_dataObj["clientOnlyConfig1High"] = value;
		}

	}
}
