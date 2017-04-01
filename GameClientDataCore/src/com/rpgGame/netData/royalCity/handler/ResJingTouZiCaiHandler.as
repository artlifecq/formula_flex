package com.rpgGame.netData.royalCity.handler{

	import com.rpgGame.netData.royalCity.message.ResJingTouZiCaiMessage;
	import org.game.netCore.net.Handler;

	public class ResJingTouZiCaiHandler extends Handler {
	
		public override function action(): void{
			var msg: ResJingTouZiCaiMessage = ResJingTouZiCaiMessage(this.message);
			//TODO 添加消息处理
		}
	}
}