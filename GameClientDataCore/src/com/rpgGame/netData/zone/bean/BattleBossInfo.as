package com.rpgGame.netData.zone.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 经典战役信息
	 */
	public class BattleBossInfo extends Bean {
	
		//BOSSID
		private var _bossModelid: int;
		
		//怪物血量百分比
		private var _hp: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//BOSSID
			writeInt(_bossModelid);
			//怪物血量百分比
			writeInt(_hp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//BOSSID
			_bossModelid = readInt();
			//怪物血量百分比
			_hp = readInt();
			return true;
		}
		
		/**
		 * get BOSSID
		 * @return 
		 */
		public function get bossModelid(): int{
			return _bossModelid;
		}
		
		/**
		 * set BOSSID
		 */
		public function set bossModelid(value: int): void{
			this._bossModelid = value;
		}
		
		/**
		 * get 怪物血量百分比
		 * @return 
		 */
		public function get hp(): int{
			return _hp;
		}
		
		/**
		 * set 怪物血量百分比
		 */
		public function set hp(value: int): void{
			this._hp = value;
		}
		
	}
}