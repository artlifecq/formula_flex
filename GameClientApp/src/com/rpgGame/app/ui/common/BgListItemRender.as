package com.rpgGame.app.ui.common
{
	import feathers.controls.StateSkin;
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.banghui.ItemBg;
	
	/**
	 *具有换色背景的渲染器 
	 * @author dik
	 * 
	 */
	public class BgListItemRender extends DefaultListItemRenderer
	{
		protected var _skin:StateSkin;
		
		public function BgListItemRender()
		{
			super();
		}
		
		override protected function commitData():void
		{
			if(_data&&this.owner){
				_skin["bg"].skin.bg1.visible=this.index%2==0;
				_skin["bg"].skin.bg2.visible=!(_skin["bg"].skin as ItemBg).bg1.visible;
			}
		}
	}
}