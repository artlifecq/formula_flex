package com.rpgGame.netData.warFlag.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求战旗升阶消息
	 */
	public class CSWarFlagStratumUpToGameMessage extends Message {
	
		//自动购买材料
		private var _Automatic: int;
		
		//自动进阶 1 手动0
		private var _AutoUp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//自动购买材料
			writeByte(_Automatic);
			//自动进阶 1 手动0
			writeByte(_AutoUp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//自动购买材料
			_Automatic = readByte();
			//自动进阶 1 手动0
			_AutoUp = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 229202;
		}
		
		/**
		 * get 自动购买材料
		 * @return 
		 */
		public function get Automatic(): int{
			return _Automatic;
		}
		
		/**
		 * set 自动购买材料
		 */
		public function set Automatic(value: int): void{
			this._Automatic = value;
		}
		
		/**
		 * get 自动进阶 1 手动0
		 * @return 
		 */
		public function get AutoUp(): int{
			return _AutoUp;
		}
		
		/**
		 * set 自动进阶 1 手动0
		 */
		public function set AutoUp(value: int): void{
			this._AutoUp = value;
		}
		
	}
}