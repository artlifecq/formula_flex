package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.SCAreaJumpMessage;
	import org.game.netCore.net.Handler;

	public class SCAreaJumpHandler extends Handler {
	
		public override function action(): void{
			var msg: SCAreaJumpMessage = SCAreaJumpMessage(this.message);
			//TODO 添加消息处理
		}
	}
}