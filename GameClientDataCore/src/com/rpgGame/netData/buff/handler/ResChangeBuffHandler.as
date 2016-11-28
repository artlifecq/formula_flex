package com.rpgGame.netData.buff.handler{

	import com.rpgGame.netData.buff.message.ResChangeBuffMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeBuffHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeBuffMessage = ResChangeBuffMessage(this.message);
			//TODO 添加消息处理
		}
	}
}