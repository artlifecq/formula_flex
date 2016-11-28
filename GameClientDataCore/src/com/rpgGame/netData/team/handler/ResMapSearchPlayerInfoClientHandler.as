package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResMapSearchPlayerInfoClientMessage;
	import org.game.netCore.net.Handler;

	public class ResMapSearchPlayerInfoClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMapSearchPlayerInfoClientMessage = ResMapSearchPlayerInfoClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}