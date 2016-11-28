package com.rpgGame.netData.equip.handler{

	import com.rpgGame.netData.equip.message.ResBuTianShenShiKindInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResBuTianShenShiKindInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBuTianShenShiKindInfoMessage = ResBuTianShenShiKindInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}