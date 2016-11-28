package com.rpgGame.netData.moonbox.handler{

	import com.rpgGame.netData.moonbox.message.ResMoonBoxItemAddMessageMessage;
	import org.game.netCore.net.Handler;

	public class ResMoonBoxItemAddMessageHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMoonBoxItemAddMessageMessage = ResMoonBoxItemAddMessageMessage(this.message);
			//TODO 添加消息处理
		}
	}
}