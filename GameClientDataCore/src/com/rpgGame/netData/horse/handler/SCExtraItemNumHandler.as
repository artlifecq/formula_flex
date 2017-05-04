package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.SCExtraItemNumMessage;
	import org.game.netCore.net.Handler;

	public class SCExtraItemNumHandler extends Handler {
	
		public override function action(): void{
			var msg: SCExtraItemNumMessage = SCExtraItemNumMessage(this.message);
			//TODO 添加消息处理
		}
	}
}