package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResWuShenDianRewardInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResWuShenDianRewardInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWuShenDianRewardInfoMessage = ResWuShenDianRewardInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}