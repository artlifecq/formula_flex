package com.rpgGame.app.cmdlistener.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.cmdlistener.enum.EmEvenTrackType;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.coreData.cfg.biao.BiaoCfgData;
	import com.rpgGame.coreData.role.BiaoCheData;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 日常任务追踪栏事件监听 
	 * @author 陈鹉光
	 * 
	 */	
	public class DailyTasksCmdListener extends BaseBean
	{
		private var _gameTimer:GameTimer;
		/** 镖车倒计时 **/
		private var _last:Number;
		
		override public function start():void
		{
			EventManager.addEvent(YunBiaoEvent.ACCEPT_BIAO, startTimer);
			EventManager.addEvent(YunBiaoEvent.ADD_BIAO, startTimer);
			EventManager.addEvent(YunBiaoEvent.CHECK_ON_LOGIN_BIAO, onUpdateOnline);
			super.finish();
		}
		
		/**
		 *  上线检测运镖倒计时长状态
		 * 
		 */	
		private function onUpdateOnline():void
		{
			var biaoData:BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
			if (biaoData == null)
				return;
			
			_last = (biaoData.expirationTime - SystemTimeManager.curtTm) / 1000;	
			onTimer();
		}
		
		/**
		 * 接了运镖之后，显示运镖倒计时长
		 * @param type
		 *
		 */
		private function startTimer( type:int=0 ):void
		{
			if( type == EmEvenTrackType.YUN_BIAO )//接受镖车任务才需要自己做倒计时长，重新上线就用服务器发过来的时间计算倒计时长
				_last = BiaoCfgData.miscData.biao_expire_duration / 1000;
			
			onTimer();
		}
		
		private function onTimer():void
		{
			if(_gameTimer == null)
			{
				_gameTimer = new GameTimer( "biao_expire_duration" );
				_gameTimer.onUpdate = onUpdateTime;
			}
			_gameTimer.start();
		}
		
		/**
		 * 更新时间 
		 * 
		 */		
		private function onUpdateTime():void
		{
			_last--;
			if( _last < 0 )
				stopTimer();
			else
				onStartTimer(_last);
		}
		
		/**
		 * 停止计时 
		 * 
		 */		
		private function stopTimer():void
		{
			if(_gameTimer)
			{
				_gameTimer.stop();
			}
		}
		
		/**
		 * 计时 
		 * 
		 */		
		private function onStartTimer(time:Number):void
		{
			YunBiaoManager.biaoExpireDuration = time;
		}
	}
}