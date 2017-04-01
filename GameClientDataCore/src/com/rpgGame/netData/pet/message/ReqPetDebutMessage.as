package com.rpgGame.netData.pet.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求侍宠出战
	 */
	public class ReqPetDebutMessage extends Message {
	
		//侍宠模板Id
		private var _modelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//侍宠模板Id
			writeInt(_modelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//侍宠模板Id
			_modelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148204;
		}
		
		/**
		 * get 侍宠模板Id
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 侍宠模板Id
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
	}
}