package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送玩家杀人数量,决定名字颜色消息
	 */
	public class ReskillnumToClientMessage extends Message {
	
		//角色ID
		private var _playerId: int;
		
		//杀人数量,0是白色名字,2个以下是黄色名字,3个以上是红色
		private var _killnum: int;
		
		//退红名时间(秒)
		private var _redNameTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色ID
			writeShort(_playerId);
			//杀人数量,0是白色名字,2个以下是黄色名字,3个以上是红色
			writeByte(_killnum);
			//退红名时间(秒)
			writeInt(_redNameTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色ID
			_playerId = readShort();
			//杀人数量,0是白色名字,2个以下是黄色名字,3个以上是红色
			_killnum = readByte();
			//退红名时间(秒)
			_redNameTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103125;
		}
		
		/**
		 * get 角色ID
		 * @return 
		 */
		public function get playerId(): int{
			return _playerId;
		}
		
		/**
		 * set 角色ID
		 */
		public function set playerId(value: int): void{
			this._playerId = value;
		}
		
		/**
		 * get 杀人数量,0是白色名字,2个以下是黄色名字,3个以上是红色
		 * @return 
		 */
		public function get killnum(): int{
			return _killnum;
		}
		
		/**
		 * set 杀人数量,0是白色名字,2个以下是黄色名字,3个以上是红色
		 */
		public function set killnum(value: int): void{
			this._killnum = value;
		}
		
		/**
		 * get 退红名时间(秒)
		 * @return 
		 */
		public function get redNameTime(): int{
			return _redNameTime;
		}
		
		/**
		 * set 退红名时间(秒)
		 */
		public function set redNameTime(value: int): void{
			this._redNameTime = value;
		}
		
	}
}