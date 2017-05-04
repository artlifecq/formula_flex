package com.rpgGame.netData.zhangong.handler{

	import com.rpgGame.netData.zhangong.message.SCMeritoriousInfoListMessage;
	
	import org.game.netCore.net.Handler;

	public class SCMeritoriousInfoListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMeritoriousInfoListMessage = SCMeritoriousInfoListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}