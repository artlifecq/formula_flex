package com.rpgGame.netData.fate.handler{

	import com.rpgGame.netData.fate.message.ResFatePanleInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResFatePanleInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFatePanleInfoMessage = ResFatePanleInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}