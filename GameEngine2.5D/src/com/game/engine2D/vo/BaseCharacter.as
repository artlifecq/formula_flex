package com.game.engine2D.vo{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.utils.SceneUtil;
	import com.game.engine3D.scene.render.vo.ISceneCameraTarget;
	
	import flash.geom.Point;

	/**
	 * 场景基本角色  
	 * 说明(只Engine内部关注此说明)： 
	 * 1. piexl坐标为Number, tile坐标为int
	 * 2. tile = int(piexl/tile_width 或 tile_height)
	 * 3. RenderUnit内，渲染时，pXY = Math.round(showXY); 此将影响换装不晃来晃去
	 * 复写只需复写showX,showY即可  其他不可复写
	 * @author Carver
	 */	
	public class BaseCharacter extends BaseObj implements ISceneCameraTarget
	{
		
		//===========================================坐标相关=====================================================
		/*** 像素坐标x*/	
		override public function set x(value:Number):void
		{
			if(_x != value)
			{
				_x = value;//>>0;
				_tile_x = x / SceneConfig.TILE_WIDTH;
				_show_x = (value + _offsetX)>>0;
				updateNow = true;
			}
		}

		override public function set y(value:Number):void
		{
			if(_y != value)
			{
				_y = value;//>>0;
				_tile_y = value / SceneConfig.TILE_HEIGHT;
				_show_y = (value + _offsetY)>>0;
				updateNow = true;
			}
		}

		/**
		 * @private
		 * 逻辑坐标x 
		 */		
		private var _tile_x:int = 0;
		/*** 逻辑坐标x*/	
		public function get tile_x():int{return _tile_x}
		/*** 逻辑坐标x*/	
		public function set tile_x($value:int):void
		{
			x = SceneUtil.getTileXPixel($value);
		}

		/**
		 * @private
		 * 逻辑坐标y
		 */	
		private var _tile_y:int = 0;
		/*** 逻辑坐标y*/	
		public function get tile_y():int{return _tile_y}
		/*** 逻辑坐标y*/	
		public function set tile_y($value:int):void
		{
			y = SceneUtil.getTileYPixel($value);
		}
		
		/*** 显示偏移量x */	
		override public function set offsetX(value:Number):void
		{
			if(_offsetX != value)
			{
				_offsetX = value>>0;
				_show_x = (_x + _offsetX)>>0;
				updateNow = true;
			}
		}
		
		/*** 显示偏移量y */	
		override public function set offsetY(value:Number):void
		{
			if(_offsetY != value)
			{
				_offsetY = value>>0;
				_show_y = (_y + _offsetY)>>0;
				updateNow = true;
			}
		}
		
		/**
		 * @private
		 * 显示像素x
		 */	
		protected var _show_x:Number = 0;
		/**显示像素x*/
		public function get show_x():Number
		{
			return _show_x;
		}
		/**显示像素x*/
		public function set show_x($value:Number):void
		{
			if(_show_x != $value)
			{
				x = $value - _offsetX;
			}
		}
		/**
		 * @private
		 * 显示像素y
		 */	
		protected var _show_y:Number = 0;
		/**显示像素y*/
		public function get show_y():Number
		{
			return _show_y;
		}
		
		/**显示像素y*/
		public function set show_y($value:Number):void
		{
			if(_show_y != $value)
			{
				y = $value - _offsetY;
			}
		}
		
		//===========================================摄像机相关=====================================================
		private var _speed:Number = 0;
		public function get speed():Number
		{
			return _speed;
		}
		
		public function set speed(value:Number):void
		{
			_speed = value;
		}
		
		private var _pos:Point;
		public function get pos():Point
		{
			if(!_pos)
			{
				_pos = new Point(x,y);
			}
			else
			{
				_pos.x = x;
				_pos.y = y;
			}
			return _pos;
		}
		
		public function set pos(value:Point):void
		{
			_pos = value;
		}
		
		public function BaseCharacter(parameters : Array = null){
			super(parameters);
		} 
	}
}