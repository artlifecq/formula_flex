package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 防沉迷提示信息
	 */
	public class NonagePromptMessage extends Message {
	
		//提示玩家进入沉迷状态
		private var _content: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//提示玩家进入沉迷状态
			writeInt(_content);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//提示玩家进入沉迷状态
			_content = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103117;
		}
		
		/**
		 * get 提示玩家进入沉迷状态
		 * @return 
		 */
		public function get content(): int{
			return _content;
		}
		
		/**
		 * set 提示玩家进入沉迷状态
		 */
		public function set content(value: int): void{
			this._content = value;
		}
		
	}
}