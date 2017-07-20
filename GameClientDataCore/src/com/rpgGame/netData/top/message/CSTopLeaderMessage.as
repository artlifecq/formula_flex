package com.rpgGame.netData.top.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求魁首数据
	 */
	public class CSTopLeaderMessage extends Message {
	
		//排行类型
		private var _topType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排行类型
			writeInt(_topType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排行类型
			_topType = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141207;
		}
		
		/**
		 * get 排行类型
		 * @return 
		 */
		public function get topType(): int{
			return _topType;
		}
		
		/**
		 * set 排行类型
		 */
		public function set topType(value: int): void{
			this._topType = value;
		}
		
	}
}