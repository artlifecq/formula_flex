package com.rpgGame.netData.equip.handler{

	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	import org.game.netCore.net.Handler;

	public class ResEquipOperateResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResEquipOperateResultMessage = ResEquipOperateResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}