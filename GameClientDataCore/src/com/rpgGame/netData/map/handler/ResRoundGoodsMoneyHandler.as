package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundGoodsMoneyMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundGoodsMoneyHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundGoodsMoneyMessage = ResRoundGoodsMoneyMessage(this.message);
			//TODO 添加消息处理
		}
	}
}