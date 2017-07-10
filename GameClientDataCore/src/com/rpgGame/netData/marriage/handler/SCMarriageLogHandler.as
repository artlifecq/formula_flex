package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCMarriageLogMessage;
	import org.game.netCore.net.Handler;

	public class SCMarriageLogHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMarriageLogMessage = SCMarriageLogMessage(this.message);
			//TODO 添加消息处理
		}
	}
}