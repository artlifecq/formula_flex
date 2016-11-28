package com.rpgGame.netData.pet.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 侍宠阶级变化
	 */
	public class ResPetRankChangeMessage extends Message {
	
		//角色Id
		private var _petId: long;
		
		//侍宠造型ID
		private var _modelId: int;
		
		//侍宠经验
		private var _rankExp: int;
		
		//侍宠阶级
		private var _rankLv: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_petId);
			//侍宠造型ID
			writeByte(_modelId);
			//侍宠经验
			writeShort(_rankExp);
			//侍宠阶级
			writeShort(_rankLv);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_petId = readLong();
			//侍宠造型ID
			_modelId = readByte();
			//侍宠经验
			_rankExp = readShort();
			//侍宠阶级
			_rankLv = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148107;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get petId(): long{
			return _petId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set petId(value: long): void{
			this._petId = value;
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
		
		/**
		 * get 侍宠经验
		 * @return 
		 */
		public function get rankExp(): int{
			return _rankExp;
		}
		
		/**
		 * set 侍宠经验
		 */
		public function set rankExp(value: int): void{
			this._rankExp = value;
		}
		
		/**
		 * get 侍宠阶级
		 * @return 
		 */
		public function get rankLv(): int{
			return _rankLv;
		}
		
		/**
		 * set 侍宠阶级
		 */
		public function set rankLv(value: int): void{
			this._rankLv = value;
		}
		
	}
}