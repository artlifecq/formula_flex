package com.rpgGame.netData.mibao.handler{

	import com.rpgGame.netData.mibao.message.SCMosterNumChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCMosterNumChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMosterNumChangeMessage = SCMosterNumChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}