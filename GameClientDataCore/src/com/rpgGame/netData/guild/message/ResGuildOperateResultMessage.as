package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 操作结果反馈
	 */
	public class ResGuildOperateResultMessage extends Message {
	
		//操作标识
		private var _opaque: int;
		
		//操作结构,1:成功,0:失败
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作标识
			writeInt(_opaque);
			//操作结构,1:成功,0:失败
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作标识
			_opaque = readInt();
			//操作结构,1:成功,0:失败
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111199;
		}
		
		/**
		 * get 操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
		/**
		 * get 操作结构,1:成功,0:失败
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 操作结构,1:成功,0:失败
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}