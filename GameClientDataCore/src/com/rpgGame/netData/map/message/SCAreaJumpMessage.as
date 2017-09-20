package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 场景跳跃返回消息
	 */
	public class SCAreaJumpMessage extends Message {
	
		//跳跃玩家ID
		private var _playerId: int;
		
		//跳跃ID
		private var _jumpId: int;
		
		//跳跃点
		private var _jumpPos: com.rpgGame.netData.structs.Position;
		
		//花费时间
		private var _costTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//跳跃玩家ID
			writeShort(_playerId);
			//跳跃ID
			writeInt(_jumpId);
			//跳跃点
			writeBean(_jumpPos);
			//花费时间
			writeInt(_costTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//跳跃玩家ID
			_playerId = readShort();
			//跳跃ID
			_jumpId = readInt();
			//跳跃点
			_jumpPos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//花费时间
			_costTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101221;
		}
		
		/**
		 * get 跳跃玩家ID
		 * @return 
		 */
		public function get playerId(): int{
			return _playerId;
		}
		
		/**
		 * set 跳跃玩家ID
		 */
		public function set playerId(value: int): void{
			this._playerId = value;
		}
		
		/**
		 * get 跳跃ID
		 * @return 
		 */
		public function get jumpId(): int{
			return _jumpId;
		}
		
		/**
		 * set 跳跃ID
		 */
		public function set jumpId(value: int): void{
			this._jumpId = value;
		}
		
		/**
		 * get 跳跃点
		 * @return 
		 */
		public function get jumpPos(): com.rpgGame.netData.structs.Position{
			return _jumpPos;
		}
		
		/**
		 * set 跳跃点
		 */
		public function set jumpPos(value: com.rpgGame.netData.structs.Position): void{
			this._jumpPos = value;
		}
		
		/**
		 * get 花费时间
		 * @return 
		 */
		public function get costTime(): int{
			return _costTime;
		}
		
		/**
		 * set 花费时间
		 */
		public function set costTime(value: int): void{
			this._costTime = value;
		}
		
	}
}