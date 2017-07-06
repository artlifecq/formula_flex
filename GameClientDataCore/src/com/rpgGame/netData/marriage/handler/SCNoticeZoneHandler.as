package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCNoticeZoneMessage;
	import org.game.netCore.net.Handler;

	public class SCNoticeZoneHandler extends Handler {
	
		public override function action(): void{
			var msg: SCNoticeZoneMessage = SCNoticeZoneMessage(this.message);
			//TODO 添加消息处理
		}
	}
}