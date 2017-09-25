package com.rpgGame.appModule.activety.zonghe.lijin
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.activety.zonghe.Active_LiJin_XianSheng;
	
	import starling.display.DisplayObjectContainer;

	/**
	 * 天降礼金刷怪出现
	 * @author YT
	 * 
	 */	
	public class LijinMonsterRefreshPanel extends SkinUIPanel
	{
		private var _skin:Active_LiJin_XianSheng;
		public function LijinMonsterRefreshPanel()
		{
			_skin = new Active_LiJin_XianSheng();
			super(_skin);
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			TweenLite.delayedCall(3, hide);
		}
		override protected function onHide():void
		{
			super.onHide();
			TweenLite.killDelayedCallsTo(hide);
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=sw/2-this.width/2;
			this.y=sh/6;
		}
	}
}