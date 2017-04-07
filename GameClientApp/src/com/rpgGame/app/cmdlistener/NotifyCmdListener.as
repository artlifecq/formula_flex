package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_notify;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	import com.rpgGame.netData.player.message.SCNoticeMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 * 通知消息管理
	 * @author yt
	 * 
	 */	
	public class NotifyCmdListener  extends BaseBean
	{
		public function NotifyCmdListener()
		{
			super();
		}
		override public function start():void
		{
			
			SocketConnection.addCmdListener(103215, onNoticeMessage );
			finish();
		}
		private function onNoticeMessage(msg:SCNoticeMessage):void
		{
			var notiMsg:Q_notify=NotifyCfgData.getNotifyByID(msg.noticeIndex,msg.values);
			if(notiMsg!=null)
			{
				var showType:Array=notiMsg.q_show_type.split("|");
				
				if(showType!=null&&showType.length>0)
				{
					var i:int,length:int=showType.length;
					
					for(i=0;i<length;i++)
					{
						var tp:int=int(showType[i])
						if(tp>0)
						{
							NoticeManager.textNotify(tp, notiMsg.q_content);
						}
						
					}
				}
				
				
			}
			
			///NoticeManager.showNotify("SCENE_ENTER_NOTIFY_TEXT", ["提示信息"]);
			//EventManager.dispatchEvent(ChatEvent.SEND_SUCCESS,msg);
		}
	}
}