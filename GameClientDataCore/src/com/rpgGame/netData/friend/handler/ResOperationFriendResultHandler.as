package com.rpgGame.netData.friend.handler{

	import com.rpgGame.netData.friend.message.ResOperationFriendResultMessage;
	import org.game.netCore.net.Handler;

	public class ResOperationFriendResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResOperationFriendResultMessage = ResOperationFriendResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}