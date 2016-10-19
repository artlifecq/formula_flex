package com.game.engine3D.scene.display
{
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData;
	import com.game.engine3D.vo.Render3DTextData;
	import com.game.mainCore.libCore.pool.Pool;

	import flash.utils.Dictionary;

	/**
	 *
	 * 3D文字渲染
	 * @author L.L.M.Sunny
	 * 创建时间：2016-10-10 下午1:26:38
	 *
	 */
	public class Render3DText extends RenderSet3D
	{
		//---------------------------对象池---------------------------
		private static var _cnt : int = 0;

		private static var _pool : Pool = new Pool("Render3DText", 1000);

		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create(type : String, id : Number) : Render3DText
		{
			_cnt++;
			//利用池生成
			return _pool.createObj(Render3DText, type, id) as Render3DText;
		}

		public static function recycle(rs : Render3DText) : void
		{
			if (!rs)
				return;
			_cnt--;
			//利用池回收
			_pool.disposeObj(rs);
		}

		public static function get cnt() : int
		{
			return _cnt;
		}

		//------------------------------------------------------------

		private var _textDatas : Vector.<Render3DTextData>;
		private var _textRenderUnits : Vector.<RenderUnit3D>;
		private var _text : String;
		private var _align : String;
		private var _styleByName : Dictionary;
		private var _textWidth : int;

		public function Render3DText(type : String, id : Number)
		{
			super(type, id);
		}

		override public function removeAllRenderUnits() : void
		{
			super.removeAllRenderUnits();
			if (_textRenderUnits)
			{
				_textRenderUnits.length = 0;
			}
		}

		public function setStyle(styleName : String, style : String) : void
		{
			if (_styleByName[styleName] == style)
				return;
			_styleByName[styleName] = style;
			_graphicDis.visible = false;
			var len : int = _textDatas.length;
			for (var i : int = 0; i < len; i++)
			{
				var data : Render3DTextData = _textDatas[i];
				if (data.styleName == styleName)
				{
					var sourcePath : String = data.getStyleSourcePath(style);
					var rud : RenderParamData = new RenderParamData(i + 1, type, sourcePath);
					var ru : RenderUnit3D = _textRenderUnits[i];
					ru.setAddedCallBack(doAddUnit, data);
					ru.setRenderParamData(rud);
				}
			}
		}

		public function get text() : String
		{
			return _text;
		}

		public function set text(value : String) : void
		{
			if (_text == value)
				return;
			_text = value;
			var chars : Array = null;
			if (_text)
			{
				chars = [];
				var cLen : int = _text.length;
				for (var ci : int = 0; ci < cLen; ci++)
				{
					chars.push(_text.charAt(ci));
				}
			}
			var len : int = _textDatas.length;
			for (var i : int = 0; i < len; i++)
			{
				var char : String = chars ? chars[i] : null;
				var data : Render3DTextData = _textDatas[i];
				var ru : RenderUnit3D = _textRenderUnits[i];
				var time : int = data.getFrameTimeByChar(char);
				ru.visible = (time > -1);
				ru.play(time);
				ru.stop(time);
			}
			tryShowText();
		}

		public function setTextDatas(datas : Vector.<Render3DTextData>) : void
		{
			_textDatas = datas;
			_graphicDis.visible = false;
			removeAllRenderUnits();
			var len : int = _textDatas.length;
			for (var i : int = 0; i < len; i++)
			{
				var data : Render3DTextData = _textDatas[i];
				var style : String = _styleByName[data.styleName];
				var sourcePath : String = data.getStyleSourcePath(style);
				var rud : RenderParamData = new RenderParamData(i + 1, type, sourcePath);
				var ru : RenderUnit3D = addRenderUnit(rud);
				ru.setAddedCallBack(doAddUnit, data);
				_textRenderUnits.push(ru);
			}
		}

		private function doAddUnit(data : Render3DTextData, ru : RenderUnit3D) : void
		{
			tryShowText();
		}

		private function tryShowText() : void
		{
			var allResReady : Boolean = true;
			for each (var ru : RenderUnit3D in _textRenderUnits)
			{
				if (ru.visible && !ru.resReady)
				{
					allResReady = false;
					break;
				}
			}
			_graphicDis.visible = allResReady;
			layoutText();
		}

		private function layoutText() : void
		{
			if (!_textDatas)
			{
				return;
			}
			var lastX : int = 0;
			var len : int = _textDatas.length;
			var i : int;
			var ru : RenderUnit3D;
			for (i = 0; i < len; i++)
			{
				var data : Render3DTextData = _textDatas[i];
				ru = _textRenderUnits[i];
				if (!ru.visible)
					continue;
				ru.x = lastX;
				if (data.textWidth == 0)
				{
					lastX += ru.width + (i == len - 1 ? 0 : data.spacing);
				}
				else
				{
					lastX += data.textWidth + (i == len - 1 ? 0 : data.spacing);
				}
			}
			_textWidth = lastX;
			if (_align == "center")
			{
				var offsetX : int = -_textWidth * 0.5;
				len = _textRenderUnits.length;
				for (i = 0; i < len; i++)
				{
					ru = _textRenderUnits[i];
					ru.x += offsetX;
				}
			}
		}

		public function get align() : String
		{
			return _align;
		}

		public function set align(value : String) : void
		{
			if (_align == value)
				return;
			_align = value;
			layoutText();
		}

		public function get textWidth() : int
		{
			return _textWidth;
		}

		/**销毁显示对象 */
		override public function destroy() : void
		{
			recycle(this);
		}

		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_textDatas = null;
			_textRenderUnits = new Vector.<RenderUnit3D>();
			_text = null;
			_align = null;
			_textWidth = 0;
			_styleByName = new Dictionary(true);
		}

		override public function dispose() : void
		{
			//标识正在释放中
			_disposing = true;
			_text = null;
			_align = null;
			_textWidth = 0;
			_styleByName = null;
			if (_textDatas)
			{
				_textDatas.length = 0;
				_textDatas = null;
			}
			if (_textRenderUnits)
			{
				_textRenderUnits.length = 0;
				_textRenderUnits = null;
			}
			super.dispose();
		}
	}
}
