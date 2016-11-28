package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResSynMonsterPositionMessage;
	import org.game.netCore.net.Handler;

	public class ResSynMonsterPositionHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSynMonsterPositionMessage = ResSynMonsterPositionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}