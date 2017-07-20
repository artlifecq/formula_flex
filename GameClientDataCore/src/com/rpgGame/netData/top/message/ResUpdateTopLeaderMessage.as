package com.rpgGame.netData.top.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新排行榜魁首
	 */
	public class ResUpdateTopLeaderMessage extends Message {
	
		//排行榜类型
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排行榜类型
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排行榜类型
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141106;
		}
		
		/**
		 * get 排行榜类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 排行榜类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}