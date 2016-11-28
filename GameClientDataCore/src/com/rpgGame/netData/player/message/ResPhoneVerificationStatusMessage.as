package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 电话验证状态
	 */
	public class ResPhoneVerificationStatusMessage extends Message {
	
		//类型 1电话领奖 2小游戏领奖
		private var _type: int;
		
		//0未验证 1已验证 2已领奖
		private var _status: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型 1电话领奖 2小游戏领奖
			writeByte(_type);
			//0未验证 1已验证 2已领奖
			writeInt(_status);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型 1电话领奖 2小游戏领奖
			_type = readByte();
			//0未验证 1已验证 2已领奖
			_status = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103121;
		}
		
		/**
		 * get 类型 1电话领奖 2小游戏领奖
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型 1电话领奖 2小游戏领奖
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 0未验证 1已验证 2已领奖
		 * @return 
		 */
		public function get status(): int{
			return _status;
		}
		
		/**
		 * set 0未验证 1已验证 2已领奖
		 */
		public function set status(value: int): void{
			this._status = value;
		}
		
	}
}