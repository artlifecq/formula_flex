package com.rpgGame.netData.friend.handler{

	import com.rpgGame.netData.friend.message.ResOperationFriendMsgMessage;
	import org.game.netCore.net.Handler;

	public class ResOperationFriendMsgHandler extends Handler {
	
		public override function action(): void{
			var msg: ResOperationFriendMsgMessage = ResOperationFriendMsgMessage(this.message);
			//TODO 添加消息处理
		}
	}
}