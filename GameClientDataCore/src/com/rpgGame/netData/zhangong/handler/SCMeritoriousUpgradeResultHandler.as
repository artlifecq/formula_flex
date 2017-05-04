package com.rpgGame.netData.zhangong.handler{

	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import org.game.netCore.net.Handler;

	public class SCMeritoriousUpgradeResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMeritoriousUpgradeResultMessage = SCMeritoriousUpgradeResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}