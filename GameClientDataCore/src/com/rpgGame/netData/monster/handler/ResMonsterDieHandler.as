package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterDieMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterDieHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterDieMessage = ResMonsterDieMessage(this.message);
			//TODO 添加消息处理
		}
	}
}