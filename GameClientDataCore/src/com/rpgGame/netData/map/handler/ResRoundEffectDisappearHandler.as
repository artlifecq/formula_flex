package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundEffectDisappearMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundEffectDisappearHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundEffectDisappearMessage = ResRoundEffectDisappearMessage(this.message);
			//TODO 添加消息处理
		}
	}
}