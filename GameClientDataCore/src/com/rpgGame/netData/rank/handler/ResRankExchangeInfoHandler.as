package com.rpgGame.netData.rank.handler{

	import com.rpgGame.netData.rank.message.ResRankExchangeInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResRankExchangeInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRankExchangeInfoMessage = ResRankExchangeInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}