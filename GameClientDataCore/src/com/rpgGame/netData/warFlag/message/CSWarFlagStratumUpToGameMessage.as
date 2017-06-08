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
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//自动购买材料
			writeByte(_Automatic);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//自动购买材料
			_Automatic = readByte();
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
		
	}
}