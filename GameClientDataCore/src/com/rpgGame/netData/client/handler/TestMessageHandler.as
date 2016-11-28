package com.rpgGame.netData.client.handler{

	import com.rpgGame.netData.client.message.TestMessageMessage;
	import org.game.netCore.net.Handler;

	public class TestMessageHandler extends Handler {
	
		public override function action(): void{
			var msg: TestMessageMessage = TestMessageMessage(this.message);
			//TODO 添加消息处理
		}
	}
}