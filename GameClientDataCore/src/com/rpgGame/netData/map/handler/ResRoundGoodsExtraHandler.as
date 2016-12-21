package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundGoodsExtraMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundGoodsExtraHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundGoodsExtraMessage = ResRoundGoodsExtraMessage(this.message);
			//TODO 添加消息处理
		}
	}
}