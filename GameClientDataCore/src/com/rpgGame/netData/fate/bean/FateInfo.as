package com.rpgGame.netData.fate.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 绝命任务数据
	 */
	public class FateInfo extends Bean {
	
		//兑换主键ID
		private var _exId: int;
		
		//已完成次数
		private var _finishCount: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//兑换主键ID
			writeInt(_exId);
			//已完成次数
			writeInt(_finishCount);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//兑换主键ID
			_exId = readInt();
			//已完成次数
			_finishCount = readInt();
			return true;
		}
		
		/**
		 * get 兑换主键ID
		 * @return 
		 */
		public function get exId(): int{
			return _exId;
		}
		
		/**
		 * set 兑换主键ID
		 */
		public function set exId(value: int): void{
			this._exId = value;
		}
		
		/**
		 * get 已完成次数
		 * @return 
		 */
		public function get finishCount(): int{
			return _finishCount;
		}
		
		/**
		 * set 已完成次数
		 */
		public function set finishCount(value: int): void{
			this._finishCount = value;
		}
		
	}
}