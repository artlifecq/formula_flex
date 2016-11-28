package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResJuegMingTaInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResJuegMingTaInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResJuegMingTaInfoMessage = ResJuegMingTaInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}