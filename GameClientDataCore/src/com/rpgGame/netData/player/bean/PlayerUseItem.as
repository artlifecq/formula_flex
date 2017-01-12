package com.rpgGame.netData.player.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ���ʹ�õļ����������
	 */
	public class PlayerUseItem extends Bean {
	
		//����ID
		private var _itemModelId: int;
		
		//��������
		private var _itemNum: int;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//����ID
			writeInt(_itemModelId);
			//��������
			writeInt(_itemNum);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//����ID
			_itemModelId = readInt();
			//��������
			_itemNum = readInt();
			return true;
		}
		
		/**
		 * get ����ID
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set ����ID
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get ��������
		 * @return 
		 */
		public function get itemNum(): int{
			return _itemNum;
		}
		
		/**
		 * set ��������
		 */
		public function set itemNum(value: int): void{
			this._itemNum = value;
		}
		
	}
}