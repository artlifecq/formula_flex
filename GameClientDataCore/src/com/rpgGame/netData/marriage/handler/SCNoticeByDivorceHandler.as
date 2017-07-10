package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCNoticeByDivorceMessage;
	import org.game.netCore.net.Handler;

	public class SCNoticeByDivorceHandler extends Handler {
	
		public override function action(): void{
			var msg: SCNoticeByDivorceMessage = SCNoticeByDivorceMessage(this.message);
			//TODO 添加消息处理
		}
	}
}