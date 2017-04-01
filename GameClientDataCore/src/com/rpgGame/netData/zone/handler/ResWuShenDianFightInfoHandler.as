package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResWuShenDianFightInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResWuShenDianFightInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWuShenDianFightInfoMessage = ResWuShenDianFightInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}