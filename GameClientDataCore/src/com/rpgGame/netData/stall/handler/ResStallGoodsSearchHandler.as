package com.rpgGame.netData.stall.handler{

	import com.rpgGame.netData.stall.message.ResStallGoodsSearchMessage;
	import org.game.netCore.net.Handler;

	public class ResStallGoodsSearchHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStallGoodsSearchMessage = ResStallGoodsSearchMessage(this.message);
			//TODO 添加消息处理
		}
	}
}