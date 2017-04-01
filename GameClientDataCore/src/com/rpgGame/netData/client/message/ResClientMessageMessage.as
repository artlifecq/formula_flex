package com.rpgGame.netData.client.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ����������Ϣ
	 */
	public class ResClientMessageMessage extends Message {
	
		//��Ϣid
		private var _msgid: int;
		
		//��Ϣ����
		private var _context: String;
		
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//��Ϣid
			writeInt(_msgid);
			//��Ϣ����
			writeString(_context);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//��Ϣid
			_msgid = readInt();
			//��Ϣ����
			_context = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301101;
		}
		
		/**
		 * get ��Ϣid
		 * @return 
		 */
		public function get msgid(): int{
			return _msgid;
		}
		
		/**
		 * set ��Ϣid
		 */
		public function set msgid(value: int): void{
			this._msgid = value;
		}
		
		/**
		 * get ��Ϣ����
		 * @return 
		 */
		public function get context(): String{
			return _context;
		}
		
		/**
		 * set ��Ϣ����
		 */
		public function set context(value: String): void{
			this._context = value;
		}
		
	}
}