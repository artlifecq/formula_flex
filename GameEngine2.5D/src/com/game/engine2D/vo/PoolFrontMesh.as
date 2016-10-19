package com.game.engine2D.vo
{
	
	import com.game.engine2D.interfaces.IZoneMesh;
	import com.game.engine2D.utils.MaterialUtils;
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	
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
	public class PoolFrontMesh extends Mesh implements IPoolClass,IZoneMesh
	{
		static private const poolSize:int = 1000;
		static private var _pool:Pool = new Pool("SceneZoneMesh_pool", poolSize);
		static private var _geometrySize:Number = 100;
		static private var _geometryPlane:PlaneFrameGeometry = new PlaneFrameGeometry(_geometrySize, _geometrySize, false);
		
		public var userData:*;
		private var _posScale:Point = new Point(1,1);
		private var _posGeometryScale:Point = new Point(1,1);
		private var _posGeometry:Point = new Point();
		
		public function PoolFrontMesh()
		{
			super(_geometryPlane, null);
			this.overrideMaterialProps ||= new OverrideMaterialProps();
			this.overrideMaterialProps.prependedUVTransform = new Matrix();
			reSet(null);
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
			setSize(value, height);
		}
		
		public function get height():int
		{
			return _posGeometry.y;
		}
		
		public function set height(value:int):void
		{
			setSize(width, value);
		}
		
		public function run():void
		{
			this.visible = !(this.material == MaterialUtils.default1x1Texture);
		}
		
		public function setSize(width:Number, height:Number):void
		{
			if (_posGeometry.x != width || _posGeometry.y != height)
			{
				_posGeometry.setTo(width, height);
				_posGeometryScale.setTo(_posGeometry.x/_geometrySize, _posGeometry.y/_geometrySize);
			}
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

		override public function get z():Number
		{
			return 0;
			//return -super.z;
		}
		
		override public function set z(val:Number):void
		{
			//super.z = -val;
		}
		
		public function set depth(value:int):void
		{
		}
		
		public function reSet($parameters:Array):void
		{
			this.material = MaterialUtils.default1x1Texture;
			this.layerType = EntityLayerType.DEFAULT;
		}
		
		override public function dispose():void
		{
			this.material = MaterialUtils.default1x1Texture;
		}
		
		public function destory():void
		{
			super.dispose();
		}
		
		public function setPosition():void
		{
			
		}
		
		static public function recycle($pool:PoolFrontMesh):void
		{
			if ($pool)
			{
				if ($pool.parent)$pool.parent.removeChild($pool);
				if (_pool.length >= poolSize)
					$pool.destory();
				_pool.disposeObj($pool);
			}
		}
		
		static public function create(p:Object):PoolFrontMesh
		{
			return _pool.createObj(PoolFrontMesh) as PoolFrontMesh;
		}
	}
}