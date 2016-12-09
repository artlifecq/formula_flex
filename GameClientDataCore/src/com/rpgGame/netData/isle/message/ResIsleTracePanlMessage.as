package com.rpgGame.netData.isle.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回比武岛追踪面板消息
	 */
	public class ResIsleTracePanlMessage extends Message {
	
		//活动开启时间
		private var _openTimes: int;
		
		//活动结束时间
		private var _endTimes: int;
		
		//旗帜归属帮会名称
		private var _guildName: String;
		
		//累积经验
		private var _exp: long;
		
		//累积真气
		private var _zhenqi: long;
		
		//累积军功值
		private var _rankvalue: long;
		
		//累积开的宝箱数
		private var _chestNum: int;
		
		//军功值获取的上限
		private var _rankMax: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动开启时间
			writeInt(_openTimes);
			//活动结束时间
			writeInt(_endTimes);
			//旗帜归属帮会名称
			writeString(_guildName);
			//累积经验
			writeLong(_exp);
			//累积真气
			writeLong(_zhenqi);
			//累积军功值
			writeLong(_rankvalue);
			//累积开的宝箱数
			writeInt(_chestNum);
			//军功值获取的上限
			writeLong(_rankMax);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动开启时间
			_openTimes = readInt();
			//活动结束时间
			_endTimes = readInt();
			//旗帜归属帮会名称
			_guildName = readString();
			//累积经验
			_exp = readLong();
			//累积真气
			_zhenqi = readLong();
			//累积军功值
			_rankvalue = readLong();
			//累积开的宝箱数
			_chestNum = readInt();
			//军功值获取的上限
			_rankMax = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 216102;
		}
		
		/**
		 * get 活动开启时间
		 * @return 
		 */
		public function get openTimes(): int{
			return _openTimes;
		}
		
		/**
		 * set 活动开启时间
		 */
		public function set openTimes(value: int): void{
			this._openTimes = value;
		}
		
		/**
		 * get 活动结束时间
		 * @return 
		 */
		public function get endTimes(): int{
			return _endTimes;
		}
		
		/**
		 * set 活动结束时间
		 */
		public function set endTimes(value: int): void{
			this._endTimes = value;
		}
		
		/**
		 * get 旗帜归属帮会名称
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 旗帜归属帮会名称
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 累积经验
		 * @return 
		 */
		public function get exp(): long{
			return _exp;
		}
		
		/**
		 * set 累积经验
		 */
		public function set exp(value: long): void{
			this._exp = value;
		}
		
		/**
		 * get 累积真气
		 * @return 
		 */
		public function get zhenqi(): long{
			return _zhenqi;
		}
		
		/**
		 * set 累积真气
		 */
		public function set zhenqi(value: long): void{
			this._zhenqi = value;
		}
		
		/**
		 * get 累积军功值
		 * @return 
		 */
		public function get rankvalue(): long{
			return _rankvalue;
		}
		
		/**
		 * set 累积军功值
		 */
		public function set rankvalue(value: long): void{
			this._rankvalue = value;
		}
		
		/**
		 * get 累积开的宝箱数
		 * @return 
		 */
		public function get chestNum(): int{
			return _chestNum;
		}
		
		/**
		 * set 累积开的宝箱数
		 */
		public function set chestNum(value: int): void{
			this._chestNum = value;
		}
		
		/**
		 * get 军功值获取的上限
		 * @return 
		 */
		public function get rankMax(): long{
			return _rankMax;
		}
		
		/**
		 * set 军功值获取的上限
		 */
		public function set rankMax(value: long): void{
			this._rankMax = value;
		}
		
	}
}