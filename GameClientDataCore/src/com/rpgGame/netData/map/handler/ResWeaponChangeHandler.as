package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResWeaponChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResWeaponChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWeaponChangeMessage = ResWeaponChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}