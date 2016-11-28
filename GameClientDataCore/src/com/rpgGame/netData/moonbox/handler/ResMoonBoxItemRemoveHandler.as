package com.rpgGame.netData.moonbox.handler{

	import com.rpgGame.netData.moonbox.message.ResMoonBoxItemRemoveMessage;
	import org.game.netCore.net.Handler;

	public class ResMoonBoxItemRemoveHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMoonBoxItemRemoveMessage = ResMoonBoxItemRemoveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}