package com.rpgGame.app.manager.chat
{
	/**
	 * 发言历史记录
	 * @author Guodong.Zhang
	 * 
	 */
	public class ChatSpeakHistoryManager
	{
		public static const MAX_COUNT:int = 5;
		private static var _speakHistoryVec:Vector.<String>;
		private static var _currentIndex:int = -1;
		
		public static function add(content:String):void
		{
			if(_speakHistoryVec == null)
			{
				_speakHistoryVec = new Vector.<String>();
			}
			_speakHistoryVec.unshift(content);
			if(_speakHistoryVec.length > MAX_COUNT)
			{
				_speakHistoryVec.pop();
			}
			_currentIndex = -1;
		}
		
		public static function getLastSend():String
		{
			if(_speakHistoryVec && _speakHistoryVec.length)
			{
				return _speakHistoryVec[0];
			}
			return null;
		}
		
		public static function getPre():String
		{
			if(_speakHistoryVec)
			{
				var len:int = _speakHistoryVec.length;
				if(len > 0)
				{
					_currentIndex++;
					if(_currentIndex >= len)
					{
						_currentIndex = 0;
					}
					var content:String = _speakHistoryVec[_currentIndex];
					return content;
				}
			}
			return null;
		}
		
		public static function getNext():String
		{
			if(_speakHistoryVec)
			{
				var len:int = _speakHistoryVec.length;
				if(len > 0)
				{
					_currentIndex--;
					if(_currentIndex < 0)
					{
						_currentIndex = len - 1;
					}
					var content:String = _speakHistoryVec[_currentIndex];
					return content;
				}
			}
			return null;
		}
	}
}