package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundPlayerChangeNameMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundPlayerChangeNameHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundPlayerChangeNameMessage = ResRoundPlayerChangeNameMessage(this.message);
			//TODO 添加消息处理
		}
	}
}