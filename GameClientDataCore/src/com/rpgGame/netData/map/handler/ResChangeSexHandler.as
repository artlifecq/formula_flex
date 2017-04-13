package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResChangeSexMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeSexHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeSexMessage = ResChangeSexMessage(this.message);
			//TODO 添加消息处理
		}
	}
}