package com.rpgGame.netData.client.handler{

	import com.rpgGame.netData.client.message.ResClientCustomTagMessage;
	import org.game.netCore.net.Handler;

	public class ResClientCustomTagHandler extends Handler {
	
		public override function action(): void{
			var msg: ResClientCustomTagMessage = ResClientCustomTagMessage(this.message);
			//TODO 添加消息处理
		}
	}
}