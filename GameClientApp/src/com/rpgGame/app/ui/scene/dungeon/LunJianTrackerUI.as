package com.rpgGame.app.ui.scene.dungeon
{
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	
	import away3d.materials.compilation.SuperShaderCompiler;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.LunJian_Skin;
	
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
			super.onShow();
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
			if(!cfg){
				return;
			}
			var monsterCfg:Q_monster=MonsterDataManager.getData(cfg.q_npc);
			_skin.killName.text="击杀:"+monsterCfg.q_name;
			_skin.sec_info.text="注意倒计时结束时未击败对手或者挑战过程中死亡都视为挑战失败!";
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
			var name:Array=["简单","普通","困难"];
			_skin.ui_head.text=name[diff-1]+"·江湖论剑";
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(DungeonEvent.UPDATE_LUNJIAN_TIME,getLunJianTime);
			TimerServer.remove(updateTime);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_subbut1:
					DungeonSender.reqQuitDungeon(sceneId);
					break;
			}
		}
	}
}