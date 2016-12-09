package com.rpgGame.netData.mail.message{
	import com.rpgGame.netData.mail.bean.MailBriefInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 收到新的邮件消息
	 */
	public class ResRecevieNewMailMessage extends Message {
	
		//邮件概要信息
		private var _mailInstance: MailBriefInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邮件概要信息
			writeBean(_mailInstance);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邮件概要信息
			_mailInstance = readBean(MailBriefInfo) as MailBriefInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 120103;
		}
		
		/**
		 * get 邮件概要信息
		 * @return 
		 */
		public function get mailInstance(): MailBriefInfo{
			return _mailInstance;
		}
		
		/**
		 * set 邮件概要信息
		 */
		public function set mailInstance(value: MailBriefInfo): void{
			this._mailInstance = value;
		}
		
	}
}