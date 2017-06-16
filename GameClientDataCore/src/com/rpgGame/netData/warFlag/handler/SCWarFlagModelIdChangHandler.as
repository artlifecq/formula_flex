package com.rpgGame.netData.warFlag.handler{

	import com.rpgGame.netData.warFlag.message.SCWarFlagModelIdChangMessage;
	import org.game.netCore.net.Handler;

	public class SCWarFlagModelIdChangHandler extends Handler {
	
		public override function action(): void{
			var msg: SCWarFlagModelIdChangMessage = SCWarFlagModelIdChangMessage(this.message);
			//TODO 添加消息处理
		}
	}
}