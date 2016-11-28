package com.rpgGame.netData.pet.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 同步侍宠复活时间
	 */
	public class ResPetReliefTimeMessage extends Message {
	
		//复活时间
		private var _relief: int;
		
		//侍宠造型ID
		private var _modelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//复活时间
			writeInt(_relief);
			//侍宠造型ID
			writeByte(_modelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//复活时间
			_relief = readInt();
			//侍宠造型ID
			_modelId = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148108;
		}
		
		/**
		 * get 复活时间
		 * @return 
		 */
		public function get relief(): int{
			return _relief;
		}
		
		/**
		 * set 复活时间
		 */
		public function set relief(value: int): void{
			this._relief = value;
		}
		
		/**
		 * get 侍宠造型ID
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 侍宠造型ID
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
	}
}