package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundGoodsMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundGoodsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundGoodsMessage = ResRoundGoodsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}