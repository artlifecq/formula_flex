package com.rpgGame.netData.pet.message{
	import com.rpgGame.netData.pet.bean.PetInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 所有美人信息列表
	 */
	public class ResPetListMessage extends Message {
	
		//当前出战美人ID
		private var _petId: int;
		
		//侍宠属性
		private var _pets: Vector.<PetInfo> = new Vector.<PetInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前出战美人ID
			writeShort(_petId);
			//侍宠属性
			writeShort(_pets.length);
			for (i = 0; i < _pets.length; i++) {
				writeBean(_pets[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前出战美人ID
			_petId = readShort();
			//侍宠属性
			var pets_length : int = readShort();
			for (i = 0; i < pets_length; i++) {
				_pets[i] = readBean(PetInfo) as PetInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148105;
		}
		
		/**
		 * get 当前出战美人ID
		 * @return 
		 */
		public function get petId(): int{
			return _petId;
		}
		
		/**
		 * set 当前出战美人ID
		 */
		public function set petId(value: int): void{
			this._petId = value;
		}
		
		/**
		 * get 侍宠属性
		 * @return 
		 */
		public function get pets(): Vector.<PetInfo>{
			return _pets;
		}
		
		/**
		 * set 侍宠属性
		 */
		public function set pets(value: Vector.<PetInfo>): void{
			this._pets = value;
		}
		
	}
}