package com.rpgGame.netData.specialactivities.handler{

	import com.rpgGame.netData.specialactivities.message.SCSpecialActivityOpenMessage;
	import org.game.netCore.net.Handler;

	public class SCSpecialActivityOpenHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSpecialActivityOpenMessage = SCSpecialActivityOpenMessage(this.message);
			//TODO 添加消息处理
		}
	}
}