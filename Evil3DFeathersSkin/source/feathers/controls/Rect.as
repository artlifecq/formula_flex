package feathers.controls
{
	
	import flash.geom.Rectangle;
	
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.ILayoutData;
	import feathers.layout.ILayoutDisplayObject;
	
	import starling.display.Canvas;
	import away3d.events.Event;
	import starling.rendering.Painter;
	
	/**
	 * 矩形绘图元素。矩形的角可以是圆角,此组件可响应鼠标事件。
	 * @author wewell@163.com
	 */
	public class Rect extends Canvas implements ILayoutDisplayObject
	{
		private var _isInvalidate:Boolean;
		private var _hitArea:Rectangle;
		/**
		 * 构造函数
		 */		
		public function Rect()
		{
			super();
			touchGroup = false;
			_hitArea = new Rectangle(0, 0, 20, 20);
		}
		
		private var _fillColor:uint = 0xFFFFFF;
		/**
		 * 填充颜色
		 */
		public function get fillColor():uint
		{
			return _fillColor;
		}
		public function set fillColor(value:uint):void
		{
			if(_fillColor==value)
				return;
			_fillColor = value;
			invalidate();
		}
		
		private var _fillAlpha:Number = 1;
		/**
		 * 填充透明度,默认值为0。
		 */
		public function get fillAlpha():Number
		{
			return _fillAlpha;
		}
		public function set fillAlpha(value:Number):void
		{
			if(_fillAlpha==value)
				return;
			_fillAlpha = value;
			invalidate();
		}
		
		private var _strokeColor:uint = 0x444444;
		/**
		 * 边框颜色,注意：当strokeAlpha为0时，不显示边框。
		 */
		public function get strokeColor():uint
		{
			return _strokeColor;
		}

		public function set strokeColor(value:uint):void
		{
			if(_strokeColor==value)
				return;
			_strokeColor = value;
			invalidate();
		}

		private var _strokeAlpha:Number = 0;
		/**
		 * 边框透明度，默认值为0。
		 */
		public function get strokeAlpha():Number
		{
			return _strokeAlpha;
		}
		public function set strokeAlpha(value:Number):void
		{
			if(_strokeAlpha==value)
				return;
			_strokeAlpha = value;
			invalidate();
		}
		
		private var _strokeWeight:Number = 1;
		/**
		 * 边框粗细(像素),注意：当strokeAlpha为0时，不显示边框。
		 */
		public function get strokeWeight():Number
		{
			return _strokeWeight;
		}
		public function set strokeWeight(value:Number):void
		{
			if(_strokeWeight==value)
				return;
			_strokeWeight = value;
			invalidate();
		}

		
		private var _radius:Number = 0;
		/**
		 * 设置四个角的为相同的圆角半径。您也可以分别对每个角设置半径，
		 * 但若此属性不为0，则分别设置每个角的半径无效。默认值为0。
		 */
		public function get radius():Number
		{
			return _radius;
		}
		public function set radius(value:Number):void
		{
			if(value<0)
				value=0;
			if(_radius==value)
				return;
			_radius = value;
			invalidate();
		}

		private var _topLeftRadius:Number = 0;
		/**
		 * 左上角圆角半径，若设置了radius不为0，则此属性无效。
		 */
		public function get topLeftRadius():Number
		{
			return _topLeftRadius;
		}
		public function set topLeftRadius(value:Number):void
		{
			if(value<0)
				value=0;
			if(_topLeftRadius==value)
				return;
			_topLeftRadius = value;
			invalidate();
		}

		private var _topRightRadius:Number = 0;
		/**
		 * 右上角圆角半径，若设置了radius不为0，则此属性无效。
		 */
		public function get topRightRadius():Number
		{
			return _topRightRadius;
		}
		public function set topRightRadius(value:Number):void
		{
			if(value<0)
				value=0;
			if(_topRightRadius==value)
				return;
			_topRightRadius = value;
			invalidate();
		}

		private var _bottomLeftRadius:Number = 0;
		/**
		 * 左下角圆角半径，若设置了radius不为0，则此属性无效。
		 */
		public function get bottomLeftRadius():Number
		{
			return _bottomLeftRadius;
		}
		public function set bottomLeftRadius(value:Number):void
		{
			if(value<0)
				value=0;
			if(_bottomLeftRadius==value)
				return;
			_bottomLeftRadius = value;
			invalidate();
		}

		private var _bottomRightRadius:Number = 0;
		/**
		 * 右下角圆角半径，若设置了radius不为0，则此属性无效。
		 */
		public function get bottomRightRadius():Number
		{
			return _bottomRightRadius;
		}
		public function set bottomRightRadius(value:Number):void
		{
			if(value<0)
				value=0;
			if(_bottomRightRadius==value)
				return;
			_bottomRightRadius = value;
			invalidate();
		}
		
		public function invalidate():void
		{
			_isInvalidate = true;
		}
		
		/**
		 * @inheritDoc
		 */
		protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			var g:Canvas = this;
			g.clear();
			g.beginFill(_fillColor,_fillAlpha);
			if(_strokeAlpha>0)
			{
				//g.lineStyle(_strokeWeight,_strokeColor,_strokeAlpha);
			}
			if(_radius>0)
			{
				g.drawCircle(0, 0, _radius);
			}
			else if(_topLeftRadius>0||_topRightRadius>0||_bottomLeftRadius>0||_bottomRightRadius>0)
			{
				g.drawEllipse(0, 0, unscaledWidth, unscaledHeight);
			}
			else
			{
				g.drawRectangle(0, 0, unscaledWidth, unscaledHeight);
			}
			g.endFill();
		}
		
		override public function render(painter:Painter):void
		{
			if(_isInvalidate)
			{
				updateDisplayList(_hitArea.width, _hitArea.height);
				_isInvalidate = false;
			}
		}
		
		override public function set width(value:Number):void
		{
			if(_hitArea.width == value)
			{
				return;
			}
			_hitArea.width = value;
			invalidate();
		}
		
		override public function set height(value:Number):void
		{
			if(_hitArea.height == value)
			{
				return;
			}
			_hitArea.height = value;
			invalidate();
		}
		
		override public function get width():Number
		{
			return _hitArea.width;
		}
		
		override public function get height():Number
		{
			return _hitArea.height;
		}
		
		//========================layout=================================
		/**
		 * @private
		 */
		protected var _includeInLayout:Boolean = true;
		
		/**
		 * @inheritDoc
		 *
		 * @default true
		 */
		public function get includeInLayout():Boolean
		{
			return this._includeInLayout;
		}
		
		/**
		 * @private
		 */
		public function set includeInLayout(value:Boolean):void
		{
			if(this._includeInLayout == value)
			{
				return;
			}
			this._includeInLayout = value;
			this.dispatchEventWith(FeathersEventType.LAYOUT_DATA_CHANGE);
		}
		
		/**
		 * @private
		 */
		protected var _layoutData:ILayoutData;
		
		/**
		 * @inheritDoc
		 *
		 * @default null
		 */
		public function get layoutData():ILayoutData
		{
			return this._layoutData;
		}
		
		/**
		 * @private
		 */
		public function set layoutData(value:ILayoutData):void
		{
			if(this._layoutData == value)
			{
				return;
			}
			if(this._layoutData)
			{
				this._layoutData.removeEventListener(Event.CHANGE, layoutData_changeHandler);
			}
			this._layoutData = value;
			if(this._layoutData)
			{
				this._layoutData.addEventListener(Event.CHANGE, layoutData_changeHandler);
			}
			this.dispatchEventWith(FeathersEventType.LAYOUT_DATA_CHANGE);
		}
		/**
		 * @private
		 */
		protected function layoutData_changeHandler(event:Event):void
		{
			this.dispatchEventWith(FeathersEventType.LAYOUT_DATA_CHANGE);
		}
		
		private var _left:Number;
		
		/**
		 * @inheritDoc
		 */
		public function get left():Number
		{
			return _left;
		}
		public function set left(value:Number):void
		{
			if(_left == value)
				return;
			_left = value;
			invalidateAnchorLayoutDataData("left", value);
		}
		
		private var _right:Number;
		/**
		 * @inheritDoc
		 */
		public function get right():Number
		{
			return _right;
		}
		public function set right(value:Number):void
		{
			if(_right == value)
				return;
			_right = value;
			invalidateAnchorLayoutDataData("right", value);
		}
		
		private var _top:Number;
		/**
		 * @inheritDoc
		 */
		public function get top():Number
		{
			return _top;
		}
		public function set top(value:Number):void
		{
			if(_top == value)
				return;
			_top = value;
			invalidateAnchorLayoutDataData("top", value);
		}
		
		private var _bottom:Number;
		/**
		 * @inheritDoc
		 */	
		public function get bottom():Number
		{
			return _bottom;
		}
		public function set bottom(value:Number):void
		{
			if(_bottom == value)
				return;
			_bottom = value;
			invalidateAnchorLayoutDataData("bottom", value);
		}
		
		private var _horizontalCenter:Number;
		/**
		 * @inheritDoc
		 */
		public function get horizontalCenter():Number
		{
			return _horizontalCenter;
		}
		public function set horizontalCenter(value:Number):void
		{
			if(_horizontalCenter == value)
				return;
			_horizontalCenter = value;
			invalidateAnchorLayoutDataData("horizontalCenter", value);
		}
		
		private var _verticalCenter:Number;
		/**
		 * @inheritDoc
		 */
		public function get verticalCenter():Number
		{
			return _verticalCenter;
		}
		public function set verticalCenter(value:Number):void
		{
			if(_verticalCenter == value)
				return;
			_verticalCenter = value;
			invalidateAnchorLayoutDataData("verticalCenter", value);
		}
		
		private function invalidateAnchorLayoutDataData(prop:String, value:Number):void
		{
			if(layoutData == null)
			{
				layoutData = new AnchorLayoutData();
			}
			layoutData[prop] = value;
		}
	}
}