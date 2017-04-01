package com.rpgGame.netData.grown.handler{

	import com.rpgGame.netData.grown.message.ResGotSuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResGotSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGotSuccessMessage = ResGotSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}