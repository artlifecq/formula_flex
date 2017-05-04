package com.rpgGame.netData.cheats.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求激活
	 */
	public class CSActiveCheatsMessage extends Message {
	
		//功法Id
		private var _cheatsId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//功法Id
			writeInt(_cheatsId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//功法Id
			_cheatsId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 226201;
		}
		
		/**
		 * get 功法Id
		 * @return 
		 */
		public function get cheatsId(): int{
			return _cheatsId;
		}
		
		/**
		 * set 功法Id
		 */
		public function set cheatsId(value: int): void{
			this._cheatsId = value;
		}
		
	}
}