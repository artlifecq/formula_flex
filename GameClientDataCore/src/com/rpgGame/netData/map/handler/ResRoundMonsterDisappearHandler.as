package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundMonsterDisappearMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundMonsterDisappearHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundMonsterDisappearMessage = ResRoundMonsterDisappearMessage(this.message);
			//TODO 添加消息处理
		}
	}
}