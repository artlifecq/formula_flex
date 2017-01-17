package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.buff.bean.BuffInfo;
	import com.rpgGame.netData.structs.Position;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * NPC信息
	 */
	public class NpcInfo extends Bean {
	
		//NPCID
		private var _npcId: long;
		
		//NPC模型ID
		private var _npcModelId: int;
		
		//NPC名字
		private var _npcName: String;
		
		//NPC资源造型
		private var _npcRes: String;
		
		//NPC头像造型
		private var _npcIcon: String;
		
		//方向
		private var _dir: int;
		
		//Npc所在位置
		private var _position: com.rpgGame.netData.structs.Position;
		
		//NPC状态
		private var _state: int;
		
		//buff列表
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//NPCID
			writeLong(_npcId);
			//NPC模型ID
			writeInt(_npcModelId);
			//NPC名字
			writeString(_npcName);
			//NPC资源造型
			writeString(_npcRes);
			//NPC头像造型
			writeString(_npcIcon);
			//方向
			writeShort(_dir);
			//Npc所在位置
			writeBean(_position);
			//NPC状态
			writeByte(_state);
			//buff列表
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//NPCID
			_npcId = readLong();
			//NPC模型ID
			_npcModelId = readInt();
			//NPC名字
			_npcName = readString();
			//NPC资源造型
			_npcRes = readString();
			//NPC头像造型
			_npcIcon = readString();
			//方向
			_dir = readShort();
			//Npc所在位置
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//NPC状态
			_state = readByte();
			//buff列表
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			return true;
		}
		
		/**
		 * get NPCID
		 * @return 
		 */
		public function get npcId(): long{
			return _npcId;
		}
		
		/**
		 * set NPCID
		 */
		public function set npcId(value: long): void{
			this._npcId = value;
		}
		
		/**
		 * get NPC模型ID
		 * @return 
		 */
		public function get npcModelId(): int{
			return _npcModelId;
		}
		
		/**
		 * set NPC模型ID
		 */
		public function set npcModelId(value: int): void{
			this._npcModelId = value;
		}
		
		/**
		 * get NPC名字
		 * @return 
		 */
		public function get npcName(): String{
			return _npcName;
		}
		
		/**
		 * set NPC名字
		 */
		public function set npcName(value: String): void{
			this._npcName = value;
		}
		
		/**
		 * get NPC资源造型
		 * @return 
		 */
		public function get npcRes(): String{
			return _npcRes;
		}
		
		/**
		 * set NPC资源造型
		 */
		public function set npcRes(value: String): void{
			this._npcRes = value;
		}
		
		/**
		 * get NPC头像造型
		 * @return 
		 */
		public function get npcIcon(): String{
			return _npcIcon;
		}
		
		/**
		 * set NPC头像造型
		 */
		public function set npcIcon(value: String): void{
			this._npcIcon = value;
		}
		
		/**
		 * get 方向
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set 方向
		 */
		public function set dir(value: int): void{
			this._dir = value;
		}
		
		/**
		 * get Npc所在位置
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set Npc所在位置
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
		/**
		 * get NPC状态
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set NPC状态
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
		/**
		 * get buff列表
		 * @return 
		 */
		public function get buffs(): Vector.<com.rpgGame.netData.buff.bean.BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff列表
		 */
		public function set buffs(value: Vector.<com.rpgGame.netData.buff.bean.BuffInfo>): void{
			this._buffs = value;
		}
		
	}
}