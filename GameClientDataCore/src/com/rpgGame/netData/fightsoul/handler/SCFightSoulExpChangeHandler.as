package com.rpgGame.netData.fightsoul.handler{

	import com.rpgGame.netData.fightsoul.message.SCFightSoulExpChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCFightSoulExpChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCFightSoulExpChangeMessage = SCFightSoulExpChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}