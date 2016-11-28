package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.ResTreasureBoxRewardListMessage;
	import org.game.netCore.net.Handler;

	public class ResTreasureBoxRewardListHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTreasureBoxRewardListMessage = ResTreasureBoxRewardListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}