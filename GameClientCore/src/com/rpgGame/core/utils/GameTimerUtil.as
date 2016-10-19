
package com.rpgGame.core.utils
{
	import com.game.mainCore.core.timer.GameTimer;

	public class GameTimerUtil
	{
		public function GameTimerUtil()
		{
		}
		
		
		public static function startTimer( gameTime:GameTimer ):void
		{
			if( gameTime == null )
				return;
			if( gameTime.running )
				return;
			
			gameTime.start();
		}
		
		public static function disposeTimer( gameTime:GameTimer ):void
		{
			if( gameTime == null )
				return;
			
			gameTime.stop();
			gameTime.destroy();
		}
	}
}