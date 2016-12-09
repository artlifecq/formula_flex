package com.rpgGame.netData.treasurehunt.handler{

	import com.rpgGame.netData.treasurehunt.message.ResHuntPanlInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResHuntPanlInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHuntPanlInfoMessage = ResHuntPanlInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}