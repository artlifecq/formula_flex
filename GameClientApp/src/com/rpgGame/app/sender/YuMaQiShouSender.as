package com.rpgGame.app.sender
{
	import app.cmd.YuMaQiShouModuleMessages;
	
	import org.game.netCore.connection.SocketConnection;

	/**
	 * 发送消息 
	 * @author 陈鹉光
	 * 
	 */	
	public class YuMaQiShouSender extends BaseSender
	{
		
		/**
		 * 用于寻路到弼马温位置时请求
		 */
		public static function requestGetBiMaWenPos():void
		{
			_bytes.clear();
			SocketConnection.send(YuMaQiShouModuleMessages.C2S_GET_BI_MA_WEN_POS, _bytes);
		}
	}
}