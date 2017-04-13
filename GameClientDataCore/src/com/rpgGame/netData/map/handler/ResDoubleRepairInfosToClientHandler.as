package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResDoubleRepairInfosToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResDoubleRepairInfosToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResDoubleRepairInfosToClientMessage = ResDoubleRepairInfosToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}