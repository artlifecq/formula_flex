package com.rpgGame.netData.friend.handler{

	import com.rpgGame.netData.friend.message.ResPlayerFriendSettingMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerFriendSettingHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerFriendSettingMessage = ResPlayerFriendSettingMessage(this.message);
			//TODO 添加消息处理
		}
	}
}