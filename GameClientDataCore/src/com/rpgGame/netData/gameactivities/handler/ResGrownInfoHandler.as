package com.rpgGame.netData.gameactivities.handler{

	import com.rpgGame.netData.gameactivities.message.ResGrownInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGrownInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGrownInfoMessage = ResGrownInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}