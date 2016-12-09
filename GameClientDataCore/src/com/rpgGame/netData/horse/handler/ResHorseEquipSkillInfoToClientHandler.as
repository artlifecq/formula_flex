package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.ResHorseEquipSkillInfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResHorseEquipSkillInfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHorseEquipSkillInfoToClientMessage = ResHorseEquipSkillInfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}