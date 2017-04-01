package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.ResTreasureBoxInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResTreasureBoxInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTreasureBoxInfoMessage = ResTreasureBoxInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}