package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundGoodsDisappearMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundGoodsDisappearHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundGoodsDisappearMessage = ResRoundGoodsDisappearMessage(this.message);
			//TODO 添加消息处理
		}
	}
}