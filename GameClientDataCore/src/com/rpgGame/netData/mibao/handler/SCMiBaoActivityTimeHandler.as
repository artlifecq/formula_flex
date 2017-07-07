package com.rpgGame.netData.mibao.handler{

	import com.rpgGame.netData.mibao.message.SCMiBaoActivityTimeMessage;
	import org.game.netCore.net.Handler;

	public class SCMiBaoActivityTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMiBaoActivityTimeMessage = SCMiBaoActivityTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}