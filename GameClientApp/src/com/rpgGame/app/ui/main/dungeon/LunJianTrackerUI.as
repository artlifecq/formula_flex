package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	
	import feathers.controls.UIAsset;
	import feathers.themes.GuiTheme;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.LunJian_Skin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	
	import utils.TimerServer;

	/**
	 *论剑副本追踪
	 *@author dik
	 *2017-5-9下午4:14:50
	 */
	public class LunJianTrackerUI extends DungeonTrackerUI
	{
		private var _skin:LunJian_Skin;
		private var _remainTime:int;
		
		public function LunJianTrackerUI()
		{
			_skin=new LunJian_Skin();
			super(_skin);
		}
		
		override protected function onShow() : void
		{
			EventManager.addEvent(DungeonEvent.UPDATE_LUNJIAN_TIME,getLunJianTime);
			UIPopManager.showAlonePopUI(DungeonFightPop);
		}
		
		/**
		 * 
		 * @param ljid 论剑id
		 * @param remainTime  剩余时间
		 * 
		 */
		private function getLunJianTime(ljid:int,remainTime:int):void
		{
			var cfg:Q_lunjian=LunJianCfg.getCfgByID(ljid);
			var monsterCfg:Q_monster=MonsterDataManager.getData(cfg.q_npc);
			_skin.killName.text="击杀:"+monsterCfg.q_name;
			_skin.sec_info.text="副本提示!";
			if(remainTime<0){
				_skin.sec_time.text="未开始挑战!";
			}else{
				_remainTime=remainTime/1000;
				_skin.sec_time.text=TimeUtil.format3TimeType(_remainTime);
				TimerServer.addLoop(updateTime,1000);
			}
			setHead(cfg.q_difficult);
		}
		
		private function updateTime():void
		{
			_remainTime--;
			_skin.sec_time.text=TimeUtil.format3TimeType(_remainTime);
			if(_remainTime==0){
				TimerServer.remove(updateTime);
			}
		}
		
		private function setHead(diff:int):void
		{
			var name:Array=["jd","pt","kunlan"];
			_skin.ui_head.styleName="ui/mainui/fubenzhuizong/lunjian/"+name[diff-1]+".png";
		}
		
		override protected function onHide():void
		{
			EventManager.removeEvent(DungeonEvent.UPDATE_LUNJIAN_TIME,getLunJianTime);
			TimerServer.remove(updateTime);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_subbut1:
					DungeonSender.reqQuitDungeon();
					break;
			}
		}
	}
}