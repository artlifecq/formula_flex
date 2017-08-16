package com.rpgGame.netData.buff.bean{
	import com.rpgGame.netData.buff.bean.BuffParameter;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * buff信息类
	 */
	public class BuffInfo extends Bean {
	
		//buff唯一Id
		private var _buffId: long;
		
		//buff模板Id
		private var _buffModelId: int;
		
		//叠加层数
		private var _overlay: int;
		
		//持续时间
		private var _totalTime: int;
		
		//持续剩余时间
		private var _remainTime: int;
		
		//值加成
		private var _value: int;
		
		//比例加成
		private var _percent: int;
		
		//参数
		private var _buffParameter: Vector.<BuffParameter> = new Vector.<BuffParameter>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//buff唯一Id
			writeLong(_buffId);
			//buff模板Id
			writeInt(_buffModelId);
			//叠加层数
			writeInt(_overlay);
			//持续时间
			writeInt(_totalTime);
			//持续剩余时间
			writeInt(_remainTime);
			//值加成
			writeInt(_value);
			//比例加成
			writeInt(_percent);
			//参数
			writeShort(_buffParameter.length);
			for (var i: int = 0; i < _buffParameter.length; i++) {
				writeBean(_buffParameter[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//buff唯一Id
			_buffId = readLong();
			//buff模板Id
			_buffModelId = readInt();
			//叠加层数
			_overlay = readInt();
			//持续时间
			_totalTime = readInt();
			//持续剩余时间
			_remainTime = readInt();
			//值加成
			_value = readInt();
			//比例加成
			_percent = readInt();
			//参数
			var buffParameter_length : int = readShort();
			for (var i: int = 0; i < buffParameter_length; i++) {
				_buffParameter[i] = readBean(BuffParameter) as BuffParameter;
			}
			return true;
		}
		
		/**
		 * get buff唯一Id
		 * @return 
		 */
		public function get buffId(): long{
			return _buffId;
		}
		
		/**
		 * set buff唯一Id
		 */
		public function set buffId(value: long): void{
			this._buffId = value;
		}
		
		/**
		 * get buff模板Id
		 * @return 
		 */
		public function get buffModelId(): int{
			return _buffModelId;
		}
		
		/**
		 * set buff模板Id
		 */
		public function set buffModelId(value: int): void{
			this._buffModelId = value;
		}
		
		/**
		 * get 叠加层数
		 * @return 
		 */
		public function get overlay(): int{
			return _overlay;
		}
		
		/**
		 * set 叠加层数
		 */
		public function set overlay(value: int): void{
			this._overlay = value;
		}
		
		/**
		 * get 持续时间
		 * @return 
		 */
		public function get totalTime(): int{
			return _totalTime;
		}
		
		/**
		 * set 持续时间
		 */
		public function set totalTime(value: int): void{
			this._totalTime = value;
		}
		
		/**
		 * get 持续剩余时间
		 * @return 
		 */
		public function get remainTime(): int{
			return _remainTime;
		}
		
		/**
		 * set 持续剩余时间
		 */
		public function set remainTime(value: int): void{
			this._remainTime = value;
		}
		
		/**
		 * get 值加成
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 值加成
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
		/**
		 * get 比例加成
		 * @return 
		 */
		public function get percent(): int{
			return _percent;
		}
		
		/**
		 * set 比例加成
		 */
		public function set percent(value: int): void{
			this._percent = value;
		}
		
		/**
		 * get 参数
		 * @return 
		 */
		public function get buffParameter(): Vector.<BuffParameter>{
			return _buffParameter;
		}
		
		/**
		 * set 参数
		 */
		public function set buffParameter(value: Vector.<BuffParameter>): void{
			this._buffParameter = value;
		}
		
	}
}