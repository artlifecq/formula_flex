package com.rpgGame.netData.stall.handler{

	import com.rpgGame.netData.stall.message.ResStallGoodsMessage;
	import org.game.netCore.net.Handler;

	public class ResStallGoodsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStallGoodsMessage = ResStallGoodsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}