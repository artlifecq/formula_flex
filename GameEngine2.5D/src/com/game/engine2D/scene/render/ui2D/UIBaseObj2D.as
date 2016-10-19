package com.game.engine2D.scene.render.ui2D{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.vo.IDisplayDrawable;
	import com.game.engine2D.vo.IFrameRender;
	import com.game.mainCore.core.interfaces.IDisplayObject;
	import com.game.mainCore.libCore.pool.IPoolClass;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.IBitmapDrawable;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.client.mainCore.utils.Tick;
	
	/**
	 * 基本元素模型（实现了池接口）
	 * @author Carver
	 */	
	public class UIBaseObj2D implements IPoolClass,IDisplayObject,IDisplayDrawable,IFrameRender
	{
		//唯一ID(注意用Number而不要用int)--------------------------------------------------------------------
		/**
		 * 全局计数的唯一ID
		 */		
		private static var UNIQUE_ID:Number = 0;
		/**
		 * 唯一ID
		 */		
		private var _uniqueID:Number = 0;
		
		/**
		 * 唯一ID
		 */		
		public function get uniqueID():Number
		{
			return _uniqueID;
		}
		
		
		//最基本的属性--------------------------------------------------------------------
		/**
		 * ID
		 */		
		public var id:Number;
		/**
		 * 名称
		 */		
		public var name:String;
		/**
		 * 类型
		 */		
		public var type:String;
		/**
		 * 是否正在被释放(此参数标识正在被释放的对象)
		 */	
		public var disposing:Boolean = false;
		
		/**
		 * 是否可以移除和回收
		 */	
		public var canRemoved:Boolean = true;
		
		protected var _usable:Boolean = false;
		/**
		 * 是否可用(此参数只应在池回收时改变，外部不要改变)
		 */
		public function get usable():Boolean
		{
			return _usable;
		}
		public function set usable(value:Boolean):void
		{
			_usable = value;
		}
		
		//*******************************************IFrameRender接口基本参数*******************************************
		public function startRender():void
		{
			Tick.addCallback(onTick);
		}
		
		public function stopRender():void
		{
			Tick.removeCallback(onTick);
		}
		
		//*******************************************IDisplayable接口基本参数*******************************************
		protected var _x:Number = 0;
		/**显示位置X*/
		public function get x():Number
		{
			return _x;
		}
		public function set x(value:Number):void
		{
			if(_x != value)
			{
				_x = value;
				updateNow = true;
			}
		}
		
		protected var _y:Number = 0;
		/**显示位置Y*/
		public function get y():Number
		{
			return _y;
		}
		public function set y(value:Number):void
		{
			if(_y != value)
			{
				_y = value;
				updateNow = true;
			}
		}
		
		protected var _offsetX:Number = 0;
		/**偏移量X*/
		public function get offsetX():Number
		{
			return _offsetX;
		}
		public function set offsetX(value:Number):void
		{
			if(_offsetX != value)
			{
				_offsetX = value;
				updateNow = true;
			}
		}
		
		protected var _offsetY:Number = 0;
		/**偏移量Y*/
		public function get offsetY():Number
		{
			return _offsetY;
		}
		public function set offsetY(value:Number):void
		{
			if(_offsetY != value)
			{
				_offsetY = value;
				updateNow = true;
			}
		}
		
		protected var _visible:Boolean = true;
		/**是否显示 */
		public function get visible():Boolean
		{
			return _visible;
		}
		
		public function set visible(value:Boolean):void
		{
			_visible = value;
			
			setParentValue(_visible && _needRender);
			updateNow = true;
		}
		
		protected var _isInViewDistance:Boolean = false;
		/**
		 * 是否在可视范围内 
		 * @param value
		 */		
		public function set isInViewDistance(value:Boolean):void
		{
			if(_isInViewDistance != value)
			{
				_isInViewDistance = value;
				setParentValue(_visible && _needRender && _isInViewDistance);
			}
			else
			{
				if(_isInViewDistance == false && _graphicDis && _graphicDis.stage)//如果不在视野里，但是又在舞台上，肯定就是不行的啦。
				{
					setParentValue(_visible && _needRender && _isInViewDistance);
				}
				if(_isInViewDistance == true && _graphicDis && !_graphicDis.stage)//如果在视野里，但是又没在舞台上，肯定就是不行的啦。
				{
					setParentValue(_visible && _needRender && _isInViewDistance);
				}
			}
		}
		
		public function get isInViewDistance():Boolean
		{
			return _isInViewDistance;
		}
		
		/**
		 * 是否需要判断可视距离(一些UI特效等是不需要的啦...) 
		 * @param value
		 */
		public var needInViewDis:Boolean = true;
		
		protected var _alpha:Number = 1;
		/**透明度 */
		public function get alpha():Number
		{
			return _alpha;
		}
		public function set alpha(value:Number):void
		{
			if(_alpha != value)
			{
				_alpha = value;
				if(_graphicDis)
				{
					_graphicDis.alpha = value;
				}
				updateNow = true;
			}
		}
		
		/**
		 * 处于遮挡区域时是否显示半透效果
		 */	
		public var enableMask:Boolean = false;
		
		protected var _scaleX:Number = 0;
		/**X缩放 */
		public function get scaleX():Number
		{
			return _scaleX;
		}
		public function set scaleX(value:Number):void
		{
			if(_scaleX != value)
			{
				_scaleX = value;
			}
		}
		
		protected var _scaleY:Number = 0;
		/**X缩放 */
		public function get scaleY():Number
		{
			return _scaleY;
		}
		public function set scaleY(value:Number):void
		{
			if(_scaleY != value)
			{
				_scaleY = value;
			}
		}
		
		protected var _rotation:Number = 0;
		/**角度 */
		public function get rotation():Number
		{
			return _rotation;
		}
		public function set rotation(value:Number):void
		{
			if(_rotation != value)
			{
				_rotation = value;
				updateNow = true;
			}
		}
		
		protected var _logicAngle:uint = 0;
		/**逻辑角度 */
		public function get logicAngle():uint
		{
			return _logicAngle;
		}
		public function set logicAngle(value:uint):void
		{
			if(_logicAngle != value)
			{
				_logicAngle = value;
				updateNow = true;
			}
		}
		
		protected var _depth:int = 0;
		/**深度(用于深度排序)*/
		public function get depth():int
		{
			return _depth;
		}
		public function set depth(value:int):void
		{
			if(_depth != value)
			{
				_depth = value;
				
				updateNow = true;
			}
		}
		
		protected var _depthIndex:uint = 0;
		/**深度(用于深度排序)*/
		public function get depthIndex():uint
		{
			return _depthIndex;
		}
		
		public function set depthIndex(value:uint):void
		{
			if(_parent && _graphicDis && _graphicDis.parent && _graphicDis.parent == _parent)
			{
				if(_depthIndex != value)
				{
					if(_parent.numChildren > value)
					{
						_parent.setChildIndex(_graphicDis,value);
					}
				}
			}
			_depthIndex = value;
		}
		
		protected var _depthIndexLength:uint = 0;
		/**深度(用于深度排序)*/
		public function get depthIndexLength():uint
		{
			_depthIndexLength = 0;
			if(_graphicDis && _graphicDis.parent)
			{
				_depthIndexLength = 1;
			}
			return _depthIndexLength;
		}
		
		protected var _mouseEnabled:Boolean = false;
		/**是否启用鼠标(区别于AS3中的mouseEnabled，此mouseEnabled=AS3中的mouseEnabled+mouseChildren)*/
		public function get mouseEnabled():Boolean
		{
			return _mouseEnabled;
		}
		public function set mouseEnabled(value:Boolean):void
		{
			if(_mouseEnabled != value)
			{
				_mouseEnabled = value;
				updateNow = true;
			}
		}
		
		public var updateNow:Boolean = true;
//		protected var _updateNow:Boolean = true;
//		/**是否需要立即更新*/
//		public function get updateNow():Boolean
//		{
//			return _updateNow;
//		}
//		public function set updateNow(value:Boolean):void
//		{
//			_updateNow = value;
//		}
		
		/**渲染显示坐标(一般由,(x+offsetX,y+offsetY),也可能别的接口过来赋值)*/
		public function get showPos():Point
		{
			return new Point(0,0);
		}
		
		protected var _graphicDis:DisplayObject;
		/**所属渲染容器*/
		public function get graphicDis():DisplayObject
		{
			return _graphicDis;
		}
		
		public function set graphicDis(value:DisplayObject):void
		{
			_graphicDis = value;
		}
		
		protected var _parent:DisplayObjectContainer;
		/**所属显示对象(显示对象容器)*/
		public function get parent():DisplayObjectContainer
		{
			return _parent;
		}
		
		public function set parent(value:DisplayObjectContainer):void
		{
			if(_parent != value)
			{
				_parent = value;
			}
			//--------------------------------------------------------------
			if(_graphicDis)
			{
				if(_visible)//看不见还添加个毛呀...
				{
					if(_parent.numChildren > _depthIndex)
					{
						_parent.addChildAt(_graphicDis,_depthIndex);
					}
					else
					{
						_parent.addChild(_graphicDis);
					}
				}
			}
		}
		
		/**
		 * 是否与某个点发生碰撞
		 * @param $p
		 */
		public function hitPoint($p:Point):Boolean
		{
			return false;
		}
		
		/**
		 * 是否与某个矩形发生碰撞
		 * @param $p
		 */
		public function hitRect($rect:Rectangle):Boolean
		{
			return false;
		}
		
		protected var _enableShadow:Boolean = false;
		/**
		 * 是否启用动态阴影
		 */
		public function get enableShadow():Boolean
		{
			return _enableShadow;
		}
		
		public function set enableShadow(value:Boolean):void
		{
			_enableShadow = value;
		}
		
		protected var _isDrawShadow:Boolean = true;
		/**
		 * 是否渲染动态阴影(即使启用,但不一定会渲染哦...)
		 */
		public function get isDrawShadow():Boolean
		{
			return _isDrawShadow;
		}
		
		public function set isDrawShadow(value:Boolean):void
		{
			_isDrawShadow = value;
		}
		
		
		/**
		 * 是否需要绘制
		 */	
		protected var _needRender:Boolean = true;
		/**
		 * 是否需要绘制
		 */
		public function get needRender():Boolean
		{
			return _needRender;
		}
		
		public function set needRender(value:Boolean):void
		{
			_needRender = value;
			setParentValue(_needRender && _visible);
		}
		
		protected function setParentValue(value:Boolean):void
		{
			//不在可视范围内,就移除显示列表吧...
			if(_parent && _graphicDis)
			{
				if(value)
				{
					if(_parent)
					{
						if(_parent.numChildren > _depthIndex)
						{
							if(_graphicDis.parent != _parent)
							{
								_parent.addChildAt(_graphicDis,_depthIndex);//这个函数费性能，不要重复执行。
							}
							else
							{
								_parent.setChildIndex(_graphicDis,_depthIndex);
							}
						}
						else
						{
							if(_graphicDis.parent != _parent)
							{
								_parent.addChild(_graphicDis);
							}
							_depthIndex = _parent.numChildren - 1;
						}
					}
				}
				else
				{
					if(_parent == _graphicDis.parent)
					{
						_parent.removeChild(_graphicDis);
						_depthIndex = 0;
					}
				}
			}
		}
		
		//不收全局混合模式开关影响的，强制设置混合模式。
		protected var _forceEnableBlendMode:Boolean = false;
		
		public function get forceEnableBlendMode():Boolean
		{
			return _forceEnableBlendMode;
		}
		
		public function set forceEnableBlendMode($value:Boolean):void
		{
			_forceEnableBlendMode = $value;
		}
		
		/**销毁显示对象 */
		public function destroy():void
		{
			dispose();
		}
		
		//*******************************************IDisplayDrawable接口基本参数*******************************************
		private var _runTickCnt:uint = 0;
		private function onTick(gapTm:uint):void
		{
			_runTickCnt++;
			if(_runTickCnt & 1 || GlobalConfig2D.heightFramRender)
			{
				run(gapTm);
			}
		}
		
		/**显示数据跑起来 */
		public function run(gapTm : uint):void
		{
			
		}
		
		/**显示渲染接口 */
		public function draw(iBmppDrawable:IBitmapDrawable):void
		{
			
		}
		
		//重置----------------------------------------------------------------------------------------
		/**
		 * @private
		 * 重置
		 * 
		 */	
		public function reSet($parameters:Array):void
		{
			//改变唯一ID
			_uniqueID = (++UNIQUE_ID);
			
			disposing = false;
			usable = true;
			updateNow = true;
		}
		
		//释放----------------------------------------------------------------------------------------
		/**
		 * @private
		 * 释放
		 * 
		 */	
		public function dispose():void
		{
			stopRender();
			//
			id = -1;
			name = null;
			type = null;
			_depth = 0;
			
			disposing=false;
			usable = false;
			_visible = true;
			_isInViewDistance = false;
			updateNow = false;
			_mouseEnabled = false;
			_needRender = true;
			_forceEnableBlendMode = false;
			
			_rotation = 0;
			_parent = null;
			_depthIndex = 0;
			_isDrawShadow = false;
			_enableShadow = false;
			_logicAngle = 0;
			_scaleX = 0;
			_scaleY = 0;
			_alpha = 1;
			_offsetX = 0;
			_offsetY = 0;
			_x = 0;
			_y = 0;
//			_graphicDis = null;
		}
		
		
		public function UIBaseObj2D() 
		{
			//获取唯一ID,注意这里不要调用reSet
			//reSet(null);
		}
	}
}