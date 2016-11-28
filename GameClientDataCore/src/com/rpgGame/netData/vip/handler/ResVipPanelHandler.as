package com.rpgGame.netData.vip.handler{

	import com.rpgGame.netData.vip.message.ResVipPanelMessage;
	import org.game.netCore.net.Handler;

	public class ResVipPanelHandler extends Handler {
	
		public override function action(): void{
			var msg: ResVipPanelMessage = ResVipPanelMessage(this.message);
			//TODO 添加消息处理
		}
	}
}