package com.rpgGame.netData.map.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 论剑数据
	 */
	public class LunJianInfo extends Bean {
	
		//论剑ID
		private var _ljId: int;
		
		//当前难度
		private var _difficut: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//论剑ID
			writeShort(_ljId);
			//当前难度
			writeByte(_difficut);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//论剑ID
			_ljId = readShort();
			//当前难度
			_difficut = readByte();
			return true;
		}
		
		/**
		 * get 论剑ID
		 * @return 
		 */
		public function get ljId(): int{
			return _ljId;
		}
		
		/**
		 * set 论剑ID
		 */
		public function set ljId(value: int): void{
			this._ljId = value;
		}
		
		/**
		 * get 当前难度
		 * @return 
		 */
		public function get difficut(): int{
			return _difficut;
		}
		
		/**
		 * set 当前难度
		 */
		public function set difficut(value: int): void{
			this._difficut = value;
		}
		
	}
}