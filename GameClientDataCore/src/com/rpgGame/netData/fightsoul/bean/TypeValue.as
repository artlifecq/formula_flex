package com.rpgGame.netData.fightsoul.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战魂日常数据
	 */
	public class TypeValue extends Bean {
	
		//战魂途径类型
		private var _type: int;
		
		//当前次数
		private var _count: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战魂途径类型
			writeByte(_type);
			//当前次数
			writeByte(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战魂途径类型
			_type = readByte();
			//当前次数
			_count = readByte();
			return true;
		}
		
		/**
		 * get 战魂途径类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 战魂途径类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 当前次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 当前次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}