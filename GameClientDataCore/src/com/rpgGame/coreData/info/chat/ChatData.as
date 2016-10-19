package com.rpgGame.coreData.info.chat
{


	/**
	 * 聊天缓存数据
	 * @author fly.liuyang
	 * 创建时间：2014-3-19 上午11:50:09
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-3-06  上午11:31:29
	 *
	 */
	public class ChatData
	{
		private var _preData : Vector.<ChatInfo>;
		private var _data : Vector.<ChatInfo>;
		private var maxLen : int;
		/**
		 * 一批下来移除的长度 @L.L.M.Sunny 20150306
		 */
		private var _removeLen : int;
		private var _isOverrun : Boolean;
		private var _overrunLen : int;

		public function ChatData(len : int)
		{
			_data = new Vector.<ChatInfo>();
			_preData = new Vector.<ChatInfo>();
			maxLen = len;
			_removeLen = maxLen / 5; //移除1/5的条目 
			_isOverrun = false;
			_overrunLen = 0;
		}

		public function get overrunLen() : int
		{
			return _overrunLen;
		}

		public function get data() : Vector.<ChatInfo>
		{
			return _data;
		}

		public function get preData() : Vector.<ChatInfo>
		{
			return _preData;
		}

		public function push(info : ChatInfo) : void
		{
			data.push(info);
			if (data.length > maxLen)
			{
				_data.splice(0, _removeLen);
				_overrunLen += _removeLen;
				_isOverrun = true;
			}
			_preData.push(info);
			if (_preData.length > maxLen)
			{
				_preData.shift();
			}
		}

		/**
		 * 标记超限  @L.L.M.Sunny 20150306
		 * @return
		 *
		 */
		public function get isOverrun() : Boolean
		{
			return _isOverrun;
		}

		public function get preDataEmpty() : Boolean
		{
			return _preData.length == 0;
		}

		public function clearPreData() : void
		{
			_preData.length = 0;
		}

		public function clearOverrun() : void
		{
			_isOverrun = false;
			_overrunLen = 0;
		}

		public function allToPreData() : void
		{
			_preData = data.slice();
		}

		/**
		 * 移除过时消息
		 *
		 */
		public function trim() : int
		{
			var count : int;
			var clone : Vector.<ChatInfo> = new Vector.<ChatInfo>();
			for each (var info : ChatInfo in _data)
			{
				count += info.sign();
				if (!info.isTimeOut())
				{
					clone.push(info);
				}
			}
			_data = clone;
			return count;
		}
	}
}
