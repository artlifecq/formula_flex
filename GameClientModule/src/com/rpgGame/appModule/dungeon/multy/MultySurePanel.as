package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.fuben.FuBenTanKuang1;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	/**
	* 副本进入倒计时框
	* @author yt
	* 
	*/
	public class MultySurePanel extends SkinUIPanel
	{
		private var _skin :FuBenTanKuang1;
		public function MultySurePanel()
		{
			_skin=new FuBenTanKuang1();
			super(_skin);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
		}
		
		override public function hide():void 
		{
			super.hide();
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			
			
		}
	}
}