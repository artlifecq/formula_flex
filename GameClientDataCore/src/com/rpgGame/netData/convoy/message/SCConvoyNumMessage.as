package com.rpgGame.netData.convoy.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送护送次数
	 */
	public class SCConvoyNumMessage extends Message {
	
		//剩余次数
		private var _remainNum: int;
		
		//宝物id
		private var _girlId: int;
		
		//是否提示面板(0.否 1.是)
		private var _isnotice: int;
		
		//奖励倍数
		private var _isdouble: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//剩余次数
			writeInt(_remainNum);
			//宝物id
			writeInt(_girlId);
			//是否提示面板(0.否 1.是)
			writeInt(_isnotice);
			//奖励倍数
			writeByte(_isdouble);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//剩余次数
			_remainNum = readInt();
			//宝物id
			_girlId = readInt();
			//是否提示面板(0.否 1.是)
			_isnotice = readInt();
			//奖励倍数
			_isdouble = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 230101;
		}
		
		/**
		 * get 剩余次数
		 * @return 
		 */
		public function get remainNum(): int{
			return _remainNum;
		}
		
		/**
		 * set 剩余次数
		 */
		public function set remainNum(value: int): void{
			this._remainNum = value;
		}
		
		/**
		 * get 宝物id
		 * @return 
		 */
		public function get girlId(): int{
			return _girlId;
		}
		
		/**
		 * set 宝物id
		 */
		public function set girlId(value: int): void{
			this._girlId = value;
		}
		
		/**
		 * get 是否提示面板(0.否 1.是)
		 * @return 
		 */
		public function get isnotice(): int{
			return _isnotice;
		}
		
		/**
		 * set 是否提示面板(0.否 1.是)
		 */
		public function set isnotice(value: int): void{
			this._isnotice = value;
		}
		
		/**
		 * get 奖励倍数
		 * @return 
		 */
		public function get isdouble(): int{
			return _isdouble;
		}
		
		/**
		 * set 奖励倍数
		 */
		public function set isdouble(value: int): void{
			this._isdouble = value;
		}
		
	}
}