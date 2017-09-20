package com.rpgGame.app.manager.fulidating
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.goods.SevendayManager;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.coreData.enum.EmMainBtnID;
	import com.rpgGame.netData.gameactivities.bean.GrownInfo;
	import com.rpgGame.netData.gameactivities.message.ResGotSuccessMessage;
	import com.rpgGame.netData.gameactivities.message.ResGrownInfoMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	public class DengJiLiBaoManager
	{
		private static var _instance:DengJiLiBaoManager;
		public static function get instance():DengJiLiBaoManager
		{
			if(_instance == null)
				_instance = new DengJiLiBaoManager();
			return _instance;
		}
		
		private var _dengjiInfos:Vector.<GrownInfo>=new Vector.<GrownInfo>();
		
		public function getGrownInfoByLv(lv:int):GrownInfo
		{
			if(_dengjiInfos==null||_dengjiInfos.length==0) return null;
			for(var i:int=0;i<_dengjiInfos.length;i++)
			{
				if(_dengjiInfos[i].level==lv) return _dengjiInfos[i];
			}
			return null;
		}
		
		/**等级礼包领取反馈数据*/
		public function onResGotSuccessMessage(msg:ResGotSuccessMessage):void
		{
			
		}
		
		/**等级礼包数据*/		
		public function onResGrownInfoMessage(msg:ResGrownInfoMessage):void
		{
			_dengjiInfos=msg.info;
			MainButtonManager.setActivityPointNumButton(EmMainBtnID.FULIDATING,chackCanGetNum());
			EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_DENGJI_UPDATE);
		}
		
		public function chackNot():Boolean
		{
			if(_dengjiInfos==null) return false;
			for(var i:int=0;i<_dengjiInfos.length;i++)
			{
				if(_dengjiInfos[i].state==1) return true;
			}
			return false;
		}
		
		public function chackCanGetNum():int
		{
			var num:int=0;
			if(chackNot()){
				num++;
			}
			if(Mgr.zaiXianMgr.chackNot()){
				num++;
			}
			if(Mgr.signMgr.chackNot()){
				num++;
			}
			return num;
		}
	}
}