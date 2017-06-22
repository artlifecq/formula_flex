package com.rpgGame.netData.dianfeng.handler{

	import com.rpgGame.netData.dianfeng.message.SCStartRaceMessage;
	import org.game.netCore.net.Handler;

	public class SCStartRaceHandler extends Handler {
	
		public override function action(): void{
			var msg: SCStartRaceMessage = SCStartRaceMessage(this.message);
			//TODO 添加消息处理
		}
	}
}