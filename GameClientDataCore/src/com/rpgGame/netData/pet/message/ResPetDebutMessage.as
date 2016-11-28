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
	 * 侍宠登场消息
	 */
	public class ResPetDebutMessage extends Message {
	
		//角色Id
		private var _petId: long;
		
		//侍宠造型ID
		private var _modelId: int;
		
		//当前HP
		private var _currentHp: int;
		
		//目标id
		private var _targetId: long;
		
		//侍宠阶级
		private var _rank: int;
		
		//侍宠等级
		private var _level: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_petId);
			//侍宠造型ID
			writeByte(_modelId);
			//当前HP
			writeInt(_currentHp);
			//目标id
			writeLong(_targetId);
			//侍宠阶级
			writeInt(_rank);
			//侍宠等级
			writeInt(_level);
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
			//当前HP
			_currentHp = readInt();
			//目标id
			_targetId = readLong();
			//侍宠阶级
			_rank = readInt();
			//侍宠等级
			_level = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148104;
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
		 * get 当前HP
		 * @return 
		 */
		public function get currentHp(): int{
			return _currentHp;
		}
		
		/**
		 * set 当前HP
		 */
		public function set currentHp(value: int): void{
			this._currentHp = value;
		}
		
		/**
		 * get 目标id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 目标id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
		/**
		 * get 侍宠阶级
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 侍宠阶级
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 侍宠等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 侍宠等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
	}
}