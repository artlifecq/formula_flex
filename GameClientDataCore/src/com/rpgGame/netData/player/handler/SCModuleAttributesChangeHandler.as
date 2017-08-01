package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCModuleAttributesChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCModuleAttributesChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCModuleAttributesChangeMessage = SCModuleAttributesChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}