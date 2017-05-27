package com.rpgGame.netData.zone.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 击杀信息
	 */
	public class KillMonsterInfo extends Bean {
	
		//怪物ID
		private var _monsterModelId: int;
		
		//击杀数量
		private var _count: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物ID
			writeInt(_monsterModelId);
			//击杀数量
			writeShort(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物ID
			_monsterModelId = readInt();
			//击杀数量
			_count = readShort();
			return true;
		}
		
		/**
		 * get 怪物ID
		 * @return 
		 */
		public function get monsterModelId(): int{
			return _monsterModelId;
		}
		
		/**
		 * set 怪物ID
		 */
		public function set monsterModelId(value: int): void{
			this._monsterModelId = value;
		}
		
		/**
		 * get 击杀数量
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 击杀数量
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}