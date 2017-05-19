package com.rpgGame.netData.junjie.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求激活
	 */
	public class CSJunJieActivateMessage extends Message {
	
		//军阶ID
		private var _modelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//军阶ID
			writeInt(_modelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//军阶ID
			_modelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 126102;
		}
		
		/**
		 * get 军阶ID
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 军阶ID
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
	}
}