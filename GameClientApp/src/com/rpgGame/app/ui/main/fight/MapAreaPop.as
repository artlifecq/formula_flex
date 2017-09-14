package com.rpgGame.app.ui.main.fight
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	
	/**
	 *地图区域冒泡提示 
	 * @author Administrator
	 * 
	 */
	public class MapAreaPop extends PopSkinUI
	{
		public static const W:int=220;
		public static const H:int=45;
		private var _img:UIAsset;
		
		public function MapAreaPop(data:*)
		{
			super(data);
			_img=new UIAsset();
			_img.styleName="ui/art_txt/mainui/guaji/"+data+".png";
			this.addChild(_img);
		}
		
		override  protected function onShow() : void
		{
			TweenLite.to(this,0.5,{y:this.y-150,alpha:1});
			TweenLite.delayedCall(1.5,removeSelf);
		}
		
		private function removeSelf():void
		{
			this.popComplete();
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.y=sh-220;
			this.x=(sw-W)/2;
		}
	}
}