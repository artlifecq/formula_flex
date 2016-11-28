package com.rpgGame.netData.offlineres.handler{

	import com.rpgGame.netData.offlineres.message.ResGetResSuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResGetResSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGetResSuccessMessage = ResGetResSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}