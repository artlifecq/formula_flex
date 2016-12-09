package com.rpgGame.netData.warmark.handler{

	import com.rpgGame.netData.warmark.message.ResWarMarkListMessage;
	import org.game.netCore.net.Handler;

	public class ResWarMarkListHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWarMarkListMessage = ResWarMarkListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}