package com.rpgGame.netData.warFlag.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求使用战旗资质丹或者成长丹消息
	 */
	public class CSUseWarFlagAddtionMessage extends Message {
	
		//类型 1 资质丹,2成长丹
		private var _type: int;
		
		//数量
		private var _num: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型 1 资质丹,2成长丹
			writeByte(_type);
			//数量
			writeInt(_num);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型 1 资质丹,2成长丹
			_type = readByte();
			//数量
			_num = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 229204;
		}
		
		/**
		 * get 类型 1 资质丹,2成长丹
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型 1 资质丹,2成长丹
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
	}
}