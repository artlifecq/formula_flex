package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundPetMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundPetHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundPetMessage = ResRoundPetMessage(this.message);
			//TODO 添加消息处理
		}
	}
}