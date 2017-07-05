package com.rpgGame.netData.marriage.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 夫妻互动日志
	 */
	public class MarriageLoggerInfo extends Bean {
	
		//时间
		private var _time: long;
		
		//主动发起互动的玩家姓名
		private var _name: String;
		
		//被动接受互动的玩家姓名
		private var _targetName: String;
		
		//互动类型
		private var _type: int;
		
		//获得的亲密值
		private var _intimacyValue: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//时间
			writeLong(_time);
			//主动发起互动的玩家姓名
			writeString(_name);
			//被动接受互动的玩家姓名
			writeString(_targetName);
			//互动类型
			writeInt(_type);
			//获得的亲密值
			writeInt(_intimacyValue);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//时间
			_time = readLong();
			//主动发起互动的玩家姓名
			_name = readString();
			//被动接受互动的玩家姓名
			_targetName = readString();
			//互动类型
			_type = readInt();
			//获得的亲密值
			_intimacyValue = readInt();
			return true;
		}
		
		/**
		 * get 时间
		 * @return 
		 */
		public function get time(): long{
			return _time;
		}
		
		/**
		 * set 时间
		 */
		public function set time(value: long): void{
			this._time = value;
		}
		
		/**
		 * get 主动发起互动的玩家姓名
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 主动发起互动的玩家姓名
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 被动接受互动的玩家姓名
		 * @return 
		 */
		public function get targetName(): String{
			return _targetName;
		}
		
		/**
		 * set 被动接受互动的玩家姓名
		 */
		public function set targetName(value: String): void{
			this._targetName = value;
		}
		
		/**
		 * get 互动类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 互动类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 获得的亲密值
		 * @return 
		 */
		public function get intimacyValue(): int{
			return _intimacyValue;
		}
		
		/**
		 * set 获得的亲密值
		 */
		public function set intimacyValue(value: int): void{
			this._intimacyValue = value;
		}
		
	}
}