package com.rpgGame.netData.treasurehunt.handler{

	import com.rpgGame.netData.treasurehunt.message.ResHuntItemChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResHuntItemChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHuntItemChangeMessage = ResHuntItemChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}