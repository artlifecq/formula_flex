package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ������սPK״̬�ı�
	 */
	public class SCLimitChallengePKStateChangeMessage extends Message {
	
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103134;
		}
		
	}
}