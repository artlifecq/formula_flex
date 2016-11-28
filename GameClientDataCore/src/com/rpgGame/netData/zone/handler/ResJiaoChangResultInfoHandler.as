package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResJiaoChangResultInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResJiaoChangResultInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResJiaoChangResultInfoMessage = ResJiaoChangResultInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}