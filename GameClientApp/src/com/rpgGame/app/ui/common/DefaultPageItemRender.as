package com.rpgGame.app.ui.common
{
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.StateSkin;
	
	/**
	 *默认的页面元素渲染器
	 *@author dik
	 *2017-5-11上午10:38:18
	 */
	public class DefaultPageItemRender extends SkinUI
	{
		protected var _data:Object;
		
		public function DefaultPageItemRender(skin:StateSkin=null)
		{
			super(skin);
		}
		
		public function setData(data:Object):void
		{
			_data=data;
			commitData();
		}
		
		protected function commitData():void
		{
			
		}
	}
}