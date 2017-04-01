package com.rpgGame.app.display2D
{
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.StateSkin;
	
	/**
	 *冒泡皮肤基类 
	 * @author dik
	 * 
	 */
	public class PopSkinUI extends SkinUI
	{
		public var showEnd:Function;
		protected var _skin:StateSkin;
		
		
		public function PopSkinUI(data:*)
		{
			super(_skin);
		}
		
		protected function popComplete():void
		{
			if(showEnd){
				showEnd();
			}
			StarlingLayerManager.topUILayer.removeChild(this);
		}
		
		override protected function onHide():void
		{
			this.dispose();
		}
	}
}