package com.rpgGame.netData.taipingcaidian.handler{

	import com.rpgGame.netData.taipingcaidian.message.ResTaiPingRewardMessage;
	import org.game.netCore.net.Handler;

	public class ResTaiPingRewardHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTaiPingRewardMessage = ResTaiPingRewardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}