package com.rpgGame.netData.fate.handler{

	import com.rpgGame.netData.fate.message.ResFateInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResFateInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFateInfoMessage = ResFateInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}