package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.ResGetTreasureBoxRewardMessage;
	import org.game.netCore.net.Handler;

	public class ResGetTreasureBoxRewardHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGetTreasureBoxRewardMessage = ResGetTreasureBoxRewardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}