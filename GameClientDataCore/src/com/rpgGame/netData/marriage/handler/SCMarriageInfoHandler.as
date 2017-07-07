package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCMarriageInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCMarriageInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMarriageInfoMessage = SCMarriageInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}