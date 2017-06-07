package com.rpgGame.netData.specialactivities.handler{

	import com.rpgGame.netData.specialactivities.message.SCSpecialActivityCloseMessage;
	import org.game.netCore.net.Handler;

	public class SCSpecialActivityCloseHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSpecialActivityCloseMessage = SCSpecialActivityCloseMessage(this.message);
			//TODO 添加消息处理
		}
	}
}