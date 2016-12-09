package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterHpChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterHpChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterHpChangeMessage = ResMonsterHpChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}