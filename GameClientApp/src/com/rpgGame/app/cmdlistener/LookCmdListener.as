package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.LookEvent;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.player.bean.OthersInfo;
	import com.rpgGame.netData.player.message.ResOthersPlayerInfoMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 *查看消息监听器 
	 * @author dik
	 * 
	 */
	public class LookCmdListener extends BaseBean
	{
		public function LookCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(103120, onResOthersPlayerInfoMessage);
			
			finish();
		}
		
		private function onResOthersPlayerInfoMessage(msg:ResOthersPlayerInfoMessage):void
		{
			var info:OthersInfo=msg.othersInfo;
			var _roleData:HeroData=new HeroData();
			_roleData.totalStat.setData(info.attributeList);
			_roleData.totalStat.setResDatas(info.resourceData);
			_roleData.sex=info.sex;
			_roleData.job=info.job;
			_roleData.body=info.body;
			_roleData.hair=info.hair;
			_roleData.cloths=info.cloths;
			_roleData.weapon=info.weapon;
			_roleData.deputyWeapon=info.second_weapon;
			_roleData.name=info.name;
			_roleData.societyName=info.guildName;
			_roleData.maxExp=info.maxExp.fValue;
			_roleData.maxZhenqi=info.maxZhenQi.fValue;
			_roleData.curExp=info.exp.fValue;
			var data:Object={roleData:_roleData,info:info};
			AvatarManager.updateHeroAvatarInfo(_roleData);
			AppManager.showApp(AppConstant.PLAYERINFO_PANEL,data);
//			EventManager.dispatchEvent(LookEvent.ROLE_INFO,msg.othersInfo);
		}
	}
}