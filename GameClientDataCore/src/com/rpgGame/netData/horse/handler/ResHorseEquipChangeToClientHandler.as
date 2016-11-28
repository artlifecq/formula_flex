package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.ResHorseEquipChangeToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResHorseEquipChangeToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHorseEquipChangeToClientMessage = ResHorseEquipChangeToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}