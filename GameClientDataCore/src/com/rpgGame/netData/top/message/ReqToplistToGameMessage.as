package com.rpgGame.netData.top.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 前端请求排行榜列表
	 */
	public class ReqToplistToGameMessage extends Message {
	
		//排行榜类型
		private var _toptype: int;
		
		//开始位置
		private var _start: int;
		
		//长度
		private var _length: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排行榜类型
			writeInt(_toptype);
			//开始位置
			writeInt(_start);
			//长度
			writeInt(_length);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排行榜类型
			_toptype = readInt();
			//开始位置
			_start = readInt();
			//长度
			_length = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141201;
		}
		
		/**
		 * get 排行榜类型
		 * @return 
		 */
		public function get toptype(): int{
			return _toptype;
		}
		
		/**
		 * set 排行榜类型
		 */
		public function set toptype(value: int): void{
			this._toptype = value;
		}
		
		/**
		 * get 开始位置
		 * @return 
		 */
		public function get start(): int{
			return _start;
		}
		
		/**
		 * set 开始位置
		 */
		public function set start(value: int): void{
			this._start = value;
		}
		
		/**
		 * get 长度
		 * @return 
		 */
		public function get length(): int{
			return _length;
		}
		
		/**
		 * set 长度
		 */
		public function set length(value: int): void{
			this._length = value;
		}
		
	}
}