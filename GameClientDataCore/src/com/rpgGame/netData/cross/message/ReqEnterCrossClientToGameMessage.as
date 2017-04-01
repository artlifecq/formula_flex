package com.rpgGame.netData.cross.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 前端请求进跨服(test)
	 */
	public class ReqEnterCrossClientToGameMessage extends Message {
	
		//跨服活动类型
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//跨服活动类型
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//跨服活动类型
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250203;
		}
		
		/**
		 * get 跨服活动类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 跨服活动类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}