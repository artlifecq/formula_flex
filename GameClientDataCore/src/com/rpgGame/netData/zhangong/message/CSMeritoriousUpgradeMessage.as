package com.rpgGame.netData.zhangong.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求升级
	 */
	public class CSMeritoriousUpgradeMessage extends Message {
	
		//战功类型
		private var _type: int;
		
		//升级次数
		private var _number: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战功类型
			writeInt(_type);
			//升级次数
			writeInt(_number);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战功类型
			_type = readInt();
			//升级次数
			_number = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 125102;
		}
		
		/**
		 * get 战功类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 战功类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 升级次数
		 * @return 
		 */
		public function get number(): int{
			return _number;
		}
		
		/**
		 * set 升级次数
		 */
		public function set number(value: int): void{
			this._number = value;
		}
		
	}
}