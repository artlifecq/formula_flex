package   away3d.ribbon
{
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.core.base.CompactSubGeometry;
	import away3d.core.base.Geometry;
	import away3d.core.base.Object3D;
	import away3d.library.assets.AssetType;
	import away3d.materials.MaterialBase;
	import away3d.premium.heap.MemoryItem;
	import away3d.primitives.PlaneGeometry;
	
	
	public class SinglePointRibbon extends RibbonBase 
	{
		protected var _target:ObjectContainer3D;
		private var _positions1:Vector.<Vector3D>;
		private var _positions2:Vector.<Vector3D>;
		
		private var _last:Vector3D = new Vector3D;
		private var _right:Vector3D = new Vector3D;
		private var _look:Vector3D = new Vector3D;
		
		private var _boundPoints:Vector.<Number>;
		
		private var _startPosDirty:Boolean;
		
		public function SinglePointRibbon(target1:ObjectContainer3D, segmentCount:int , height:Number, material:MaterialBase=null) 
		{
			var geometry:Geometry = new PlaneGeometry(0, height, segmentCount, 1, false);
			super(segmentCount, geometry, material);
			
			_target = target1;
			_segmentCount = segmentCount;
			_positions1 = new Vector.<Vector3D>(segmentCount+1);
			_positions2 = new Vector.<Vector3D>(segmentCount+1);
			_halfHeight = height/2;
			for ( var i:int = 0; i < segmentCount+1; i++ )
			{
				_positions1[i] = new Vector3D();
				_positions2[i] = new Vector3D();
			}
			_boundPoints = new Vector.<Number>(6, true);
		}
		
		override public function get assetType():String
		{
			return AssetType.RIBBON;
		}
		
		public function get target():ObjectContainer3D
		{
			return _target;
		}
		
		public function set target(value:ObjectContainer3D):void
		{
			_target = value;
		}
		
		public function get autoUpdate():Boolean { return _autoUpdate;	}
		public function set autoUpdate(value:Boolean):void 
		{
			//从非自动play状态切入到autoplay状态，需要play.
			if(_autoUpdate == value)
				return;
			_autoUpdate = value; 
			if(_autoUpdate)
			{
				start();
			}
			else
			{
				stop();
			}
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
			_segmentCount = value;
			geometry = validateRibbonProperty(_segmentCount, value);
			
		}
		
		protected function validateRibbonProperty(seg:int, height:Number):Geometry
		{
			_segmentCount = seg;
			var geometry:Geometry = new PlaneGeometry(0, height, seg, 1, false);
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
			reset();
			super.start();
		}
		
		protected function reset():void
		{
			var pos:Vector3D = _target ? _target.scenePosition : scenePosition;
			_last.copyFrom(pos);
			for (var i:int = 0; i < _segmentCount+1; i++)
			{
				_positions1[i].copyFrom(_last);
				_positions2[i].copyFrom(_last);
			}
		}
		
		override public function set scene(value:Scene3D):void
		{
			super.scene = value;
			if(scene && scene.view)
				_startPosDirty = true;	
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
		
		override protected function ribbonInternalUpdate(deltaTime:int):void
		{
			if(_startPosDirty)
			{
				_startPosDirty = false;
				reset();
			}
			var pos:Vector3D = _target ? _target.scenePosition : scenePosition;
			_right.copyFrom(pos);
			_right.decrementBy(_last);
			_look.copyFrom(pos);
			if(scene)
				_look.decrementBy(scene.view.camera.scenePosition);
			var up:Vector3D = _look.crossProduct(_right);
			up.normalize();
			
			_last.copyFrom(pos);
			
			var currentVector:Vector3D = _positions1.pop();
			currentVector.copyFrom(pos);
			up.scaleBy(_halfHeight);
			currentVector.incrementBy(up);
			_positions1.unshift( currentVector );
			
			currentVector = _positions2.pop();
			currentVector.copyFrom(pos);
			up.scaleBy( -1);
			currentVector.incrementBy(up);
			_positions2.unshift(currentVector);
			
			var data:MemoryItem = this.geometry.subGeometries[0].vertexData;
			var stride:uint = this.geometry.subGeometries[0].vertexStride;
			
			var dataPos:int;
			
			for ( var i:int; i < _segmentCount+1; i++ )
			{
				var index0:int = i * stride;
				var index1:int = i * stride + (_segmentCount+1)*stride;
				var pos1:Vector3D = _positions1[i];
				var pos2:Vector3D = _positions2[i];
				dataPos = (index0 << 2);
				data.writeFloat(pos1.x, dataPos);
				dataPos = (dataPos + 4);
				data.writeFloat(pos1.y, dataPos);
				dataPos = (dataPos + 4);
				data.writeFloat(pos1.z, dataPos);
				dataPos = (index1 << 2);
				data.writeFloat(pos2.x, dataPos);
				dataPos = (dataPos + 4);
				data.writeFloat(pos2.y, dataPos);
				dataPos = (dataPos + 4);
				data.writeFloat(pos2.z, dataPos);
			}
			CompactSubGeometry(geometry.subGeometries[0]).updateData(data);
		}
		
		override public function clone():Object3D
		{
			var clone:SinglePointRibbon = new SinglePointRibbon(target, segmentCount, ribbonHeight, material);
			clone.autoUpdate = autoUpdate;
			clone.target = target;
			
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