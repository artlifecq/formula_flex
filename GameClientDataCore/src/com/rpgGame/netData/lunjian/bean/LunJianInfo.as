package com.rpgGame.netData.lunjian.bean{
	
	
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
	
		//论剑类型
		private var _type: int;
		
		//当前难度
		private var _difficut: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//论剑类型
			writeShort(_type);
			//当前难度
			writeByte(_difficut);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//论剑类型
			_type = readShort();
			//当前难度
			_difficut = readByte();
			return true;
		}
		
		/**
		 * get 论剑类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 论剑类型
		 */
		public function set type(value: int): void{
			this._type = value;
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