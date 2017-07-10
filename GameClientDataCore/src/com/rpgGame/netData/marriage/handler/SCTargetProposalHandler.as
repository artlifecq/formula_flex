package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCTargetProposalMessage;
	import org.game.netCore.net.Handler;

	public class SCTargetProposalHandler extends Handler {
	
		public override function action(): void{
			var msg: SCTargetProposalMessage = SCTargetProposalMessage(this.message);
			//TODO 添加消息处理
		}
	}
}