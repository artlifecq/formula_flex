package com.rpgGame.netData.warmark.handler{

	import com.rpgGame.netData.warmark.message.ResUpdateWarmarkMessage;
	import org.game.netCore.net.Handler;

	public class ResUpdateWarmarkHandler extends Handler {
	
		public override function action(): void{
			var msg: ResUpdateWarmarkMessage = ResUpdateWarmarkMessage(this.message);
			//TODO 添加消息处理
		}
	}
}