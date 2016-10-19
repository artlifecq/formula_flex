package com.client.manager
{
	import com.app.events.AudioEvent;
	import com.app.media.AudioInfo;
	import com.app.media.AudioInterface;
	import com.client.AudioConfigType;
	import com.client.ClientGlobal;

	/**
	 * 游戏音乐管理器
	 * @author Seven.C
	 * 创建时间：2016-6-27 下午4:36:13
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-29 下午3:05:12
	 */
	public class BGMManager
	{
		public function BGMManager()
		{
		}

		public static function setup() : void
		{
			AudioInterface.init();

			AudioInterface.dispatcher.addEventListener(AudioEvent.SEND_MSG, onSendMsgHandler);
			AudioInterface.dispatcher.addEventListener(AudioEvent.SUB_NODE_START, onSubStartPlayHandler);
			AudioInterface.dispatcher.addEventListener(AudioEvent.SUB_NODE_REPEAT, onSubRepeatHandler);
			AudioInterface.dispatcher.addEventListener(AudioEvent.SUB_NODE_COMPLETE, onSubCompleteHandler);
			AudioInterface.dispatcher.addEventListener(AudioEvent.ALL_AUDIO_COMPLETE, onAllCompleteHandler);
			AudioInterface.dispatcher.addEventListener(AudioEvent.SOUND_LOOP_COMPLETE, onSoundLoopCompleteHandler);
		}

		public static function playMusic(fileName : String) : void
		{
			var url : String = ClientGlobal.getSound(fileName);
			var info : AudioInfo = new AudioInfo(url);
			info.fadeInTime = 500;
			info.fadeOutTime = 500;
			info.loop = 0;
			AudioInterface.track(AudioConfigType.MUSIC_CHANNEL).playAudio(info);
		}

		public static function playUIEffectSound(fileName : String) : void
		{
			var url : String = ClientGlobal.getSound(fileName);
			var info : AudioInfo = new AudioInfo(url);
			info.fadeInTime = 0;
			info.fadeOutTime = 0;
			info.loop = 1;
			AudioInterface.track(AudioConfigType.UI_EFFECT_CHANNEL).playAudio(info);
		}

		//开始播放一个节点
		private static function onSubStartPlayHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "play");
		}

		//重复播放一个节点时
		private static function onSubRepeatHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "repeat");
		}

		//节点播放完成
		private static function onSubCompleteHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "complete");
		}

		//指定节点播放完成后发送的事件消息
		private static function onSendMsgHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "get msg");
		}

		//整首音乐准备重复播放
		private static function onSoundLoopCompleteHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "will repeat");
		}

		//整首音乐播放完成
		private static function onAllCompleteHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "play end");
		}

	}
}
