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
	 * NPC��Ϣ
	 */
	public class NpcInfo extends Bean {
	
		//NPCID
		private var _npcId: long;
		
		//NPCģ��ID
		private var _npcModelId: int;
		
		//NPC����
		private var _npcName: String;
		
		//NPC��Դ����
		private var _npcRes: String;
		
		//NPCͷ������
		private var _npcIcon: String;
		
		//����
		private var _dir: int;
		
		//Npc����λ��
		private var _position: com.rpgGame.netData.structs.Position;
		
		//NPC״̬
		private var _state: int;
		
		//buff�б�
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//NPCID
			writeLong(_npcId);
			//NPCģ��ID
			writeInt(_npcModelId);
			//NPC����
			writeString(_npcName);
			//NPC��Դ����
			writeString(_npcRes);
			//NPCͷ������
			writeString(_npcIcon);
			//����
			writeShort(_dir);
			//Npc����λ��
			writeBean(_position);
			//NPC״̬
			writeByte(_state);
			//buff�б�
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//NPCID
			_npcId = readLong();
			//NPCģ��ID
			_npcModelId = readInt();
			//NPC����
			_npcName = readString();
			//NPC��Դ����
			_npcRes = readString();
			//NPCͷ������
			_npcIcon = readString();
			//����
			_dir = readShort();
			//Npc����λ��
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//NPC״̬
			_state = readByte();
			//buff�б�
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
		 * get NPCģ��ID
		 * @return 
		 */
		public function get npcModelId(): int{
			return _npcModelId;
		}
		
		/**
		 * set NPCģ��ID
		 */
		public function set npcModelId(value: int): void{
			this._npcModelId = value;
		}
		
		/**
		 * get NPC����
		 * @return 
		 */
		public function get npcName(): String{
			return _npcName;
		}
		
		/**
		 * set NPC����
		 */
		public function set npcName(value: String): void{
			this._npcName = value;
		}
		
		/**
		 * get NPC��Դ����
		 * @return 
		 */
		public function get npcRes(): String{
			return _npcRes;
		}
		
		/**
		 * set NPC��Դ����
		 */
		public function set npcRes(value: String): void{
			this._npcRes = value;
		}
		
		/**
		 * get NPCͷ������
		 * @return 
		 */
		public function get npcIcon(): String{
			return _npcIcon;
		}
		
		/**
		 * set NPCͷ������
		 */
		public function set npcIcon(value: String): void{
			this._npcIcon = value;
		}
		
		/**
		 * get ����
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set ����
		 */
		public function set dir(value: int): void{
			this._dir = value;
		}
		
		/**
		 * get Npc����λ��
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set Npc����λ��
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
		/**
		 * get NPC״̬
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set NPC״̬
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
		/**
		 * get buff�б�
		 * @return 
		 */
		public function get buffs(): Vector.<com.rpgGame.netData.buff.bean.BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff�б�
		 */
		public function set buffs(value: Vector.<com.rpgGame.netData.buff.bean.BuffInfo>): void{
			this._buffs = value;
		}
		
	}
}