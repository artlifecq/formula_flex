package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPlayerAttributesChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerAttributesChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerAttributesChangeMessage = ResPlayerAttributesChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}