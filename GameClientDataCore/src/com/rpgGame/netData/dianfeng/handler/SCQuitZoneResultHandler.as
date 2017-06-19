package com.rpgGame.netData.dianfeng.handler{

	import com.rpgGame.netData.dianfeng.message.SCQuitZoneResultMessage;
	import org.game.netCore.net.Handler;

	public class SCQuitZoneResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCQuitZoneResultMessage = SCQuitZoneResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}