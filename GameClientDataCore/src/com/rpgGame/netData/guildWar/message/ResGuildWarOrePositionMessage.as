package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复矿id
	 */
	public class ResGuildWarOrePositionMessage extends Message {
	
		//矿Id
		private var _monsterId: int;
		
		//矿位置
		private var _position: com.rpgGame.netData.structs.Position;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//矿Id
			writeShort(_monsterId);
			//矿位置
			writeBean(_position);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//矿Id
			_monsterId = readShort();
			//矿位置
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253111;
		}
		
		/**
		 * get 矿Id
		 * @return 
		 */
		public function get monsterId(): int{
			return _monsterId;
		}
		
		/**
		 * set 矿Id
		 */
		public function set monsterId(value: int): void{
			this._monsterId = value;
		}
		
		/**
		 * get 矿位置
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 矿位置
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
	}
}