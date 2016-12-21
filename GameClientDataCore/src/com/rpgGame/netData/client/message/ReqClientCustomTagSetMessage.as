package com.rpgGame.netData.client.message{
	import com.rpgGame.netData.client.bean.CustomTaginfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * �������ÿͻ����Զ�����
	 */
	public class ReqClientCustomTagSetMessage extends Message {
	
		//�ͻ����趨����
		private var _customTaginfo: CustomTaginfo;
		
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//�ͻ����趨����
			writeBean(_customTaginfo);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//�ͻ����趨����
			_customTaginfo = readBean(CustomTaginfo) as CustomTaginfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301201;
		}
		
		/**
		 * get �ͻ����趨����
		 * @return 
		 */
		public function get customTaginfo(): CustomTaginfo{
			return _customTaginfo;
		}
		
		/**
		 * set �ͻ����趨����
		 */
		public function set customTaginfo(value: CustomTaginfo): void{
			this._customTaginfo = value;
		}
		
	}
}