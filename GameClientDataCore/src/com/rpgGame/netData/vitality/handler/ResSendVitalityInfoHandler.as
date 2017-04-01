package com.rpgGame.netData.vitality.handler{

	import com.rpgGame.netData.vitality.message.ResSendVitalityInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSendVitalityInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendVitalityInfoMessage = ResSendVitalityInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}