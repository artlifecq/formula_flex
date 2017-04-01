package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResWuShenDianAnimationMessage;
	import org.game.netCore.net.Handler;

	public class ResWuShenDianAnimationHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWuShenDianAnimationMessage = ResWuShenDianAnimationMessage(this.message);
			//TODO 添加消息处理
		}
	}
}