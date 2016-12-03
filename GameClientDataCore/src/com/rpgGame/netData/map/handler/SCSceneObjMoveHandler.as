package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.SCSceneObjMoveMessage;
	import org.game.netCore.net.Handler;

	public class SCSceneObjMoveHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSceneObjMoveMessage = SCSceneObjMoveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}