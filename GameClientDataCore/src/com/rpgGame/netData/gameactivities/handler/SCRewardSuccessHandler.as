package com.rpgGame.netData.gameactivities.handler{

	import com.rpgGame.netData.gameactivities.message.SCRewardSuccessMessage;
	import org.game.netCore.net.Handler;

	public class SCRewardSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRewardSuccessMessage = SCRewardSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}