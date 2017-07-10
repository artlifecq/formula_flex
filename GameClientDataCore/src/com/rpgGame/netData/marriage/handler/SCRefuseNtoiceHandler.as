package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCRefuseNtoiceMessage;
	import org.game.netCore.net.Handler;

	public class SCRefuseNtoiceHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRefuseNtoiceMessage = SCRefuseNtoiceMessage(this.message);
			//TODO 添加消息处理
		}
	}
}