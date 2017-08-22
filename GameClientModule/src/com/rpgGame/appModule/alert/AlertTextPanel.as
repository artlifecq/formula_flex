package com.rpgGame.appModule.alert
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.common.alert.AlertInfo;
	import org.mokylin.skin.common.alert.AlertSkin;
	
	import starling.display.DisplayObjectContainer;

	/**
	 * 
	 * @author YT
	 * 创建时间：2017-8-22 下午3:56:45
	 */
	public class AlertTextPanel  extends SkinUIPanel
	{
		private var _skin :AlertInfo;
		public function AlertTextPanel()
		{
			_skin=new AlertInfo();
			super(_skin);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			
			_skin.lb_text.htmlText=String(data);
		}
		
		override public function hide():void 
		{
			super.hide();
		}
		
	}
}