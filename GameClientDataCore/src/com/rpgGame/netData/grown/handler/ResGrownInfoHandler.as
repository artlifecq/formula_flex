package com.rpgGame.netData.grown.handler{

	import com.rpgGame.netData.grown.message.ResGrownInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGrownInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGrownInfoMessage = ResGrownInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}