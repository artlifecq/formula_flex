package com.rpgGame.netData.convoy.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 开始护送
	 */
	public class CSConvoyGirlMessage extends Message {
	
		//是否提示面板(0.否 1.是)
		private var _isnotice: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否提示面板(0.否 1.是)
			writeInt(_isnotice);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否提示面板(0.否 1.是)
			_isnotice = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 230203;
		}
		
		/**
		 * get 是否提示面板(0.否 1.是)
		 * @return 
		 */
		public function get isnotice(): int{
			return _isnotice;
		}
		
		/**
		 * set 是否提示面板(0.否 1.是)
		 */
		public function set isnotice(value: int): void{
			this._isnotice = value;
		}
		
	}
}