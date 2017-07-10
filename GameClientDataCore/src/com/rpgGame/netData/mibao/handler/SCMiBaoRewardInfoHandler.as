package com.rpgGame.netData.mibao.handler{

	import com.rpgGame.netData.mibao.message.SCMiBaoRewardInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCMiBaoRewardInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMiBaoRewardInfoMessage = SCMiBaoRewardInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}