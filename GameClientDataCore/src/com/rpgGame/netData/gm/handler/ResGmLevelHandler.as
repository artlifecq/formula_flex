package com.rpgGame.netData.gm.handler{

	import com.rpgGame.netData.gm.message.ResGmLevelMessage;
	import org.game.netCore.net.Handler;

	public class ResGmLevelHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGmLevelMessage = ResGmLevelMessage(this.message);
			//TODO 添加消息处理
		}
	}
}