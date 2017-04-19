package com.rpgGame.netData.meridian.handler{

	import com.rpgGame.netData.meridian.message.SCMeridianListMessage;
	import org.game.netCore.net.Handler;

	public class SCMeridianListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMeridianListMessage = SCMeridianListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}