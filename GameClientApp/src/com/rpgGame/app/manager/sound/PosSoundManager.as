package com.rpgGame.app.manager.sound
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.game.mainCore.libCore.sound.SoundData;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.info.sound.SoundInfo;
	
	import flash.geom.Point;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 坐标音效管理器
	 * @author zgd
	 * 创建时间：2015-5-8 上午11:28:15
	 * 
	 */
	public class PosSoundManager
	{
		/**坐标音效存储器*/
		private static var _posSoundInfoHM:HashMap;
		private static var _gameTimer:GameTimer;
		
		public static function setup():void
		{
			_posSoundInfoHM = new HashMap();
		}
		
		public static function playPosSound($url:String,$x:int,$y:int):SoundData
		{
			if(_posSoundInfoHM.length == 0)
			{
				if(!_gameTimer)
				{
					_gameTimer = new GameTimer("PosSoundManager",500,0,onPosSoundTick);
				}
				_gameTimer.reset();
				_gameTimer.start();
			}
			var soundData:SoundData = TSoundManager.playSystemSound($url,1);
			var soundInfo:SoundInfo = new SoundInfo(0);
			soundInfo.x = $x;
			soundInfo.y = $y;
			_posSoundInfoHM.add(soundData, soundInfo);
			return soundData;
		}
		
		public static function stopPosSound($soundData:SoundData):void
		{
			TSoundManager.stopSystemSound($soundData);
			_posSoundInfoHM.remove($soundData);
			if(_posSoundInfoHM.length == 0)
			{
				if(_gameTimer && _gameTimer.running)
				{
					_gameTimer.stop();
				}
			}
		}
		
		private static function onPosSoundTick(...args):void
		{
			_posSoundInfoHM.eachKey(updateSingleSound);
		}
		
		private static function updateSingleSound($soundData:SoundData):void
		{
			var soundData:SoundData = $soundData;
			var soundInfo:SoundInfo = _posSoundInfoHM.getValue($soundData);
			var dis:int = Point.distance(new Point(soundInfo.x,soundInfo.y),new Point(MainRoleManager.actor.x,MainRoleManager.actor.z));
			var minDis:int = TSoundManager.DEFAULT_SOUND_DIS;
			var maxDis:int = minDis + TSoundManager.NPC_SOUND_DIS;
			var needPlaySound:Boolean = true;
			var minVolume:Number = 0.2;
			var maxVolume:Number = TSoundManager.NORMAL_VOLUME;
			var soundVolume:Number = minVolume;
			if(dis <= maxDis)
			{
				var value:Number = Math.floor(Math.min(1 - (dis - minDis)/(maxDis - minDis),1)*10)/10;
				soundVolume = value*(maxVolume - minVolume) + minVolume;
			}
			soundVolume = Math.max(soundVolume,minVolume);
			soundData.setVolume(soundVolume);
		}
	}
}
