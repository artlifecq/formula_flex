package com.rpgGame.netData.prompt.handler{

	import com.rpgGame.netData.prompt.message.G2CNotifyRedDotPromptMessage;
	import org.game.netCore.net.Handler;

	public class G2CNotifyRedDotPromptHandler extends Handler {
	
		public override function action(): void{
			var msg: G2CNotifyRedDotPromptMessage = G2CNotifyRedDotPromptMessage(this.message);
			//TODO 添加消息处理
		}
	}
}