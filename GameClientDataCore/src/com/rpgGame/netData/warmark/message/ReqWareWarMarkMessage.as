package com.rpgGame.netData.warmark.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求佩戴战印
	 */
	public class ReqWareWarMarkMessage extends Message {
	
		//模版Id
		private var _modelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//模版Id
			writeInt(_modelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//模版Id
			_modelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 193202;
		}
		
		/**
		 * get 模版Id
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 模版Id
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
	}
}