package com.rpgGame.netData.map.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * �Զ�����Чչʾ��ͨ�ã�
	 */
	public class ShowEffectInfo extends Bean {
	
		//���ͣ�1����Ч����2����Ч����3����Ч����4��Ѫ
		private var _type: int;
		
		//����ID�������ID
		private var _id: long;
		
		//��ЧID����ǰ�˶�
		private var _effectid: int;
		
		//����X������
		private var _x: int;
		
		//����Y������
		private var _y: int;
		
		//��ֵ����
		private var _param: int;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//���ͣ�1����Ч����2����Ч����3����Ч����4��Ѫ
			writeByte(_type);
			//����ID�������ID
			writeLong(_id);
			//��ЧID����ǰ�˶�
			writeInt(_effectid);
			//����X������
			writeShort(_x);
			//����Y������
			writeShort(_y);
			//��ֵ����
			writeInt(_param);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//���ͣ�1����Ч����2����Ч����3����Ч����4��Ѫ
			_type = readByte();
			//����ID�������ID
			_id = readLong();
			//��ЧID����ǰ�˶�
			_effectid = readInt();
			//����X������
			_x = readShort();
			//����Y������
			_y = readShort();
			//��ֵ����
			_param = readInt();
			return true;
		}
		
		/**
		 * get ���ͣ�1����Ч����2����Ч����3����Ч����4��Ѫ
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set ���ͣ�1����Ч����2����Ч����3����Ч����4��Ѫ
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get ����ID�������ID
		 * @return 
		 */
		public function get id(): long{
			return _id;
		}
		
		/**
		 * set ����ID�������ID
		 */
		public function set id(value: long): void{
			this._id = value;
		}
		
		/**
		 * get ��ЧID����ǰ�˶�
		 * @return 
		 */
		public function get effectid(): int{
			return _effectid;
		}
		
		/**
		 * set ��ЧID����ǰ�˶�
		 */
		public function set effectid(value: int): void{
			this._effectid = value;
		}
		
		/**
		 * get ����X������
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set ����X������
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get ����Y������
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set ����Y������
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get ��ֵ����
		 * @return 
		 */
		public function get param(): int{
			return _param;
		}
		
		/**
		 * set ��ֵ����
		 */
		public function set param(value: int): void{
			this._param = value;
		}
		
	}
}