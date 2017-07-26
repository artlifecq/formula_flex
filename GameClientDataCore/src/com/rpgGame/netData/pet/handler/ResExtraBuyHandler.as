package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResExtraBuyMessage;
	import org.game.netCore.net.Handler;

	public class ResExtraBuyHandler extends Handler {
	
		public override function action(): void{
			var msg: ResExtraBuyMessage = ResExtraBuyMessage(this.message);
			//TODO 添加消息处理
		}
	}
}