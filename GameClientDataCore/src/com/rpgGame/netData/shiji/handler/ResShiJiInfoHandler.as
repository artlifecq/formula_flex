package com.rpgGame.netData.shiji.handler{

	import com.rpgGame.netData.shiji.message.ResShiJiInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResShiJiInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResShiJiInfoMessage = ResShiJiInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}