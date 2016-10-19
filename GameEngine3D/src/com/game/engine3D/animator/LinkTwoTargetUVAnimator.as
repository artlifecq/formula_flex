package com.game.engine3D.animator
{
	import flash.geom.Matrix;
	import flash.utils.Dictionary;
	
	import away3d.animators.AnimatorBase;
	import away3d.animators.IAnimator;
	import away3d.containers.ObjectContainer3D;
	import away3d.core.base.data.OverrideMaterialProps;
	import away3d.core.math.Matrix3DUtils;
	import away3d.entities.Mesh;
	import away3d.events.Object3DEvent;
	import away3d.materials.TextureMaterial;
	
	public class LinkTwoTargetUVAnimator extends AnimatorBase implements IAnimator
	{
		private static var transformedMesh:Dictionary = new Dictionary();
		
		private var _fromTarget:ObjectContainer3D;
		private var _toTarget:ObjectContainer3D;
		private var _ownerWidthInvalid:Boolean = true;
		private var _originalWidth:Number;
		private var _meshScaleX:Number;
		private var _uvTransform:Matrix;
		private var _uvSpeed:Number = 1;
		private var _overrideMaterialProps:OverrideMaterialProps;
		public var originalUvScale:Number = 1;
		
		public function LinkTwoTargetUVAnimator()
		{
			super(null);
			
			_uvTransform = new Matrix();
		}

		public function get uvSpeed():Number
		{
			return _uvSpeed;
		}

		public function set uvSpeed(value:Number):void
		{
			_uvSpeed = value;
		}

		public function get originalWidth():Number
		{
			return _originalWidth;
		}

		public function set originalWidth(value:Number):void
		{
			_originalWidth = value;
		}

		public function get toTarget():ObjectContainer3D
		{
			return _toTarget;
		}

		public function set toTarget(value:ObjectContainer3D):void
		{
			if(_toTarget != value)
			{
				if(_toTarget)
					_toTarget.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED,onTargetSceneTransformChanged);
				_toTarget = value;
				if(_toTarget)
					_toTarget.addEventListener(Object3DEvent.SCENETRANSFORM_CHANGED,onTargetSceneTransformChanged);
				_ownerWidthInvalid = true;
			}
		}

		public function get fromTarget():ObjectContainer3D
		{
			return _fromTarget;
		}

		public function set fromTarget(value:ObjectContainer3D):void
		{
			if(_fromTarget != value)
			{
				if(_fromTarget)
					_fromTarget.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED,onTargetSceneTransformChanged);
				_fromTarget = value;
				if(_fromTarget)
					_fromTarget.addEventListener(Object3DEvent.SCENETRANSFORM_CHANGED,onTargetSceneTransformChanged);
				_ownerWidthInvalid = true;
			}
		}

		private function onTargetSceneTransformChanged(e:Object3DEvent):void
		{
			_ownerWidthInvalid = true;
		}
		
		override protected function updateState(time:int):void
		{
			if(_ownerWidthInvalid)
				updateOwnerWidth();
			
			if(_uvSpeed != 0)
			{
				_uvTransform.identity();
				_uvTransform.scale(_meshScaleX * originalUvScale,1);//*7是针对火链资源里的参数进行的特殊处理
				_uvTransform.translate(_uvSpeed * time/1000,0);
				
				var mesh:Mesh = _owner as Mesh;
				
				if(mesh && mesh.material is TextureMaterial)
				{
					_overrideMaterialProps ||= new OverrideMaterialProps();
					if(!mesh.overrideMaterialProps)
						mesh.overrideMaterialProps = _overrideMaterialProps;
					mesh.overrideMaterialProps.prependedUVTransform = _uvTransform;
				}
			}
		}
		
		private function updateOwnerWidth():void
		{
			if(_owner is Mesh && _toTarget && _fromTarget)
			{
				var mesh:Mesh = _owner as Mesh;
				Matrix3DUtils.CALCULATION_VECTOR3D.copyFrom(_fromTarget.scenePosition);
				mesh.parent.x = Matrix3DUtils.CALCULATION_VECTOR3D.x;
				mesh.parent.y = Matrix3DUtils.CALCULATION_VECTOR3D.y;
				mesh.parent.z = Matrix3DUtils.CALCULATION_VECTOR3D.z;				
				mesh.parent.lookAt(_toTarget.scenePosition);
				Matrix3DUtils.CALCULATION_VECTOR3D.decrementBy(_toTarget.scenePosition);
				var meshWidth:Number = Matrix3DUtils.CALCULATION_VECTOR3D.length;
				_meshScaleX = meshWidth/_originalWidth;
				mesh.scaleZ = -_meshScaleX;
				_ownerWidthInvalid = false;
			}
		}
		
		public function clone():IAnimator
		{
			return null;
		}
		
		override public function dispose():void
		{
			if(_fromTarget)
				_fromTarget.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED,onTargetSceneTransformChanged);
			if(_toTarget)
				_toTarget.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED,onTargetSceneTransformChanged);
			_fromTarget = null;
			_toTarget = null;
			super.dispose();
		}
	}
}