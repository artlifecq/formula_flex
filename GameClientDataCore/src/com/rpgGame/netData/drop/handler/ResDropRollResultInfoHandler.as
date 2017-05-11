package com.rpgGame.netData.drop.handler{

	import com.rpgGame.netData.drop.message.ResDropRollResultInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResDropRollResultInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResDropRollResultInfoMessage = ResDropRollResultInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}