package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCProposalResultMessage;
	import org.game.netCore.net.Handler;

	public class SCProposalResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCProposalResultMessage = SCProposalResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}