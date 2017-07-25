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
		
		//金币剩余崇拜次数
		private var _count: int;
		
		//元宝剩余膜拜次数
		private var _goldCount: int;
		
		//加成系数
		private var _percentage: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//金币剩余崇拜次数
			writeInt(_count);
			//元宝剩余膜拜次数
			writeInt(_goldCount);
			//加成系数
			writeInt(_percentage);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//金币剩余崇拜次数
			_count = readInt();
			//元宝剩余膜拜次数
			_goldCount = readInt();
			//加成系数
			_percentage = readInt();
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
		 * get 金币剩余崇拜次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 金币剩余崇拜次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
		/**
		 * get 元宝剩余膜拜次数
		 * @return 
		 */
		public function get goldCount(): int{
			return _goldCount;
		}
		
		/**
		 * set 元宝剩余膜拜次数
		 */
		public function set goldCount(value: int): void{
			this._goldCount = value;
		}
		
		/**
		 * get 加成系数
		 * @return 
		 */
		public function get percentage(): int{
			return _percentage;
		}
		
		/**
		 * set 加成系数
		 */
		public function set percentage(value: int): void{
			this._percentage = value;
		}
		
	}
}