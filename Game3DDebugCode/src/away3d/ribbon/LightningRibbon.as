/**
 *模拟闪电特效 
 */
package   away3d.ribbon
{
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.core.base.CompactSubGeometry;
	import away3d.core.base.Geometry;
	import away3d.core.base.Object3D;
	import away3d.materials.MaterialBase;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.PlaneGeometry;
	
	
	public class LightningRibbon extends RibbonBase 
	{
		protected var _target1:ObjectContainer3D;
		protected var _target2:ObjectContainer3D;
		
		private var _positions1:Vector.<Vector3D>;
		private var _positions2:Vector.<Vector3D>;
		
		private var _right:Vector3D = new Vector3D;
		private var _look:Vector3D = new Vector3D;
		
		private var _boundPoints:Vector.<Number>;
		
		private var _shakeAmp:Number = 100;		
		private var _lastShakeTime:int = -1;
		private var _shakeTimer:int = 100;		// 抖动的时间间隔
		
		private static var tmpVec:Vector3D = new Vector3D;
		/**
		 * 
		 * @param object1	绑定起点
		 * @param object2 绑定终点
		 * @param segmentCount	扭动段数
		 * @param height	宽度
		 * @param material		用到的材质
		 * @param 贴图需要横条的
		 */		
		public function LightningRibbon(object1:ObjectContainer3D, object2:ObjectContainer3D, segmentCount:int , height:Number, material:MaterialBase=null) 
		{
			var geometry:Geometry = new PlaneGeometry(0, height, segmentCount, 1, false);
			geometry.isDynmaic = true;
			super(segmentCount, geometry, material);
			(material as TextureMaterial).animateUVs = true;
			
			_positions1 = new Vector.<Vector3D>(segmentCount+1);
			_positions2 = new Vector.<Vector3D>(segmentCount+1);
			_halfHeight = height/2;
			
			for ( var i:int = 0; i < segmentCount+1; i++ )
			{
				_positions1[i] = new Vector3D();
				_positions2[i] = new Vector3D();
			}
			_target1 = object1;
			_target2 = object2;
			_boundPoints = new Vector.<Number>(6, true);
		}
		
		
		
		public function get target2():ObjectContainer3D
		{
			return _target2;
		}
		
		public function set target2(value:ObjectContainer3D):void
		{
			_target2 = value;
		}
		
		public function get target1():ObjectContainer3D
		{
			return _target1;
		}
		
		public function set target1(value:ObjectContainer3D):void
		{
			_target1 = value;
		}
		
		public function get shakeTimer():int
		{
			return _shakeTimer;
		}
		/**
		 * 
		 * @param value		扭动的间隔事件
		 * 
		 */
		public function set shakeTimer(value:int):void
		{
			_shakeTimer = value;
		}
		
		/**
		 * 
		 * @param object1	绑定起点
		 * @param object2 绑定终点
		 * 
		 */		
		public function setBindPoints(object1:ObjectContainer3D, object2:ObjectContainer3D):void
		{
			_target1 = object1;
			_target2 = object2;
		}
		
		/**
		 * 
		 * @return  抖动幅度
		 * 
		 */		
		public function get shakeAmp():Number
		{
			return _shakeAmp;
		}
		
		public function set shakeAmp(value:Number):void
		{
			_shakeAmp = value;
		}
		
		override public function set ribbonHeight(value:Number):void
		{
			if(value == _halfHeight * 2)
				return;
			if(geometry)
			{
				geometry.dispose();
			}
			geometry = validateRibbonProperty(_segmentCount, value);
		}
		
		public function get segmentCount():int { return _segmentCount; }
		public function set segmentCount(value:int):void
		{
			if(_segmentCount == value)
				return;
			if(geometry)
			{
				geometry.dispose();
			}
			geometry = validateRibbonProperty(_segmentCount, value);
			
		}
		
		protected function validateRibbonProperty(seg:int, height:Number):Geometry
		{
			_segmentCount = seg;
			var geometry:Geometry = new PlaneGeometry(0, height, seg, 1, false);
			geometry.isDynmaic = true;
			_positions1 = new Vector.<Vector3D>(seg+1);
			_positions2 = new Vector.<Vector3D>(seg+1);
			_halfHeight = height/2;
			
			for ( var i:int = 0; i < seg+1; i++ )
			{
				_positions1[i] = new Vector3D();
				_positions2[i] = new Vector3D();
			}
			
			return geometry;
		}
		
		
		override public function start():void
		{
			var pos:Vector3D = _target1 ? _target1.scenePosition : scenePosition;
			for (var i:int = 0; i < _segmentCount+1; i++)
			{
				_positions1[i].copyFrom(pos);
				_positions2[i].copyFrom(pos);
			}
			super.start();
		}
		
		override protected function updateBounds():void
		{
			super.updateBounds();
			var i:int = 0;
			var pos:Vector3D;
			pos = _positions1[0];
			_boundPoints[i++] = pos.x;
			_boundPoints[i++] = pos.y;
			_boundPoints[i++] = pos.z;
			pos = _positions2[_segmentCount];
			_boundPoints[i++] = pos.x;
			_boundPoints[i++] = pos.y;
			_boundPoints[i] = pos.z;
			_bounds.fromVertices(_boundPoints);
			_boundsInvalid = false;
		}
		
		
		
		private static const DirVector:Vector3D = new Vector3D(0, 1, 0);
		override protected function ribbonInternalUpdate(deltaTime:int):void
		{
			var isShake:Boolean = false;
			if(_lastShakeTime < 0 || _lastShakeTime > _shakeTimer)
				isShake = true;
			if( _lastShakeTime > _shakeTimer )
			{
				_lastShakeTime %= _shakeTimer;
				isShake = true;
			}
			
			_lastShakeTime += deltaTime;
			
			if(isShake && _target1 && _target2)
			{
				//position
				var pos1:Vector3D = _target1 ? _target1.scenePosition : scenePosition;
				var pos2:Vector3D = _target2 ? _target2.scenePosition : scenePosition;
				
				var lightingDir:Vector3D = pos2.subtract(pos1);
				var distance:Number = lightingDir.length;
				lightingDir.normalize();
				
				
				//				var cam:Camera3D = scene.view.camera;
				//				var camVector:Vector3D = cam.unproject(0, 0, 0);
				//				camVector.normalize();
				
				var shakeDir:Vector3D = lightingDir.crossProduct(DirVector);
				shakeDir.normalize();			// 抖动方向
				
				
				_right.copyFrom(pos2);
				_right.decrementBy(pos1);
				_look.copyFrom(pos2);
				if(scene)
					_look.decrementBy(scene.view.camera.scenePosition);
				var up:Vector3D = _look.crossProduct(_right);
				up.normalize();
				
				var data:ByteArray = this.geometry.subGeometries[0].vertexData;
				var stride:uint = this.geometry.subGeometries[0].vertexStride;
				
				var i:int;
				
				var pos:Vector3D;
				for(i = 0; i < _segmentCount + 1; i ++)
				{
					// 位置
					pos = _positions1[i];
					pos.copyFrom(pos1);
					tmpVec.copyFrom(lightingDir);
					tmpVec.scaleBy(i / _segmentCount * distance);
					pos.incrementBy( tmpVec );
					
					// 抖动偏移(排除第一个与最后一个点)
					if(i != 0 && i != _segmentCount)
					{
						tmpVec.copyFrom(shakeDir);
						tmpVec.scaleBy( shakeAmp*(Math.random() - 0.5) );
						pos.incrementBy(tmpVec);
					}
					
					//偏移半个宽度
					tmpVec.copyFrom(up);
					tmpVec.scaleBy(_halfHeight);
					pos.incrementBy(tmpVec);
					
					
					//错开2倍的半个宽度
					pos = _positions2[i];
					pos.copyFrom(_positions1[i]);
					tmpVec.scaleBy(-2);
					pos.incrementBy(tmpVec);
				}
				//
				for ( i = 0; i < _segmentCount+1; i++ )
				{
					var index0:int = i * stride;
					var index1:int = i * stride + (_segmentCount+1)*stride;
					pos1 = _positions1[i];
					pos2 = _positions2[i];
					data.position = index0<<2;
					data.writeFloat(pos1.x);
					data.writeFloat(pos1.y);
					data.writeFloat(pos1.z);
					data.position = index1<<2;
					data.writeFloat(pos2.x);
					data.writeFloat(pos2.y);
					data.writeFloat(pos2.z);
				}
				
				CompactSubGeometry(geometry.subGeometries[0]).updateData(data);
				
			}
			
		}
		
		
		
		
		override public function clone():Object3D
		{
			var clone:LightningRibbon = new LightningRibbon(_target1, _target2, segmentCount, ribbonHeight, material);
			clone.shakeAmp = shakeAmp;
			clone.shakeTimer = shakeTimer;
			
			clone.transform = transform;
			clone.pivotPoint = pivotPoint;
			clone.partition = partition;
			if(_bounds)
				clone.bounds = _bounds.clone();
			clone.name = name;
			clone.castsShadows = castsShadows;
			clone.shareAnimationGeometry = shareAnimationGeometry;
			clone.mouseEnabled = this.mouseEnabled;
			clone.mouseChildren = this.mouseChildren;
			clone.overwriteBounds = this.overwriteBounds;
			clone.userMin = this.userMin.clone();
			clone.userMax = this.userMax.clone();
			clone.layerType = this.layerType;
			clone.displayLevel = this.displayLevel;
			clone.zOffset = this.zOffset;
			clone.extra = this.extra;
			if (animator)
				clone.animator = animator.clone();
			
			return clone;
		}	
	}	
}