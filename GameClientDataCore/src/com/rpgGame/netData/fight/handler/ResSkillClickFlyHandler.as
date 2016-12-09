package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResSkillClickFlyMessage;
	import org.game.netCore.net.Handler;

	public class ResSkillClickFlyHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSkillClickFlyMessage = ResSkillClickFlyMessage(this.message);
			//TODO 添加消息处理
		}
	}
}