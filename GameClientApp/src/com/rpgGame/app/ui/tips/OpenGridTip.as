package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.tips.OpenGridTipSkin;
	
	import starling.display.Sprite;
	
	import utils.TimerServer;

	/**
	 * 解锁物品格子tips 
	 * @author wewell@163.com
	 * 
	 */	
	public class OpenGridTip extends Sprite implements ITip
	{
		private var skin:Object;//OpenGridTipSkin;
		private var cdTime:Number;
		
		public function OpenGridTip()
		{
//			skin = new OpenGridTipSkin();
			skin.toSprite(this);
			skin.grp.backgroundSkin = skin.imgBG;
		}
		
		public function setTipData( data:* ):void
		{
			return;
//			var unlockInfo:ItemGridUnlockInfo = data as ItemGridUnlockInfo;
			
//			var props:String = PlayerAttributeManager.getAddStatDes(unlockInfo.spriteStat);
//			skin.labProp.htmlText = HtmlTextUtil.leading(props);
			
			TimerServer.delayCall(updateBgSize, 200);
			
//			cdTime = unlockInfo.time/1000;
			updateCdTime();
//			TimerServer.addSecTick(updateCdTime);
		}
		
		private function updateCdTime():void
		{
			if(cdTime <= 0)
			{
				//TimerServer.remove(updateCdTime);
				return;
			}
			skin.labTime.htmlText = "解锁格子需要时间::"+HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, TimeUtil.timeFormatCH(cdTime--) );
		}
		
		private function updateBgSize():void
		{
			skin.imgBG.height = 160;
		}
		
		public function hideTips():void
		{
			//TimerServer.remove(updateCdTime);
		}
		
		private static var _instance:OpenGridTip = null;
		public static function get instance() : OpenGridTip
		{
			if (null == _instance)
			{
				_instance = new OpenGridTip();
			}
			return _instance;
		}
		
	}
}