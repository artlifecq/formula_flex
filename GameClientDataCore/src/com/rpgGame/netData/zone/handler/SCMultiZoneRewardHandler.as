package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCMultiZoneRewardMessage;
	import org.game.netCore.net.Handler;

	public class SCMultiZoneRewardHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMultiZoneRewardMessage = SCMultiZoneRewardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}