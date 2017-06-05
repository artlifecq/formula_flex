package com.rpgGame.app.ui.main.top {
	import com.app.media.AudioInterface;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.sound.TSoundManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.SystemTimeEvent;
	import com.rpgGame.core.manager.AudioConfigType;
	import com.rpgGame.core.manager.BGMManager;
	import com.rpgGame.core.manager.sound.SimpleMp3Player;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.login.message.ResHeartMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.top.top_Right_Skin;
	
	import starling.display.DisplayObject;
	
	public class TopBar extends SkinUI {
		private var _skin : top_Right_Skin;
		private var isPlay:Boolean;
		
		public function TopBar() {
			this._skin = new top_Right_Skin();
			super(this._skin);
			_skin.btn_lock.visible=false;
			_skin.btn_write.visible=false;
			_skin.btn_mail.x=_skin.btn_lock.x;
			isPlay=true;
			initEvent();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(SystemTimeEvent.SEVER_TIMR,updateTime);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			CONFIG::netDebug {
				NetDebug.LOG("[MainUI] [TopBar] [onTouchTarget] target:" + target.name);
			}
				switch(target)
				{
					case this._skin.btn_set:
						AppManager.showApp(AppConstant.SYSTEMSET_PANEL);
						break;
					case this._skin.btn_mail:
						AppManager.showApp(AppConstant.MAIL_PANEL);
						break;
					case this._skin.btn_sound:
						isPlay=!isPlay;
						BGMManager.setMusicIsPlay(isPlay);
						if(isPlay)  BGMManager.playMusic(SceneManager.clientMapData.bgSoundRes);
						else AudioInterface.track(AudioConfigType.MUSIC_CHANNEL).stop(true);
						break;
				}
		}
		
		public function updateTime(msg:ResHeartMessage):void
		{
			var date:Date = new Date(msg.time.fValue);
			var hour:String=date.hours>9?date.hours.toString():"0"+date.hours;
			var fen:String=date.minutes>9?date.minutes.toString():"0"+date.minutes;
			_skin.txt_times.text=hour+":"+fen;
		}
		
		public function resize(w : int, h : int) : void {
			this.y = 3;
			this.x = w - this._skin.width;
		}
	}
}