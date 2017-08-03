package away3d.ribbon
{
	import away3d.arcane;
	import away3d.bounds.BoundingSphere;
	import away3d.bounds.BoundingVolumeBase;
	import away3d.core.base.Geometry;
	import away3d.core.base.Object3D;
	import away3d.entities.Mesh;
	import away3d.errors.AbstractMethodError;
	import away3d.materials.MaterialBase;
	import away3d.tick.Tick;
	
	use namespace arcane;
	
	public class RibbonBase extends Mesh
	{
		protected var _segmentCount:int;
		protected var _framesForStop:int;
		protected var _isStop:Boolean = true;
		protected var _isStopFinal:Boolean = true;
		protected var _autoUpdate:Boolean;
		protected var _halfHeight:Number;
		
		public function RibbonBase(segmentCount:int, geometry:Geometry, material:MaterialBase=null)
		{
			super(geometry, material);
			_segmentCount = segmentCount;
			if(geometry)
			{
				geometry.isDynmaic = true;
			}
		}
		
		public function get ribbonHeight():Number
		{
			return _halfHeight * 2;
		}
		
		public function set ribbonHeight(value:Number):void
		{
			_halfHeight = value / 2;
		}
		
		public function get isStop():Boolean{ return _isStop; }
		
		private function updateTrail(deltaTime:int):void
		{
			if (_isStopFinal)
				return;
			if (_isStop)
			{
				if (_framesForStop > _segmentCount)
				{
					_isStopFinal = true;
					return;
				}
				_framesForStop++;
			}
			ribbonInternalUpdate(deltaTime);
		}
		
		public function start():void
		{
			_isStopFinal = false;
			_isStop = false;
			
			Tick.instance.addCallBack(updateTrail);
		}
		
		/*
		外部动作停止之后，ribbon动画仍然会持续一小段时间用于收尾
		*/
		public function stop():void
		{
			if(_isStop)return;
			_isStop = true;
			_framesForStop = 0;
			ribbonInternalUpdate(Tick.instance.deltaTime);
			Tick.instance.removeCallBack(updateTrail);
		}
		
		protected function ribbonInternalUpdate(deltaTime:int):void
		{
			throw new AbstractMethodError();
		}
		
		public function get isStopFinal():Boolean
		{
			return _isStopFinal;
		}
		
		override arcane function get isVisible():Boolean
		{
			return !_isStopFinal && super.isVisible;
		}
		
		override protected function getDefaultBoundingVolume():BoundingVolumeBase
		{
			var bounds:BoundingSphere = new BoundingSphere();
			return bounds;
		}
		
		override public function clone():Object3D
		{
			throw new Error("need be override!!!");
			return null;
		}
		
		
		
		override public function dispose():void
		{
			stop();
			super.dispose();
		}
	}
}