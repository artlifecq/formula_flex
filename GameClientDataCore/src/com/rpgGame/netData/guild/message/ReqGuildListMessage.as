package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 获取帮派列表
	 */
	public class ReqGuildListMessage extends Message {
	
		//请求页数,从0开始
		private var _page: int;
		
		//是否过滤满员帮会1:过滤,0:不过滤
		private var _isFilterFull: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//请求页数,从0开始
			writeInt(_page);
			//是否过滤满员帮会1:过滤,0:不过滤
			writeByte(_isFilterFull);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//请求页数,从0开始
			_page = readInt();
			//是否过滤满员帮会1:过滤,0:不过滤
			_isFilterFull = readByte();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111231;
		}
		
		/**
		 * get 请求页数,从0开始
		 * @return 
		 */
		public function get page(): int{
			return _page;
		}
		
		/**
		 * set 请求页数,从0开始
		 */
		public function set page(value: int): void{
			this._page = value;
		}
		
		/**
		 * get 是否过滤满员帮会1:过滤,0:不过滤
		 * @return 
		 */
		public function get isFilterFull(): int{
			return _isFilterFull;
		}
		
		/**
		 * set 是否过滤满员帮会1:过滤,0:不过滤
		 */
		public function set isFilterFull(value: int): void{
			this._isFilterFull = value;
		}
		
		/**
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}