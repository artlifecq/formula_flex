package com.rpgGame.netData.mibao.handler{

	import com.rpgGame.netData.mibao.message.SCJiFenChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCJiFenChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCJiFenChangeMessage = SCJiFenChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}