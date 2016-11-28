package com.rpgGame.netData.offlineres.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取离线收益消息
	 */
	public class ReqGetOfflineOneKeyMessage extends Message {
	
		//一键请求领取离线收益消息
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//一键请求领取离线收益消息
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//一键请求领取离线收益消息
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 209203;
		}
		
		/**
		 * get 一键请求领取离线收益消息
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 一键请求领取离线收益消息
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}