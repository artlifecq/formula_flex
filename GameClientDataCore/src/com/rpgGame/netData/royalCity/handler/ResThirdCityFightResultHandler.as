package com.rpgGame.netData.royalCity.handler{

	import com.rpgGame.netData.royalCity.message.ResThirdCityFightResultMessage;
	import org.game.netCore.net.Handler;

	public class ResThirdCityFightResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResThirdCityFightResultMessage = ResThirdCityFightResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}