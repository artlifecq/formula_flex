package com.rpgGame.netData.junjie.handler{

	import com.rpgGame.netData.junjie.message.SCJunJieInfoListMessage;
	import org.game.netCore.net.Handler;

	public class SCJunJieInfoListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCJunJieInfoListMessage = SCJunJieInfoListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}