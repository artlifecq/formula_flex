package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResMonsterRunPositionsMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterRunPositionsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterRunPositionsMessage = ResMonsterRunPositionsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}