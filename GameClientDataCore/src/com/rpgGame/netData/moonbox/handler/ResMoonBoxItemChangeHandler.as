package com.rpgGame.netData.moonbox.handler{

	import com.rpgGame.netData.moonbox.message.ResMoonBoxItemChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMoonBoxItemChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMoonBoxItemChangeMessage = ResMoonBoxItemChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}