package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResPlayerStopMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerStopHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerStopMessage = ResPlayerStopMessage(this.message);
			//TODO 添加消息处理
		}
	}
}