package com.rpgGame.netData.junjie.handler{

	import com.rpgGame.netData.junjie.message.SCJunJieInfoUpdateListMessage;
	import org.game.netCore.net.Handler;

	public class SCJunJieInfoUpdateListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCJunJieInfoUpdateListMessage = SCJunJieInfoUpdateListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}