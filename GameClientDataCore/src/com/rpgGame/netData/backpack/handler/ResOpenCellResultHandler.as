package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResOpenCellResultMessage;
	import org.game.netCore.net.Handler;

	public class ResOpenCellResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResOpenCellResultMessage = ResOpenCellResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}