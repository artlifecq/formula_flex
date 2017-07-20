package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.ResUpdateTopLeaderMessage;
	import org.game.netCore.net.Handler;

	public class ResUpdateTopLeaderHandler extends Handler {
	
		public override function action(): void{
			var msg: ResUpdateTopLeaderMessage = ResUpdateTopLeaderMessage(this.message);
			//TODO 添加消息处理
		}
	}
}