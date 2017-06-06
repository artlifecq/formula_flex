package com.rpgGame.netData.warFlag.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送战旗扩展已经使用丹药的数量  1资质丹，2成长丹消息
	 */
	public class SCWarFlagExtraItemNumMessage extends Message {
	
		//丹药类型
		private var _type: int;
		
		//丹药数量
		private var _num: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//丹药类型
			writeByte(_type);
			//丹药数量
			writeInt(_num);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//丹药类型
			_type = readByte();
			//丹药数量
			_num = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 229106;
		}
		
		/**
		 * get 丹药类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 丹药类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 丹药数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 丹药数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
	}
}