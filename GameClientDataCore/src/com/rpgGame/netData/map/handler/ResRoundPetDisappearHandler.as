package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundPetDisappearMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundPetDisappearHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundPetDisappearMessage = ResRoundPetDisappearMessage(this.message);
			//TODO 添加消息处理
		}
	}
}