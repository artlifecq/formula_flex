package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResSuMingDuiJueInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSuMingDuiJueInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSuMingDuiJueInfoMessage = ResSuMingDuiJueInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}