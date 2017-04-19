package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResShowEffectToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResShowEffectToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResShowEffectToClientMessage = ResShowEffectToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}