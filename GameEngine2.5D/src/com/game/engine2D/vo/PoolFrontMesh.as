package com.game.engine2D.vo
{
	
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import away3d.core.base.data.OverrideMaterialProps;
	import away3d.entities.EntityLayerType;
	import away3d.entities.Mesh;
	
	/**
	 * PoolZoneMesh缓存池适用于2.5D
	 * @author guoqing.wen
	 * 
	 */
	public class PoolFrontMesh extends Mesh implements IInstancePoolClass
	{
		static private var _pool:InstancePool = new InstancePool("SceneZoneMesh_pool", 1000);
		static private var _geometrySize:Number = 100;
		static private var _geometryPlane:PlaneFrameGeometry = new PlaneFrameGeometry(_geometrySize, _geometrySize, false);
		
		public var userData:*;
		private var _posScale:Point = new Point(1,1);
		private var _posGeometryScale:Point = new Point(1,1);
		private var _posGeometry:Point = new Point();
		private var _isDisposed:Boolean = false;
		private var _isDestroyed:Boolean;
		
		
		public function PoolFrontMesh()
		{
			super(_geometryPlane, null);
			this.overrideMaterialProps ||= new OverrideMaterialProps();
			this.overrideMaterialProps.prependedUVTransform = new Matrix();
			reSet(null);
		}
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
		
		override public function set scaleX(val:Number):void
		{
			_posScale.x = val;
		}
		
		override public function set scaleY(val:Number):void
		{
			_posScale.y = val;
		}
		
		override public function get scaleX():Number
		{
			return _posScale.x;
		}
		
		override public function get scaleY():Number
		{
			return _posScale.y;
		}
		
		public function get width():int
		{
			return _posGeometry.x;
		}
		
		public function set width(value:int):void
		{
			if (_posGeometry.x != value)
			{
				setSize(value, _posGeometry.y);
			}
		}
		
		public function get height():int
		{
			return _posGeometry.y;
		}
		
		public function set height(value:int):void
		{
			if (_posGeometry.y != value)
			{
				setSize(_posGeometry.x, value);
			}
		}
		
		public function run():void
		{
			this.visible = (this.material != null);
		}
		
		public function setSize(width:Number, height:Number):void
		{
			_posGeometry.setTo(width, height);
			_posGeometryScale.setTo(_posGeometry.x/_geometrySize, _posGeometry.y/_geometrySize);
			super.scaleX = _posGeometryScale.x*_posScale.x;
			super.scaleY = _posGeometryScale.y*_posScale.y;
		}
		
		override public function set x(val:Number):void
		{
			super.x = val;
		}
		
		override public function get x():Number
		{
			return super.x;
		}
		
		override public function get y():Number
		{
			return -super.y;
		}
		
		override public function set y(val:Number):void
		{
			super.y = -val;
		}
		
		public function reSet($parameters:Array):void
		{
			this.x = this.y = this.z = 0;
			this.material = null;
			this.layerType = EntityLayerType.DEFAULT;
			_isDisposed = false;
		}
		
		public function instanceDestroy():void
		{
			_isDestroyed = true;
			this.dispose();
		}
		
		public function putInPool():void
		{
			_isDisposed = true;
			if (parent)parent.removeChild(this);
			this.material = null;
		}
		
		static public function recycle($pool:PoolFrontMesh):void
		{
			if ($pool)
			{
				_pool.recycleObj($pool);
			}
		}
		
		static public function create():PoolFrontMesh
		{
			return _pool.createObj(PoolFrontMesh) as PoolFrontMesh;
		}
	}
}