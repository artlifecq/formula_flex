package com.rpgGame.netData.map.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * bossAI��Ϣ
	 */
	public class BossAIInfo extends Bean {
	
		//�׶Σ�0��ʾû�п�ʼ 1,2,3...�ͺ��Լ����
		private var _step: int;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//�׶Σ�0��ʾû�п�ʼ 1,2,3...�ͺ��Լ����
			writeByte(_step);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//�׶Σ�0��ʾû�п�ʼ 1,2,3...�ͺ��Լ����
			_step = readByte();
			return true;
		}
		
		/**
		 * get �׶Σ�0��ʾû�п�ʼ 1,2,3...�ͺ��Լ����
		 * @return 
		 */
		public function get step(): int{
			return _step;
		}
		
		/**
		 * set �׶Σ�0��ʾû�п�ʼ 1,2,3...�ͺ��Լ����
		 */
		public function set step(value: int): void{
			this._step = value;
		}
		
	}
}