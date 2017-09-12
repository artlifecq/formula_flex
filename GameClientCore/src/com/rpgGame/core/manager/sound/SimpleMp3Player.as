package com.rpgGame.core.manager.sound
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundLoaderContext;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	import utils.TimerServer;
	
	/**
	 * 简单Mp3播放管理器 ,可淡入淡出,不使用TweenLite
	 * @author wewell
	 * 
	 */	
	public class SimpleMp3Player
	{
		private var _sound:Sound;
		private var _soundChannel:SoundChannel;
		private var _slc:SoundLoaderContext;
		private var _stf:SoundTransform;
		private var _position:Number = 0;
		private var _isPlay:Boolean = false;
		private var destoryOnComplete:Boolean=false;
		private var _url:String;
		private var _repeat:int=1;
		
		//是否空闲
		private var free:Boolean=true;
		
		//用户设置的声音大小
		private var _volume:Number = 1;
		
		//渐变过程中的声音大小值
		private var _tweenVolume:Number = 0.0;
		
		//淡入或淡出所需毫秒数
		private var _tweenTime:int=0;
		
		//声音渐变阙值
		private  var volume_tween_gap:Number = 0.01;
		
		public function SimpleMp3Player()
		{
			_slc = new SoundLoaderContext(0,true);
			_stf = new SoundTransform(_volume, 0);
		}
		
		private function onSoundError(event:Event):void {
			trace("onSoundIOError: " + _url);
		}
		private function onSoundProgress(event:ProgressEvent):void {
			//tracing("progressHandler: " + event);
		}
		
		private function onSoundOpen(e:Event):void{
			
		}
		
		/**
		 * 创建播放声道 
		 * @param sc
		 * 
		 */		
		private function creatSoundChannel(sc:SoundChannel):void
		{
			if(sc){
				_soundChannel = sc;
				_soundChannel.addEventListener(Event.SOUND_COMPLETE, onPlayComplete);
				if(_tweenTime > 0)
				{
					setVolume(0);
					TimerServer.remove(tweenVolumeOut);
					TimerServer.addTick(tweenVolumeIn);
				}else
				{
					_stf.volume = 0.5;
				}
			}
		}
		
		/**
		 * 删除声道 
		 * 
		 */		
		private function deleteSoundChannel():void
		{
			if(_soundChannel){
				_soundChannel.stop();
				_soundChannel.removeEventListener(Event.SOUND_COMPLETE, onPlayComplete);
				_soundChannel = null;
			}
		}
		
		/**
		 * 声道播放完成事件 
		 * @param e
		 * 
		 */		
		private function onPlayComplete(e:Event):void
		{
			_isPlay = false;
			//stop();
			destoryOnComplete ? close() : replay();
		}
		
		
		private function removeSoundEvent():void
		{
			_sound.removeEventListener(Event.OPEN,onSoundOpen);
			_sound.removeEventListener(ProgressEvent.PROGRESS,onSoundProgress);
			_sound.removeEventListener(Event.COMPLETE,onSoundComplete);
			_sound.removeEventListener(IOErrorEvent.IO_ERROR,onSoundError);
		}
		
		/**
		 * 声音加载完成事件 
		 * @param e
		 */		
		private function onSoundComplete(e:Event):void
		{
			removeSoundEvent();
			creatSoundChannel(_sound.play(0, 0, _stf));
		}
		
		
		/**
		 *淡入
		 * 
		 */		
		private function tweenVolumeIn():void
		{
			_tweenVolume += volume_tween_gap;
			setVolume( _tweenVolume );
			if(_tweenVolume >= _volume)
			{
				TimerServer.remove(tweenVolumeIn);
			}
		}
		
		/**
		 *淡出
		 * 
		 */		
		private function tweenVolumeOut():void
		{
			_tweenVolume -= volume_tween_gap;
			setVolume( _tweenVolume );
			if(_tweenVolume <= 0)
			{
				TimerServer.remove(tweenVolumeOut);
				close();
			}
		}
		
		/**
		 * 内部声音渐变时使用 
		 * @param value
		 * 
		 */		
		private function setVolume(value:Number):void
		{
			_stf.volume = value;
			if(_soundChannel){
				_soundChannel.soundTransform = _stf;
			}
		}
		
		private function __play(path:String=null):void{
			if(!path)return;
			
			TimerServer.remove(play);
			
			close();
			
			if(_sound == null){
				_sound = new Sound();
				_sound.addEventListener(Event.OPEN,onSoundOpen);
				_sound.addEventListener(ProgressEvent.PROGRESS,onSoundProgress);
				_sound.addEventListener(Event.COMPLETE,onSoundComplete);
				_sound.addEventListener(IOErrorEvent.IO_ERROR,onSoundError);
				_sound.load(new URLRequest(path),_slc);
				_url = path;
				_isPlay = true;
				free = false;
			}
		}
		
		private function replay():void{
			TimerServer.add(__replay, 3*1000);
		}
		
		private function __replay():void
		{
			play(_url, _repeat);
		}
		
		public function play(path:String=null, repeat:int=0):void
		{
			if(!_openSound){
				return;
			}
			if(!path){
				return ;
			}
			
			if(_isPlay && path == _url)
			{
				return;
			}
			
			this._repeat = repeat;
			this._url = path;
			
			destoryOnComplete = repeat == 1 ? true : false;
			
			__play(path);
		}
		
		public function get url():String{
			return _url;
		}
		
		/**
		 *暂停 
		 * 
		 */		
		public function pause():void
		{
			if(_sound == null || _isPlay==false){
				return;
			}
			_position = _soundChannel.position;
			deleteSoundChannel();
		}
		
		/**
		 *恢复 
		 * 
		 */		
		public function resume():void
		{
			if(_sound == null || _isPlay==false){
				return;
			}
			creatSoundChannel(_sound.play(_position));
		}
		
		/**
		 * 秒数 
		 * @param t
		 * 
		 */		
		public function set tweenTime(t:Number):void
		{
			_tweenTime = t * 1000;
		}
		
		/**
		 *停止 
		 * 
		 */		
		public function stop():void
		{
			if(_tweenTime > 0)
			{
				TimerServer.remove(tweenVolumeIn);
				TimerServer.addTick(tweenVolumeOut);
			}else
			{
				close();
			}
		}
		
		/**
		 * 关闭链接，初始化播放器
		 * 
		 */		
		public function close():void
		{
			_isPlay = false;
			
			//停止渐大变小
			TimerServer.remove(tweenVolumeOut);
			TimerServer.remove(tweenVolumeIn);
			
			if(_sound){
				removeSoundEvent();
				try{
					_sound.close();
				}catch(e:Error){
					//trace(e.message);
				}
				
				_sound = null;
			}
			_position = 0;
			deleteSoundChannel();
			_url = null;
			free = true;
		}
		
		public function get volume():Number
		{
			return _volume;
		}
		
		/**
		 * 设置声音大小0-1 
		 * @param value
		 * 
		 */		
		public function set volume(value:Number):void
		{
			_volume = value;
			if(_tweenTime > 0)volume_tween_gap = 60/_tweenTime;
			setVolume(value);
		}
		
		//========================================static===================================
		//
		
		/**是否开放声音,设为false,则全部声音不能播放**/
		public static function set openSound(open:Boolean):void
		{
			_openSound = open;
		}
		
		public static function get openSound():Boolean
		{
			return _openSound;
		}
		
		/**静态共享单例,用于场景背景音乐等不会并发的场合**/
		public static function get player():SimpleMp3Player{
			if(_player == null){
				_player = new SimpleMp3Player();
				_player.tweenTime = 6;
				_player.volume = 0.5;
			}
			return _player;
		}
		
		/**
		 * 仅播放一次，完成后自我清理并加入到池中重复利用, 适合一次性播放的音效
		 * @param path
		 */		
		public static function playOnce(path:String):void{
			if(pool == null)pool = new Vector.<SimpleMp3Player>();
			
			var mp3:SimpleMp3Player;
			for each(mp3 in pool)
			{
				if(mp3.free == true)
					break;
			}
			
			if(mp3 == null && pool.length < POOL_MAX)
			{
				mp3 = new SimpleMp3Player();
				pool.push(mp3);
			}
			
			if(mp3 != null)
			{
				mp3.play(path, 1);
			}
		}
		
		public static function stopPlaying():void
		{
			var mp3:SimpleMp3Player;
			for each(mp3 in pool)
			{
				if(mp3.free == false)
				{
					mp3.stop();
				}
			}
		}
		
		/**是否开放声音,设为false,则全部声音不能播放**/
		private static var _openSound:Boolean=true;
		
		/**静态共享单例,用于场景背景音乐等不会并发的场合**/
		private static var _player:SimpleMp3Player;
		
		/**播放器池,用于一次性音效播放,最多10个音效并发播放 **/
		private static var pool:Vector.<SimpleMp3Player>;
		private static const POOL_MAX:int = 10;
	}
}

