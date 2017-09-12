package com.rpgGame.appModule.openActivity.bug
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.manager.platform.PlatformUtil;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.OpenActivitySender;
	import com.rpgGame.app.ui.main.openActivity.BaseActivityMainPanel;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.info.openActivity.EnumCampPanelType;
	
	import flash.display.InteractiveObject;
	import flash.utils.getTimer;
	
	import org.mokylin.skin.app.youjiang.Youjiang_Skin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	
	public class BugSubmitPanelExt extends BaseActivityMainPanel
	{
		private var _skin:Youjiang_Skin;
		private var _cdTime:Number;
		private var _timeDiff:Number;
		public function BugSubmitPanelExt()
		{
			_skin=new Youjiang_Skin();
			super(EnumCampPanelType.M_BUG, _skin);
			_skin.txtInput.maxChars=100;
			_skin.txtInput.multiline=true;
			_skin.txtInput.wordWrap=true;
		}
		override protected function setData(hash:HashMap):void
		{
			var actvos:Vector.<ActivityVo>=Mgr.activityPanelMgr.getActivitysByType(_mainPanelType);
			if (actvos&&actvos.length) 
			{
				var serverTime:Number=Number(actvos[0].other);
				_cdTime=serverTime;
			}
		}
		override protected function onShow():void
		{
			super.onShow();
			//Starling.current.nativeStage.focus=_skin.txtInput.nativeFocus as InteractiveObject;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnOK:
				{
					if (_skin.txtInput.text=="") 
					{
						FloatingText.showUp("请输入文字");
						return;
					}
					var left:int=(_cdTime-SystemTimeManager.curtTm)/1000;
					if (left>0) 
					{
						FloatingText.showUp("提交太频繁，请等"+left+"秒后再试");
						return;
					}
					OpenActivitySender.reqSubmitBug(_skin.rdoBUG.isSelected?1:2,_skin.txtInput.text);
					_cdTime=SystemTimeManager.curtTm+500;
					break;
				}
				case _skin.lbEnter:
				{
					PlatformUtil.platform.goBBS();
				}
				default:
				{
					break;
				}
			}
		}
	}
}