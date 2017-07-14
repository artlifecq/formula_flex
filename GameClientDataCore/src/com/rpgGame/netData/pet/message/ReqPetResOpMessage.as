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
		
		//侍宠操作类型 0:激活  1:升阶
		private var _type: int;
		
		//是否自动使用元宝购买（0否1是）
		private var _useGold: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//侍宠模板Id
			writeInt(_modelId);
			//侍宠操作类型 0:激活  1:升阶
			writeInt(_type);
			//是否自动使用元宝购买（0否1是）
			writeByte(_useGold);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//侍宠模板Id
			_modelId = readInt();
			//侍宠操作类型 0:激活  1:升阶
			_type = readInt();
			//是否自动使用元宝购买（0否1是）
			_useGold = readByte();
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
		 * get 侍宠操作类型 0:激活  1:升阶
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 侍宠操作类型 0:激活  1:升阶
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 是否自动使用元宝购买（0否1是）
		 * @return 
		 */
		public function get useGold(): int{
			return _useGold;
		}
		
		/**
		 * set 是否自动使用元宝购买（0否1是）
		 */
		public function set useGold(value: int): void{
			this._useGold = value;
		}
		
	}
}