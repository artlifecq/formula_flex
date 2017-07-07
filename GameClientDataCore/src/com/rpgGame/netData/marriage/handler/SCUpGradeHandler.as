package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCUpGradeMessage;
	import org.game.netCore.net.Handler;

	public class SCUpGradeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpGradeMessage = SCUpGradeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}