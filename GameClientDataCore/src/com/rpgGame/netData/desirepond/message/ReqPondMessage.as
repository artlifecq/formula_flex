package com.rpgGame.netData.desirepond.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求许愿
	 */
	public class ReqPondMessage extends Message {
	
		//类型 1 经验 2 装备 3 金币 4 真气
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型 1 经验 2 装备 3 金币 4 真气
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型 1 经验 2 装备 3 金币 4 真气
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 220202;
		}
		
		/**
		 * get 类型 1 经验 2 装备 3 金币 4 真气
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型 1 经验 2 装备 3 金币 4 真气
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}