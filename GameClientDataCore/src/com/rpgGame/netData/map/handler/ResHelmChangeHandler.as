package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResHelmChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResHelmChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHelmChangeMessage = ResHelmChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}