package com.rpgGame.netData.mibao.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 怪物信息
	 */
	public class RemainMonsterInfo extends Bean {
	
		//剩余数量
		private var _remainingNum: int;
		
		//怪物编号id
		private var _monsterId: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//剩余数量
			writeInt(_remainingNum);
			//怪物编号id
			writeInt(_monsterId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//剩余数量
			_remainingNum = readInt();
			//怪物编号id
			_monsterId = readInt();
			return true;
		}
		
		/**
		 * get 剩余数量
		 * @return 
		 */
		public function get remainingNum(): int{
			return _remainingNum;
		}
		
		/**
		 * set 剩余数量
		 */
		public function set remainingNum(value: int): void{
			this._remainingNum = value;
		}
		
		/**
		 * get 怪物编号id
		 * @return 
		 */
		public function get monsterId(): int{
			return _monsterId;
		}
		
		/**
		 * set 怪物编号id
		 */
		public function set monsterId(value: int): void{
			this._monsterId = value;
		}
		
	}
}