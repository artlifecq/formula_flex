package com.game.engine3D.core
{
	import com.game.engine3D.display.StarlingSprite;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * Starling层
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:42:33
	 *
	 */
	public class StarlingLayer extends StarlingSprite
	{
		private var _layers : HashMap;

		public function StarlingLayer()
		{
			super();
			name = "StarlingLayer";
			_layers = new HashMap();
		}

		public function initLayer(count : int) : void
		{
			for (var i : int = 0; i < count; i++)
			{
				var layer : StarlingSprite = new StarlingSprite();
				addChild(layer);
			}
		}

		public function setLayer(name : String, index : int) : StarlingSprite
		{
			var layer : StarlingSprite = _layers.getValue(name) as StarlingSprite;
			if (layer)
				return layer;
			if (index >= 0 && index < numChildren)
			{
				layer = getChildAt(index) as StarlingSprite;
				var layers : Array = _layers.getValues();
				if (layers.indexOf(layer) < 0)
				{
					layer.name = name;
					_layers.add(name, layer);
				}
				else
				{
					throw new Error("该层已经设置过名字" + layer.name + "，不允许再设置成" + name + "！");
				}
				return layer;
			}
			throw new Error("层索引溢出！");
			return null;
		}

		public function getLayer(name : String) : StarlingSprite
		{
			return _layers.getValue(name) as StarlingSprite;
		}
	}
}
