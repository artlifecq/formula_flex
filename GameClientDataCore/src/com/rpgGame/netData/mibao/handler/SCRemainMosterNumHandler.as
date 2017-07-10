package com.rpgGame.netData.mibao.handler{

	import com.rpgGame.netData.mibao.message.SCRemainMosterNumMessage;
	import org.game.netCore.net.Handler;

	public class SCRemainMosterNumHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRemainMosterNumMessage = SCRemainMosterNumMessage(this.message);
			//TODO 添加消息处理
		}
	}
}