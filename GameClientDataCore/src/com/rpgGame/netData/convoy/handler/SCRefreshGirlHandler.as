package com.rpgGame.netData.convoy.handler{

	import com.rpgGame.netData.convoy.message.SCRefreshGirlMessage;
	import org.game.netCore.net.Handler;

	public class SCRefreshGirlHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRefreshGirlMessage = SCRefreshGirlMessage(this.message);
			//TODO 添加消息处理
		}
	}
}