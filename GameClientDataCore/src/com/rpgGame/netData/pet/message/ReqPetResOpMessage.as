package com.rpgGame.netData.pet.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 侍宠资源线操作
	 */
	public class ReqPetResOpMessage extends Message {
	
		//侍宠模板Id
		private var _modelId: int;
		
		//侍宠操作类型 0:激活  1:升级 2:升阶
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//侍宠模板Id
			writeInt(_modelId);
			//侍宠操作类型 0:激活  1:升级 2:升阶
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//侍宠模板Id
			_modelId = readInt();
			//侍宠操作类型 0:激活  1:升级 2:升阶
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148205;
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
		
		/**
		 * get 侍宠操作类型 0:激活  1:升级 2:升阶
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 侍宠操作类型 0:激活  1:升级 2:升阶
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}