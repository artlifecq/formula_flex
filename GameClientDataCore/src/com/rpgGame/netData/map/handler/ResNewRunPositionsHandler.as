package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResNewRunPositionsMessage;
	import org.game.netCore.net.Handler;

	public class ResNewRunPositionsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResNewRunPositionsMessage = ResNewRunPositionsMessage(this.message);
			//TODO �����Ϣ����
		}
	}
}