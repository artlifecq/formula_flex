package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResChangeDirectMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeDirectHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeDirectMessage = ResChangeDirectMessage(this.message);
			//TODO 添加消息处理
		}
	}
}