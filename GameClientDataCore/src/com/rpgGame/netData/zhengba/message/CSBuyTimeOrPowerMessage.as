package com.rpgGame.netData.zhengba.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 购买挑战次数或战斗力
	 */
	public class CSBuyTimeOrPowerMessage extends Message {
	
		//1 购买次数  2 购买战斗力
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 购买次数  2 购买战斗力
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 购买次数  2 购买战斗力
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127110;
		}
		
		/**
		 * get 1 购买次数  2 购买战斗力
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 购买次数  2 购买战斗力
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}