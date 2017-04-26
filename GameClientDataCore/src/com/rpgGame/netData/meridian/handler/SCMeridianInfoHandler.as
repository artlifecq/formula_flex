package com.rpgGame.netData.meridian.handler{

	import com.rpgGame.netData.meridian.message.SCMeridianInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCMeridianInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMeridianInfoMessage = SCMeridianInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}