package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPlayerAttributeMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerAttributeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerAttributeMessage = ResPlayerAttributeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}