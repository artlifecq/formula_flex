package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundNpcDisappearMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundNpcDisappearHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundNpcDisappearMessage = ResRoundNpcDisappearMessage(this.message);
			//TODO 添加消息处理
		}
	}
}