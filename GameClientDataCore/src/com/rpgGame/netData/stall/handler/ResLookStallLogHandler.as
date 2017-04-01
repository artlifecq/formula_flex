package com.rpgGame.netData.stall.handler{

	import com.rpgGame.netData.stall.message.ResLookStallLogMessage;
	import org.game.netCore.net.Handler;

	public class ResLookStallLogHandler extends Handler {
	
		public override function action(): void{
			var msg: ResLookStallLogMessage = ResLookStallLogMessage(this.message);
			//TODO 添加消息处理
		}
	}
}