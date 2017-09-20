package com.rpgGame.netData.npc.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求npc脚本服务
	 */
	public class ReqServiceMessage extends Message {
	
		//npcId
		private var _npcId: int;
		
		//服务参数
		private var _serviceParameter: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//npcId
			writeShort(_npcId);
			//服务参数
			writeString(_serviceParameter);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//npcId
			_npcId = readShort();
			//服务参数
			_serviceParameter = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 104202;
		}
		
		/**
		 * get npcId
		 * @return 
		 */
		public function get npcId(): int{
			return _npcId;
		}
		
		/**
		 * set npcId
		 */
		public function set npcId(value: int): void{
			this._npcId = value;
		}
		
		/**
		 * get 服务参数
		 * @return 
		 */
		public function get serviceParameter(): String{
			return _serviceParameter;
		}
		
		/**
		 * set 服务参数
		 */
		public function set serviceParameter(value: String): void{
			this._serviceParameter = value;
		}
		
	}
}