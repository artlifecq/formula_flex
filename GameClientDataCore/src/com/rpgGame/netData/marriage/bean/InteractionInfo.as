package com.rpgGame.netData.marriage.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 婚姻互动数据
	 */
	public class InteractionInfo extends Bean {
	
		//互动类型 1 送花    2  拥抱    3  亲吻       4  洞房
		private var _type: int;
		
		//剩余次数
		private var _subNumber: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//互动类型 1 送花    2  拥抱    3  亲吻       4  洞房
			writeInt(_type);
			//剩余次数
			writeInt(_subNumber);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//互动类型 1 送花    2  拥抱    3  亲吻       4  洞房
			_type = readInt();
			//剩余次数
			_subNumber = readInt();
			return true;
		}
		
		/**
		 * get 互动类型 1 送花    2  拥抱    3  亲吻       4  洞房
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 互动类型 1 送花    2  拥抱    3  亲吻       4  洞房
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 剩余次数
		 * @return 
		 */
		public function get subNumber(): int{
			return _subNumber;
		}
		
		/**
		 * set 剩余次数
		 */
		public function set subNumber(value: int): void{
			this._subNumber = value;
		}
		
	}
}