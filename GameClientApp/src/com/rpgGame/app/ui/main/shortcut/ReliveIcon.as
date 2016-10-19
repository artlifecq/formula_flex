package com.rpgGame.app.ui.main.shortcut
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.ReliveManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.info.scene.DieInfo;
	import com.rpgGame.coreData.lang.LangRelive;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.MessageReliveIconSkin;

	public class ReliveIcon extends MessageIconBase
	{
		private var _skin:MessageReliveIconSkin;
		/** 定时器 **/
		private var _gTime:GameTimer;
		/** 角色死亡信息 **/
		private var _curDieInfo:DieInfo;
		
		public function ReliveIcon()
		{
			_skin = new MessageReliveIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}
		
		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,EnumFunctionMessageBarIcoType.RELIVE_TYPE);
			AppManager.showAppNoHide(AppConstant.RELIVE_PANEL);
		}
		
		/**
		 * 开始计时 
		 * 
		 */		
		public function startTime():void
		{
			_curDieInfo = ReliveManager.curDieInfo;
			if( _curDieInfo == null )
				return;
			
			if( _gTime == null )
			{
				_gTime = new GameTimer("ReliveIcon");
				_gTime.onUpdate = onUpdate;
			}
			
			_gTime.start();
		}
		
		/**
		 * 更新显示 
		 * 
		 */		
		private function onUpdate():void
		{
			_skin.labReliveTime.htmlText = LanguageConfig.getText( LangRelive.autoRelive, [ int( ( _curDieInfo.reliveTimes - SystemTimeManager.curtTm ) / 1000 ) ] );
			var remaining:int = int( ( _curDieInfo.reliveTimes - SystemTimeManager.curtTm ) / 1000 );
			if( remaining <= 0 )
			{
				_gTime.stop();
				_gTime = null;				
			}
		}
		
		public function removeTime():void
		{
			if( _gTime != null )
			{
				_gTime.stop();
				_gTime = null;				
			}
		}
	}
}