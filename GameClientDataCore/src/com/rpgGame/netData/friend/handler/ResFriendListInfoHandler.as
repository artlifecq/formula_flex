package com.rpgGame.netData.friend.handler{

	import com.rpgGame.netData.friend.message.ResFriendListInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResFriendListInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFriendListInfoMessage = ResFriendListInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}