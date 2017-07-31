package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCRoundChangeMarriageMessage;
	import org.game.netCore.net.Handler;

	public class SCRoundChangeMarriageHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRoundChangeMarriageMessage = SCRoundChangeMarriageMessage(this.message);
			//TODO 添加消息处理
		}
	}
}