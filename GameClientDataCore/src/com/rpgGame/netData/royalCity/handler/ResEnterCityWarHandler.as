package com.rpgGame.netData.royalCity.handler{

	import com.rpgGame.netData.royalCity.message.ResEnterCityWarMessage;
	import org.game.netCore.net.Handler;

	public class ResEnterCityWarHandler extends Handler {
	
		public override function action(): void{
			var msg: ResEnterCityWarMessage = ResEnterCityWarMessage(this.message);
			//TODO 添加消息处理
		}
	}
}