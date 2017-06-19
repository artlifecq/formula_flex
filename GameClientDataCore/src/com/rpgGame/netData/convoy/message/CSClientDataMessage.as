package com.rpgGame.netData.convoy.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 面板数据
	 */
	public class CSClientDataMessage extends Message {
	
		//任务怪物Id
		private var _monsterId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务怪物Id
			writeInt(_monsterId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务怪物Id
			_monsterId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 230206;
		}
		
		/**
		 * get 任务怪物Id
		 * @return 
		 */
		public function get monsterId(): int{
			return _monsterId;
		}
		
		/**
		 * set 任务怪物Id
		 */
		public function set monsterId(value: int): void{
			this._monsterId = value;
		}
		
	}
}