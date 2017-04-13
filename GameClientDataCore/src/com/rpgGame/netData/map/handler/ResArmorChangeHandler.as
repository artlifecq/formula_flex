package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResArmorChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResArmorChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResArmorChangeMessage = ResArmorChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}