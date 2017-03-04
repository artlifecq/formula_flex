package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResParcelInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResParcelInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResParcelInfoMessage = ResParcelInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}