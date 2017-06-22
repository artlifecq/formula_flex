package com.rpgGame.netData.guildWar.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求王城报名信息
	 */
	public class ReqGuildWarCityApplyInfoMessage extends Message {
	
		//王城类型,1:卫城,2:王城
		private var _type: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//王城类型,1:卫城,2:王城
			writeInt(_type);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//王城类型,1:卫城,2:王城
			_type = readInt();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253302;
		}
		
		/**
		 * get 王城类型,1:卫城,2:王城
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 王城类型,1:卫城,2:王城
		 */
		public function set type(value: int): void{
			this._type = value;
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