package com.rpgGame.netData.map.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ��������
	 */
	public class GridCoordinate extends Bean {
	
		//����X
		private var _x: int;
		
		//����Y
		private var _y: int;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
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
			//����X
			_x = readShort();
			//����Y
			_y = readShort();
			return true;
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