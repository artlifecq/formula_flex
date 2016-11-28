package com.rpgGame.netData.equip.handler{

	import com.rpgGame.netData.equip.message.UnwearEquipItemMessage;
	import org.game.netCore.net.Handler;

	public class UnwearEquipItemHandler extends Handler {
	
		public override function action(): void{
			var msg: UnwearEquipItemMessage = UnwearEquipItemMessage(this.message);
			//TODO 添加消息处理
		}
	}
}