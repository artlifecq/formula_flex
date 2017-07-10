package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCUpdateZoneSubNumMessage;
	import org.game.netCore.net.Handler;

	public class SCUpdateZoneSubNumHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpdateZoneSubNumMessage = SCUpdateZoneSubNumMessage(this.message);
			//TODO 添加消息处理
		}
	}
}