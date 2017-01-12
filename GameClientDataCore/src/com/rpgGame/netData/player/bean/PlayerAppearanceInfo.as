package com.rpgGame.netData.player.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ������չʾ��Ϣ
	 */
	public class PlayerAppearanceInfo extends Bean {
	
		//��������ID_�·�����ID_�Ա� ע:������15λ���·�����15λ���Ա�2λ 0Ů 1��
		private var _weapon_clothes_sex: int;
		
		//����ID
		private var _horseModelid: int;
		
		//����ID
		private var _wingModelId: int;
		
		//���ID
		private var _weaponRideModelid: int;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//��������ID_�·�����ID_�Ա� ע:������15λ���·�����15λ���Ա�2λ 0Ů 1��
			writeInt(_weapon_clothes_sex);
			//����ID
			writeInt(_horseModelid);
			//����ID
			writeInt(_wingModelId);
			//���ID
			writeInt(_weaponRideModelid);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//��������ID_�·�����ID_�Ա� ע:������15λ���·�����15λ���Ա�2λ 0Ů 1��
			_weapon_clothes_sex = readInt();
			//����ID
			_horseModelid = readInt();
			//����ID
			_wingModelId = readInt();
			//���ID
			_weaponRideModelid = readInt();
			return true;
		}
		
		/**
		 * get ��������ID_�·�����ID_�Ա� ע:������15λ���·�����15λ���Ա�2λ 0Ů 1��
		 * @return 
		 */
		public function get weapon_clothes_sex(): int{
			return _weapon_clothes_sex;
		}
		
		/**
		 * set ��������ID_�·�����ID_�Ա� ע:������15λ���·�����15λ���Ա�2λ 0Ů 1��
		 */
		public function set weapon_clothes_sex(value: int): void{
			this._weapon_clothes_sex = value;
		}
		
		/**
		 * get ����ID
		 * @return 
		 */
		public function get horseModelid(): int{
			return _horseModelid;
		}
		
		/**
		 * set ����ID
		 */
		public function set horseModelid(value: int): void{
			this._horseModelid = value;
		}
		
		/**
		 * get ����ID
		 * @return 
		 */
		public function get wingModelId(): int{
			return _wingModelId;
		}
		
		/**
		 * set ����ID
		 */
		public function set wingModelId(value: int): void{
			this._wingModelId = value;
		}
		
		/**
		 * get ���ID
		 * @return 
		 */
		public function get weaponRideModelid(): int{
			return _weaponRideModelid;
		}
		
		/**
		 * set ���ID
		 */
		public function set weaponRideModelid(value: int): void{
			this._weaponRideModelid = value;
		}
		
	}
}