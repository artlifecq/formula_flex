package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterMaxHpChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterMaxHpChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterMaxHpChangeMessage = ResMonsterMaxHpChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}