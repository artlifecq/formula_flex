package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求电话验证状态领奖
	 */
	public class ReqPhoneVerificationRewardMessage extends Message {
	
		//类型 1电话领奖 2小游戏领奖
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型 1电话领奖 2小游戏领奖
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型 1电话领奖 2小游戏领奖
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103212;
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
		
	}
}