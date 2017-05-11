package com.rpgGame.netData.drop.handler{

	import com.rpgGame.netData.drop.message.ResDropRollItemInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResDropRollItemInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResDropRollItemInfoMessage = ResDropRollItemInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}