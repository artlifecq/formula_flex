package com.rpgGame.app.manager.sound
{
	import com.game.mainCore.core.manager.SoundManager;
	import com.game.mainCore.libCore.sound.SoundData;
	import com.game.mainCore.libCore.sound.SoundThread;
	import com.rpgGame.coreData.info.sound.SoundInfo;
	
	import gs.TweenLite;
	

	/**
	 * 声音管理器
	 * @author carver
	 * 
	 */	
	public class TSoundManager
	{
		public static const NORMAL_VOLUME:Number = 0.5;
		/**声音衰减的环半径，单位：像素*/
		public static const MAX_SOUND_DIS:Number = 600;
		public static const DEFAULT_SOUND_DIS:Number = 100;
		public static const NPC_SOUND_DIS:Number = 800;
		/**音量淡入淡出的时间，单位：秒*/
		private static const TWEEN_VOLUME_TIME:int = 2;
		/**特效最大声道数（给背景音乐、心跳、行走留出3个,保险起见，再空余1个,FLASH最大支持32个）*/
		private static const MAX_SHORT_NUM:int = 32-3-1;
		
		/**背景音乐线程*/
		private static var _bgSoundThread:SoundThread = SoundManager.creatNewSoundThread();
		/**系统音效线程*/
		private static var _systemSoundThread:SoundThread = SoundManager.creatNewSoundThread();
		
		/**背景音乐线程数据*/
		private static var _bgSoundInfo:SoundInfo = new SoundInfo(NORMAL_VOLUME);
		/**环境音效线程数据*/
		private static var _evmSoundInfo:SoundInfo = new SoundInfo(NORMAL_VOLUME);
		/**系统音效线程数据*/
		private static var _shortSoundInfo:SoundInfo = new SoundInfo(NORMAL_VOLUME);
		
		/**背景音乐数据*/
		private static var _bgSoundData:SoundData;
		/**环境音乐数据*/
		private static var _environmentSoundData:SoundData;
		/**持续施法动作音效数据*/
		private static var _castingSoundData:SoundData;
		/**主角行走音乐数据*/
		private static var _walkSoundData:SoundData;
		/**说话音乐数据*/
		private static var _wordSoundData:SoundData;
		
		/**说话声音的优先级，越大越优先*/
		private static var _wordSoundPriority:int;
		
		/**背景音乐是否关闭*/
		private static var _isBgSoundClose:Boolean = false;
		/**环境音效是否关闭*/
		private static var _isEvmSoundClose:Boolean = false;
		/**系统音效是否关闭*/
		private static var _isSystemSoundClose:Boolean = false;
		
		public static function setup():void
		{
			_systemSoundThread.setVolume(_shortSoundInfo.volume);
		}
		
		/**停掉所有音乐
		 */
		public static function stopAllSound():void
		{
			stopBgSound();
		}
		
		//静音***************************************************************************************
		/**设置背景音乐静音
		* @param $value
		*/
		public static function setBgSoundMute($value:Boolean):void
		{
			if(_isBgSoundClose != $value)
			{
				_isBgSoundClose = $value;
				var targetVolume:Number;
				var completeCall:Function;
				if($value)
				{
					targetVolume = 0;
					completeCall = onCompleteSetBgSoundMute;
				}
				else
				{
					targetVolume = NORMAL_VOLUME;
					if(_bgSoundData && _bgSoundData.getPause())
					{
						_bgSoundData.setPause(false);
					}
				}
				TweenLite.killTweensOf(_bgSoundInfo);
				TweenLite.to(_bgSoundInfo,TWEEN_VOLUME_TIME,{volume:targetVolume,onUpdate:onUpdateSetBgSoundVolume,onComplete:completeCall});
			}
		}
		
		private static function onCompleteSetBgSoundMute():void
		{
			if(_bgSoundData)
			{
				_bgSoundData.setPause(true);
			}
		}
		
		private static function onUpdateSetBgSoundVolume():void
		{
			if(_bgSoundData)
			{
				_bgSoundData.setVolume(_bgSoundInfo.volume);
			}
		}
		
		/**设置特效音乐静音
		 * @param $value
		 */
		public static function setShortSoundMute($value:Boolean):void
		{
			if(_isSystemSoundClose != $value)
			{
				_isSystemSoundClose = $value;
				var targetVolume:Number;
				var completeCall:Function;
				if($value)
				{
					targetVolume = 0;
					completeCall = onCompleteSetShortSoundMute;
				}
				else
				{
					targetVolume = NORMAL_VOLUME;
				}
				TweenLite.killTweensOf(_shortSoundInfo);
				TweenLite.to(_shortSoundInfo,TWEEN_VOLUME_TIME,{volume:targetVolume,onUpdate:onUpdateSetShortSoundVolume,onComplete:completeCall});
			}
		}
		
		private static function onCompleteSetShortSoundMute():void
		{
			
		}
		
		private static function onUpdateSetShortSoundVolume():void
		{
			_systemSoundThread.setVolume(_shortSoundInfo.volume);
		}
		
		/**
		 * 设置环境音效静音
		 * @param $value
		 * 
		 */
		public static function setEnvironmentMute($value:Boolean):void
		{
			if(_isEvmSoundClose != $value)
			{
				_isEvmSoundClose = $value;
				var targetVolume:Number;
				var completeCall:Function;
				if($value)
				{
					targetVolume = 0;
					completeCall = onCompleteSetEvmSoundMute;
				}
				else
				{
					targetVolume = NORMAL_VOLUME;
					if(_environmentSoundData && _environmentSoundData.getPause())
					{
						_environmentSoundData.setPause(false);
					}
				}
				TweenLite.killTweensOf(_evmSoundInfo);
				TweenLite.to(_evmSoundInfo,TWEEN_VOLUME_TIME,{volume:targetVolume,onUpdate:onUpdateSetEvmSoundVolume,onComplete:completeCall});
			}
		}
		
		private static function onCompleteSetEvmSoundMute():void
		{
			if(_environmentSoundData)
			{
				_environmentSoundData.setPause(true);
			}
		}
		
		private static function onUpdateSetEvmSoundVolume():void
		{
			if(_environmentSoundData)
			{
				_environmentSoundData.setVolume(_evmSoundInfo.volume);
			}
		}
		
		//播放与停止背景音乐***************************************************************************************
		/**播放背景音乐*/
		public static function playBgSound($url:String):void
		{
			//先移除旧的
			stopBgSound();
			_bgSoundData = _bgSoundThread.playSound($url,0,1);
			if(_bgSoundData)
			{
				_bgSoundData.setVolume(_bgSoundInfo.volume);
				if(_isBgSoundClose)
				{
					_bgSoundData.setPause(true);
				}
				_bgSoundData.setOneLoopCmpFun(onPlayBgSoundOneLoopCmp,$url);
			}
		}
		/**停止背景音乐*/
		private static function stopBgSound():void
		{
			if(_bgSoundData!=null)
			{
				_bgSoundThread.removeSound(_bgSoundData);
				_bgSoundData = null;
			}
		}
		
		public static function onPlayBgSoundOneLoopCmp($sd:SoundData,$url:String):void
		{
			TweenLite.delayedCall(30,playBgSound,[$url]);
		}
		
		//播放与停止环境音乐***************************************************************************************
		public static function playEnvironmentSound($url:String):void
		{
			//先移除旧的
			stopEnvironmentSound();
			_environmentSoundData = playLoopEvmSound($url);
		}
		
		public static function stopEnvironmentSound():void
		{
			if(_environmentSoundData!=null)
			{
				_bgSoundThread.removeSound(_environmentSoundData);
				_environmentSoundData = null;
			}
		}
		
		//播放与停止音效***************************************************************************************
		/**播放系统音乐（都一次性的，不需要移除，会自动移除的）
		 * @param $soundID
		 * */
		public static function playShortSound($url:String):void
		{
			if(_isSystemSoundClose)
			{
				return;
			}
			//判断声道数
			if(SoundManager.soundsNum>=MAX_SHORT_NUM)
			{
				return;
			}
			//播放
			playSystemSound($url,1);
		}
		
		/**
		 * 播放行走特效音乐
		 * @param $onMount 是否骑乘状态
		 * */
		public static function playWalkSound(url:String,$completeCallback:Function):void
		{
			if(_isSystemSoundClose)
			{
				return;
			}
			//如果存在就直接返回
			stopWalkSound();
			_walkSoundData = playSystemSound(url, 1);
			if(_walkSoundData)
			{
				_walkSoundData.setOneLoopCmpFun($completeCallback);
			}
		}
		
		/**停止行走特效音乐*/
		public static function stopWalkSound():void
		{
			if(_walkSoundData!=null)
			{
				stopSystemSound(_walkSoundData);
				_walkSoundData = null;
			}
		}
		
		public static function isPlayingWalkSound():Boolean
		{
			return (_walkSoundData != null);
		}
		
		/**
		 * 播放持续施法音效
		 * @param url
		 * 
		 */
		public static function playCastingSound(url:String):void
		{
			if(_isSystemSoundClose)
			{
				return;
			}
			if(_castingSoundData != null)
			{
				return;
			}
			_castingSoundData = playSystemSound(url, int.MAX_VALUE);
		}
		
		/**
		 * 停止持续施法音效
		 * 
		 */
		public static function stopCastingSound():void
		{
			if(_castingSoundData != null)
			{
				stopSystemSound(_castingSoundData);
				_castingSoundData = null;
			}
		}
		
		/**
		 * 播放说话的声音
		 * @param url
		 * 
		 */
		public static function playWordSound(url:String,priority:int = 0,$x:int = -1,$y:int = -1):void
		{
			if(_isSystemSoundClose)
			{
				return;
			}
			if(url != null)
			{
				if(priority >= _wordSoundPriority)
				{
					if(_wordSoundData != null)
					{
						stopWordSound();
					}
					if($x >= 0 && $y >= 0)
					{
						_wordSoundData = PosSoundManager.playPosSound(url,$x,$y);
					}
					else
					{
						_wordSoundData = playSystemSound(url,1);
					}
					_wordSoundPriority = priority;
					if(_wordSoundData)
					{
						_wordSoundData.setOneLoopCmpFun(stopWordSound);
					}
				}
			}
		}
		
		/**
		 * 停止说话的声音
		 * 
		 */
		public static function stopWordSound(...args):void
		{
			if(_wordSoundData != null)
			{
				PosSoundManager.stopPosSound(_wordSoundData);
				_wordSoundData = null;
				_wordSoundPriority = 0;
			}
		}
		
		/**
		 * 播放系统声音
		 * @param $url
		 * @return 
		 * 
		 */
		public static function playSystemSound($url:String,$loopCount:int):SoundData
		{
			var soundData:SoundData = _systemSoundThread.playSound($url, 0, $loopCount);
			return soundData;
		}
		
		/**
		 * 停止某个系统声音
		 * @param $soundData
		 * 
		 */
		public static function stopSystemSound($soundData:SoundData):void
		{
			_systemSoundThread.removeSound($soundData);
		}
		
		/**
		 * 播放循环的环境声音
		 * @return 
		 * 
		 */
		public static function playLoopEvmSound($url:String):SoundData
		{
			var soundData:SoundData = _bgSoundThread.playSound($url,0, int.MAX_VALUE);
			if(soundData)
			{
				soundData.setVolume(_evmSoundInfo.volume);
				if(_isEvmSoundClose)
				{
					soundData.setPause(true);
				}
			}
			return soundData;
		}
		
		/**
		 * 停止一个循环的环境声音
		 * @param $soundData
		 * 
		 */
		public static function stopLoopEvmSound($soundData:SoundData):void
		{
			if($soundData)
			{
				_bgSoundThread.removeSound($soundData);
			}
		}
	}
}