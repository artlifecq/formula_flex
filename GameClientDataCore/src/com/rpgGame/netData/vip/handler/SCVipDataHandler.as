package com.rpgGame.netData.vip.handler{

	import com.rpgGame.netData.vip.message.SCVipDataMessage;
	import org.game.netCore.net.Handler;

	public class SCVipDataHandler extends Handler {
	
		public override function action(): void{
			var msg: SCVipDataMessage = SCVipDataMessage(this.message);
			//TODO 添加消息处理
		}
	}
}