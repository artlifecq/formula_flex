package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResApplyClientMessage;
	import org.game.netCore.net.Handler;

	public class ResApplyClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResApplyClientMessage = ResApplyClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}