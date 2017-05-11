package com.rpgGame.coreData.info.mail
{
	import com.rpgGame.netData.mail.bean.MailBriefInfo;
	
	import org.game.netCore.data.long;
	
	public class NewMailInfo
	{
		/**邮件ID*/
		public var mailId:long
		/**邮件简要信息*/
		public var mailBrefInfo:MailBriefInfo;
		/**是否被选取*/
		public var isSelect:Boolean;
		public function NewMailInfo(id:long,info:MailBriefInfo)
		{
			mailId=id;
			mailBrefInfo=info;
		}
		
		public function updateInfo(info:MailBriefInfo):void
		{
			mailBrefInfo=info;
		}
		
		public function updateSelectStata(bool:Boolean):void
		{
			isSelect=bool;
		}
	}
}