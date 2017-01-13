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
	 * ˫����Ϣ
	 */
	public class DoubleRepairInfo extends Bean {
	
		//���ID
		private var _sourceid: long;
		
		//���ID
		private var _targetid: long;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//���ID
			writeLong(_sourceid);
			//���ID
			writeLong(_targetid);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//���ID
			_sourceid = readLong();
			//���ID
			_targetid = readLong();
			return true;
		}
		
		/**
		 * get ���ID
		 * @return 
		 */
		public function get sourceid(): long{
			return _sourceid;
		}
		
		/**
		 * set ���ID
		 */
		public function set sourceid(value: long): void{
			this._sourceid = value;
		}
		
		/**
		 * get ���ID
		 * @return 
		 */
		public function get targetid(): long{
			return _targetid;
		}
		
		/**
		 * set ���ID
		 */
		public function set targetid(value: long): void{
			this._targetid = value;
		}
		
	}
}