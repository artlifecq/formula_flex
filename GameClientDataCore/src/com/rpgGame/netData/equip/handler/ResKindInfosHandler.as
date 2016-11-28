package com.rpgGame.netData.equip.handler{

	import com.rpgGame.netData.equip.message.ResKindInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResKindInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResKindInfosMessage = ResKindInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}