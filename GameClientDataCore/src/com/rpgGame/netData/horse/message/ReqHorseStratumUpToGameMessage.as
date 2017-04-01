package com.rpgGame.netData.horse.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求坐骑升阶
	 */
	public class ReqHorseStratumUpToGameMessage extends Message {
	
		//自动购买材料
		private var _useGold: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//自动购买材料
			writeByte(_useGold);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//自动购买材料
			_useGold = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144202;
		}
		
		/**
		 * get 自动购买材料
		 * @return 
		 */
		public function get useGold(): int{
			return _useGold;
		}
		
		/**
		 * set 自动购买材料
		 */
		public function set useGold(value: int): void{
			this._useGold = value;
		}
		
	}
}