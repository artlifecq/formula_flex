package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundPlayerMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundPlayerHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundPlayerMessage = ResRoundPlayerMessage(this.message);
			//TODO 添加消息处理
		}
	}
}