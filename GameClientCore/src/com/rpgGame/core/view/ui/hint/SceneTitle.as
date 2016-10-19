package com.rpgGame.core.view.ui.hint
{
	import starling.display.Image;
	import starling.display.Sprite;

	
	/**
	 * 地图名字展示		未完成
	 * @author luguozheng
	 * 
	 */	
	public class SceneTitle extends Sprite
	{
		private var mapTitleImage:Image;
		
		public function SceneTitle()
		{
		}
		
		/**
		 * 
		 * @param mapId
		 * 
		 */		
		public function setData( mapId:int ):void
		{
			dispose();
			
			if( mapTitleImage == null )
			{
//				mapTitleImage = new Image();
//				addChild( mapTitleImage );
			}
		
			
		}
		
		
		override public function dispose():void
		{
			super.dispose();
		
			if( mapTitleImage != null )
			{
				mapTitleImage.dispose();
			}
			
			if( this != null && parent != null )
			{
				this.parent.removeChild( this );
			}
		}
	}
}