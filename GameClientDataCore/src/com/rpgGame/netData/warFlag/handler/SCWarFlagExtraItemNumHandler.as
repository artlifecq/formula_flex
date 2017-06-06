package com.rpgGame.netData.warFlag.handler{

	import com.rpgGame.netData.warFlag.message.SCWarFlagExtraItemNumMessage;
	import org.game.netCore.net.Handler;

	public class SCWarFlagExtraItemNumHandler extends Handler {
	
		public override function action(): void{
			var msg: SCWarFlagExtraItemNumMessage = SCWarFlagExtraItemNumMessage(this.message);
			//TODO 添加消息处理
		}
	}
}