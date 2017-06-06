package com.rpgGame.netData.zhengba.handler{

	import com.rpgGame.netData.zhengba.message.SCUpdateZhengBaDataMessage;
	import org.game.netCore.net.Handler;

	public class SCUpdateZhengBaDataHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpdateZhengBaDataMessage = SCUpdateZhengBaDataMessage(this.message);
			//TODO 添加消息处理
		}
	}
}