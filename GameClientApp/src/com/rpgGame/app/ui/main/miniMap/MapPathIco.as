package com.rpgGame.app.ui.main.miniMap
{
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * 小地图上的点
	 * @author 卢国征
	 *
	 */
	public class MapPathIco extends Sprite
	{
		private var ico : UIAsset;

		/**
		 * 设置点的色彩、半径
		 * @param color
		 * @param radius
		 * @author 卢国征  2015-4-28
		 */
		public function MapPathIco(color : uint = 0xFF0000, radius : int = 2)
		{
			updateIco(MapRoleIco.getMapPathRoadIcon());
			//drawIco(color, radius);
		}

		/**
		 * 画圆
		 * @param color
		 * @param radius
		 * @author 卢国征  2015-4-28
		 */
		private function drawIco(color : uint, radius : int) : void
		{
//			beginFill(color);
//			drawCircle(0, 0, radius);
//			endFill();
		}

		private function updateIco(icoUrl : String) : void
		{
			if (ico == null)
			{
				ico = new UIAsset();
				ico.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
				addChild(ico);
				ico.addEventListener(Event.COMPLETE, onIcoComplete);
			}

			ico.styleName = icoUrl;
			onIcoComplete(null);
		}

		private function onIcoComplete(e : Event) : void
		{
			if (ico == null)
				return;

			ico.x = (-ico.width) * 0.5;
			ico.y = (-ico.height) * 0.5;
		}

		/**
		 * 更新位置
		 * @param pos
		 * @author 卢国征  2015-4-28
		 */
		public function updatePos(pos : Point) : void
		{
			x = pos.x;
			y = pos.y;
		}

		public function removeMyself() : void
		{
			if (parent != null)
				parent.removeChild(this);
		}
	}
}
