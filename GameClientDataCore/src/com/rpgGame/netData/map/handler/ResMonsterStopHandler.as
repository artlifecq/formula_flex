package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResMonsterStopMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterStopHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterStopMessage = ResMonsterStopMessage(this.message);
			//TODO 添加消息处理
		}
	}
}