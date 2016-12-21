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
	 * ���Ϳͻ����Զ�����
	 */
	public class ResClientCustomTagMessage extends Message {
	
		//�Զ������б�
		private var _CustomTaginfos: Vector.<CustomTaginfo> = new Vector.<CustomTaginfo>();
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//�Զ������б�
			writeShort(_CustomTaginfos.length);
			for (i = 0; i < _CustomTaginfos.length; i++) {
				writeBean(_CustomTaginfos[i]);
			}
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//�Զ������б�
			var CustomTaginfos_length : int = readShort();
			for (i = 0; i < CustomTaginfos_length; i++) {
				_CustomTaginfos[i] = readBean(CustomTaginfo) as CustomTaginfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301102;
		}
		
		/**
		 * get �Զ������б�
		 * @return 
		 */
		public function get CustomTaginfos(): Vector.<CustomTaginfo>{
			return _CustomTaginfos;
		}
		
		/**
		 * set �Զ������б�
		 */
		public function set CustomTaginfos(value: Vector.<CustomTaginfo>): void{
			this._CustomTaginfos = value;
		}
		
	}
}