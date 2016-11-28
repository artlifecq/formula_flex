package com.rpgGame.netData.top.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 崇拜次数改变
	 */
	public class ResWorshipCountMessage extends Message {
	
		//剩余崇拜次数
		private var _count: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//剩余崇拜次数
			writeInt(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//剩余崇拜次数
			_count = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141105;
		}
		
		/**
		 * get 剩余崇拜次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 剩余崇拜次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}