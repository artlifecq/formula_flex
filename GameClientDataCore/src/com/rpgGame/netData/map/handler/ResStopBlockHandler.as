package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResStopBlockMessage;
	import org.game.netCore.net.Handler;

	public class ResStopBlockHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStopBlockMessage = ResStopBlockMessage(this.message);
			//TODO 添加消息处理
		}
	}
}