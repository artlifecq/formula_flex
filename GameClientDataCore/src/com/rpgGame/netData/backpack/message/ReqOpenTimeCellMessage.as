package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 时间到打开格子申请
	 */
	public class ReqOpenTimeCellMessage extends Message {
	
		//1 包裹  2仓库  3寻宝仓库
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 包裹  2仓库  3寻宝仓库
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 包裹  2仓库  3寻宝仓库
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108213;
		}
		
		/**
		 * get 1 包裹  2仓库  3寻宝仓库
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 包裹  2仓库  3寻宝仓库
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}