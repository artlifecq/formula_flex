package com.rpgGame.netData.cross.handler{

	import com.rpgGame.netData.cross.message.SCCancelTeamMatchMessage;
	import org.game.netCore.net.Handler;

	public class SCCancelTeamMatchHandler extends Handler {
	
		public override function action(): void{
			var msg: SCCancelTeamMatchMessage = SCCancelTeamMatchMessage(this.message);
			//TODO 添加消息处理
		}
	}
}