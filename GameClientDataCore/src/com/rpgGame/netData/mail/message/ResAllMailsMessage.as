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
	 * 展示所有邮件概要消息(发送邮件列表)
	 */
	public class ResAllMailsMessage extends Message {
	
		//概要邮件列表
		private var _mailBriefInfos: Vector.<MailBriefInfo> = new Vector.<MailBriefInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//概要邮件列表
			writeShort(_mailBriefInfos.length);
			for (i = 0; i < _mailBriefInfos.length; i++) {
				writeBean(_mailBriefInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//概要邮件列表
			var mailBriefInfos_length : int = readShort();
			for (i = 0; i < mailBriefInfos_length; i++) {
				_mailBriefInfos[i] = readBean(MailBriefInfo) as MailBriefInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 120101;
		}
		
		/**
		 * get 概要邮件列表
		 * @return 
		 */
		public function get mailBriefInfos(): Vector.<MailBriefInfo>{
			return _mailBriefInfos;
		}
		
		/**
		 * set 概要邮件列表
		 */
		public function set mailBriefInfos(value: Vector.<MailBriefInfo>): void{
			this._mailBriefInfos = value;
		}
		
	}
}