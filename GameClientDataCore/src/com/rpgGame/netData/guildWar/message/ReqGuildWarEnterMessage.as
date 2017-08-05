package com.rpgGame.netData.guildWar.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求进入帮会战
	 */
	public class ReqGuildWarEnterMessage extends Message {
	
		//0:自动进入对应帮会战,1:只进入皇城帮会战
		private var _isKing: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0:自动进入对应帮会战,1:只进入皇城帮会战
			writeByte(_isKing);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0:自动进入对应帮会战,1:只进入皇城帮会战
			_isKing = readByte();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253202;
		}
		
		/**
		 * get 0:自动进入对应帮会战,1:只进入皇城帮会战
		 * @return 
		 */
		public function get isKing(): int{
			return _isKing;
		}
		
		/**
		 * set 0:自动进入对应帮会战,1:只进入皇城帮会战
		 */
		public function set isKing(value: int): void{
			this._isKing = value;
		}
		
		/**
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}