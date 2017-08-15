package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知消息
	 */
	public class SCNoticeMessage extends Message {
	
		//通知索引
		private var _noticeIndex: int;
		
		//参数列表
		private var _values: Vector.<String> = new Vector.<String>();
		//子参数
		private var _parameters: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//通知索引
			writeInt(_noticeIndex);
			//参数列表
			writeShort(_values.length);
			for (i = 0; i < _values.length; i++) {
				writeString(_values[i]);
			}
			//子参数
			writeString(_parameters);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//通知索引
			_noticeIndex = readInt();
			//参数列表
			var values_length : int = readShort();
			for (i = 0; i < values_length; i++) {
				_values[i] = readString();
			}
			//子参数
			_parameters = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103215;
		}
		
		/**
		 * get 通知索引
		 * @return 
		 */
		public function get noticeIndex(): int{
			return _noticeIndex;
		}
		
		/**
		 * set 通知索引
		 */
		public function set noticeIndex(value: int): void{
			this._noticeIndex = value;
		}
		
		/**
		 * get 参数列表
		 * @return 
		 */
		public function get values(): Vector.<String>{
			return _values;
		}
		
		/**
		 * set 参数列表
		 */
		public function set values(value: Vector.<String>): void{
			this._values = value;
		}
		
		/**
		 * get 子参数
		 * @return 
		 */
		public function get parameters(): String{
			return _parameters;
		}
		
		/**
		 * set 子参数
		 */
		public function set parameters(value: String): void{
			this._parameters = value;
		}
		
	}
}