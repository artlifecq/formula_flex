package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundEffectMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundEffectHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundEffectMessage = ResRoundEffectMessage(this.message);
			//TODO 添加消息处理
		}
	}
}