package com.rpgGame.netData.prestige.handler{

	import com.rpgGame.netData.prestige.message.ResPrestigeInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResPrestigeInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPrestigeInfoMessage = ResPrestigeInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}