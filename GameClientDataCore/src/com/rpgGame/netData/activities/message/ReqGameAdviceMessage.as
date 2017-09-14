package com.rpgGame.netData.activities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 游戏BUG或者建议提交
	 */
	public class ReqGameAdviceMessage extends Message {
	
		//1 游戏BUG 2游戏建议
		private var _type: int;
		
		//内容
		private var _content: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 游戏BUG 2游戏建议
			writeByte(_type);
			//内容
			writeString(_content);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 游戏BUG 2游戏建议
			_type = readByte();
			//内容
			_content = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 181206;
		}
		
		/**
		 * get 1 游戏BUG 2游戏建议
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 游戏BUG 2游戏建议
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 内容
		 * @return 
		 */
		public function get content(): String{
			return _content;
		}
		
		/**
		 * set 内容
		 */
		public function set content(value: String): void{
			this._content = value;
		}
		
	}
}