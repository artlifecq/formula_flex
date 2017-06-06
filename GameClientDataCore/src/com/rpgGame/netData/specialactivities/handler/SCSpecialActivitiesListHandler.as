package com.rpgGame.netData.specialactivities.handler{

	import com.rpgGame.netData.specialactivities.message.SCSpecialActivitiesListMessage;
	import org.game.netCore.net.Handler;

	public class SCSpecialActivitiesListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSpecialActivitiesListMessage = SCSpecialActivitiesListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}