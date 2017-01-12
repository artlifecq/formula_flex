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
	 * ������Ʒ��Ϣ
	 */
	public class DropGoodsInfo extends Bean {
	
		//��ƷId
		private var _dropGoodsId: long;
		
		//��Ʒģ��Id
		private var _itemModelId: int;
		
		//����
		private var _num: int;
		
		//������ID ����Ϊ0
		private var _ownerId: long;
		
		//����ʱ��(��)
		private var _dropTime: int;
		
		//ǿ���ȼ�
		private var _intensify: int;
		
		//��չ��������
		private var _attributs: int;
		
		//����X
		private var _x: int;
		
		//����Y
		private var _y: int;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//��ƷId
			writeLong(_dropGoodsId);
			//��Ʒģ��Id
			writeInt(_itemModelId);
			//����
			writeInt(_num);
			//������ID ����Ϊ0
			writeLong(_ownerId);
			//����ʱ��(��)
			writeInt(_dropTime);
			//ǿ���ȼ�
			writeByte(_intensify);
			//��չ��������
			writeByte(_attributs);
			//����X
			writeShort(_x);
			//����Y
			writeShort(_y);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//��ƷId
			_dropGoodsId = readLong();
			//��Ʒģ��Id
			_itemModelId = readInt();
			//����
			_num = readInt();
			//������ID ����Ϊ0
			_ownerId = readLong();
			//����ʱ��(��)
			_dropTime = readInt();
			//ǿ���ȼ�
			_intensify = readByte();
			//��չ��������
			_attributs = readByte();
			//����X
			_x = readShort();
			//����Y
			_y = readShort();
			return true;
		}
		
		/**
		 * get ��ƷId
		 * @return 
		 */
		public function get dropGoodsId(): long{
			return _dropGoodsId;
		}
		
		/**
		 * set ��ƷId
		 */
		public function set dropGoodsId(value: long): void{
			this._dropGoodsId = value;
		}
		
		/**
		 * get ��Ʒģ��Id
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set ��Ʒģ��Id
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get ����
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set ����
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get ������ID ����Ϊ0
		 * @return 
		 */
		public function get ownerId(): long{
			return _ownerId;
		}
		
		/**
		 * set ������ID ����Ϊ0
		 */
		public function set ownerId(value: long): void{
			this._ownerId = value;
		}
		
		/**
		 * get ����ʱ��(��)
		 * @return 
		 */
		public function get dropTime(): int{
			return _dropTime;
		}
		
		/**
		 * set ����ʱ��(��)
		 */
		public function set dropTime(value: int): void{
			this._dropTime = value;
		}
		
		/**
		 * get ǿ���ȼ�
		 * @return 
		 */
		public function get intensify(): int{
			return _intensify;
		}
		
		/**
		 * set ǿ���ȼ�
		 */
		public function set intensify(value: int): void{
			this._intensify = value;
		}
		
		/**
		 * get ��չ��������
		 * @return 
		 */
		public function get attributs(): int{
			return _attributs;
		}
		
		/**
		 * set ��չ��������
		 */
		public function set attributs(value: int): void{
			this._attributs = value;
		}
		
		/**
		 * get ����X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set ����X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get ����Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set ����Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
	}
}