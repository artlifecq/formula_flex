package com.rpgGame.app.ui.main.activityBar
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.task.TouZhuManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.TouZhuEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.lang.LangTask;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.Sprite;
	import starling.text.TextField;

	public class ActivityTouZhuInfo extends Sprite
	{
		private var touZhuTimeText:TextField;
		private var gameTime:GameTimer;
		
		public function ActivityTouZhuInfo()
		{
			touZhuTimeText = new TextField( 150, 22, "" );
			touZhuTimeText.bold = true;
			touZhuTimeText.fontSize = 14;
			touZhuTimeText.color = StaticValue.COLOR_CODE_4;
			addChild( touZhuTimeText );
			
			EventManager.addEvent( TouZhuEvent.START_TOU_ZHU, onStart );
			EventManager.addEvent( TouZhuEvent.END_TOU_ZHU, onEnd );
			
			if( TouZhuManager.hasTouZhuTask() )
				onStart();
		}
		
		private function onEnd():void
		{
			touZhuTimeText.text = "";
			
			if( gameTime == null )
				return;
			
			gameTime.stop();
		}
		
		private function onStart():void
		{
			if( gameTime == null )
			{
				gameTime = new GameTimer("ACTIVITY_TOU_ZHU_INFO");
				gameTime.onUpdate = onUpdateTime;
			}
			
			gameTime.start();
		}		
		
		private function onUpdateTime():void
		{
			if( TouZhuManager.touZhuTask == null )
			{
				touZhuTimeText.text = "";
				return;
			}
			
			var last:int = ( TouZhuManager.touZhuTask.failTime - SystemTimeManager.curtTm ) / 1000;
			
			if( last < 0 )
			{
				onEnd();
				return;
			}
			
//			"[偷猪] " + TimeUtil.intTime2String( last )
			touZhuTimeText.text = LanguageConfig.getText( LangTask.TOU_ZHU_TIME, TimeUtil.intTime2String( last ) );
		}
		
	}
}