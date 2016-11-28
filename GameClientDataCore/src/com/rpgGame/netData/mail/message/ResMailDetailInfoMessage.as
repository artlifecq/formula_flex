package com.rpgGame.netData.mail.message{
	import com.rpgGame.netData.mail.bean.MailDetailInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 展示邮件的详细信息(请求单个邮件的详细信息)
	 */
	public class ResMailDetailInfoMessage extends Message {
	
		//邮件详细信息
		private var _mailDetailInfo: MailDetailInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邮件详细信息
			writeBean(_mailDetailInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邮件详细信息
			_mailDetailInfo = readBean(MailDetailInfo) as MailDetailInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 120102;
		}
		
		/**
		 * get 邮件详细信息
		 * @return 
		 */
		public function get mailDetailInfo(): MailDetailInfo{
			return _mailDetailInfo;
		}
		
		/**
		 * set 邮件详细信息
		 */
		public function set mailDetailInfo(value: MailDetailInfo): void{
			this._mailDetailInfo = value;
		}
		
	}
}