package com.rpgGame.netData.equip.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 部位信息
	 */
	public class KindInfo extends Bean {
	
		//部位下标
		private var _kind: int;
		
		//补天神石等级
		private var _buTianLevel: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//部位下标
			writeInt(_kind);
			//补天神石等级
			writeInt(_buTianLevel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//部位下标
			_kind = readInt();
			//补天神石等级
			_buTianLevel = readInt();
			return true;
		}
		
		/**
		 * get 部位下标
		 * @return 
		 */
		public function get kind(): int{
			return _kind;
		}
		
		/**
		 * set 部位下标
		 */
		public function set kind(value: int): void{
			this._kind = value;
		}
		
		/**
		 * get 补天神石等级
		 * @return 
		 */
		public function get buTianLevel(): int{
			return _buTianLevel;
		}
		
		/**
		 * set 补天神石等级
		 */
		public function set buTianLevel(value: int): void{
			this._buTianLevel = value;
		}
		
	}
}