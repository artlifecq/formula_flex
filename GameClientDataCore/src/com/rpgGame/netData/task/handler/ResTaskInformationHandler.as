package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.ResTaskInformationMessage;
	import org.game.netCore.net.Handler;

	public class ResTaskInformationHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTaskInformationMessage = ResTaskInformationMessage(this.message);
			//TODO 添加消息处理
		}
	}
}