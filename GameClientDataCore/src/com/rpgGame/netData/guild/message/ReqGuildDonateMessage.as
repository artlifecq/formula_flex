package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求帮派捐献
	 */
	public class ReqGuildDonateMessage extends Message {
	
		//捐献类型,1:令牌,2:元宝
		private var _type: int;
		
		//捐献数量
		private var _num: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//捐献类型,1:令牌,2:元宝
			writeByte(_type);
			//捐献数量
			writeInt(_num);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//捐献类型,1:令牌,2:元宝
			_type = readByte();
			//捐献数量
			_num = readInt();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111214;
		}
		
		/**
		 * get 捐献类型,1:令牌,2:元宝
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 捐献类型,1:令牌,2:元宝
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 捐献数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 捐献数量
		 */
		public function set num(value: int): void{
			this._num = value;
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