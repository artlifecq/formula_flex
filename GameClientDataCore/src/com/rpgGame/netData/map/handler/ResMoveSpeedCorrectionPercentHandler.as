package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResMoveSpeedCorrectionPercentMessage;
	import org.game.netCore.net.Handler;

	public class ResMoveSpeedCorrectionPercentHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMoveSpeedCorrectionPercentMessage = ResMoveSpeedCorrectionPercentMessage(this.message);
			//TODO 添加消息处理
		}
	}
}