package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterReviveMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterReviveHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterReviveMessage = ResMonsterReviveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}