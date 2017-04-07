package com.rpgGame.netData.fightsoul.handler{

	import com.rpgGame.netData.fightsoul.message.SCFightSoulChangeCountMessage;
	import org.game.netCore.net.Handler;

	public class SCFightSoulChangeCountHandler extends Handler {
	
		public override function action(): void{
			var msg: SCFightSoulChangeCountMessage = SCFightSoulChangeCountMessage(this.message);
			//TODO 添加消息处理
		}
	}
}