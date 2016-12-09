package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.ResRankRewardMessage;
	import org.game.netCore.net.Handler;

	public class ResRankRewardHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRankRewardMessage = ResRankRewardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}