package com.game.engine3D.vo
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.core.interfaces.IDisplayObject3D;
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.PoolContainer3D;
	import com.game.engine3D.core.poolObject.PoolEntityContainer3D;
	import com.game.engine3D.scene.render.vo.BaseEntity;
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.scene.render.vo.ISceneCameraTarget;
	import com.game.engine3D.scene.render.vo.VolumeBounds;
	import com.game.engine3D.utils.CallBackUtil;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.utils.Matrix3DUtil;
	
	import flash.display.BlendMode;
	import flash.geom.Matrix3D;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.core.math.MathConsts;
	import away3d.core.math.Matrix3DUtils;
	import away3d.tick.Tick;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	/**
	 *
	 * 基本3D元素模型（实现了池接口）
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:26:37
	 *
	 */
	public class BaseObj3D implements IInstancePoolClass, IDisplayObject3D, IFrameRender,ISceneCameraTarget
	{
		//唯一ID(注意用Number而不要用int)--------------------------------------------------------------------
		/**
		 * 全局计数的唯一ID
		 */
		public static var UNIQUE_ID : Number = 0;
		/** 参照坐标 **/
		private static var _originalDirection : Vector3D = new Vector3D(0, 0, -1);
		private static var _tempDirection : Vector3D = new Vector3D();
		/**
		 * 唯一ID
		 */
		private var _uniqueID : Number = 0;
		protected var _graphicDis : ObjectContainer3D;
		protected var _staticGraphicDis : ObjectContainer3D;
		protected var _parent : ObjectContainer3D;
		protected var _visible : Boolean;
		protected var _disposing : Boolean;
		protected var _usable : Boolean;
		/**
		 * 是否可以移除和回收
		 */
		public var canRemoved : Boolean;
		//最基本的属性--------------------------------------------------------------------
		/**
		 * ID
		 */
		public var id : Number;
		/**
		 * 名称
		 */
		public var name : String;
		/**
		 * 类型
		 */
		public var type : String;
		/**
		 * 处于遮挡区域时是否显示半透效果
		 */	
		public var enableMask:Boolean = false;
		
		protected var _data : Object;
		protected var _sceneName : String = null;
		/**
		 * 附着地面
		 */
		private var _clingGroundCalculate : Function = null;

		/**同步到的目标信息*/
		private var _syncTarget : BaseObj3D;
		/**被同步的信息组*/
		private var _syncInfos : Dictionary;
		protected var _position : Vector3D;
		protected var _scale : Vector3D;
		protected var _rotation : Vector3D;
		protected var _graphicRotation : Vector3D;
		protected var _offset : Vector3D;
		protected var _showPosition : Vector3D;
		protected var _showRotation : Vector3D;
		protected var _volumeBounds : VolumeBounds;

		protected var _mouseEnable : Boolean;

		/**
		 * 是否正在渲染
		 */
		protected var _isRendering : Boolean;
		protected var _needRun : Boolean;
		/**
		 * 是否需要判断可视距离
		 * @param value
		 */
		protected var _needInViewDist : Boolean;
		protected var _isInViewDistance : Boolean;
		protected var _attachLimitable : Array;
		protected var _attachDisplayVisible : Dictionary;
		/**
		 * 是否可被渲染限制
		 */
		protected var _renderLimitable : Boolean;
		/**
		 * 互动时间
		 */
		protected var _interactTime : int;
		private var _inViewDistanceChangedCallbackVec : Vector.<CallBackData>;
		private var _disposeCallbackVec : Vector.<CallBackData>;
		private var _renderAnimator : IRenderAnimator;
		
		public var isHiding:Boolean = false;

		public function BaseObj3D(parameters : Array = null)
		{
			super();
			_showPosition = new Vector3D(0, 0, 0, 0);
			_showRotation = new Vector3D(0, 0, 0, 0);
			_position = new Vector3D(0, 0, 0, 0);
			_scale = new Vector3D(1, 1, 1, 0);
			_offset = new Vector3D(0, 0, 0, 0);
			_rotation = new Vector3D(0, 0, 0, 0);
			_graphicRotation = new Vector3D(0, 0, 0, 0);
			reSet(parameters);
		}

		/**
		 * 唯一ID
		 */
		public function get uniqueID() : Number
		{
			return _uniqueID;
		}

		/**
		 * 是否可用(此参数只应在池回收时改变，外部不要改变)
		 */
		public function get usable() : Boolean
		{
			return _usable;
		}

		/**
		 * 是否正在被释放(此参数标识正在被释放的对象)
		 */
		public function get disposing() : Boolean
		{
			return _disposing;
		}

		public function get data() : Object
		{
			return _data;
		}

		public function set data(value : Object) : void
		{
			_data = value;
		}

		public function set position(value : Vector3D) : void
		{
			x = value.x;
			y = value.y;
			z = value.z;
		}

		public function get position() : Vector3D
		{
			return _position;
		}

		public function get transform() : Matrix3D
		{
			if (_graphicDis)
				return _graphicDis.transform;
			return null;
		}

		public function get sceneTransform() : Matrix3D
		{
			if (_graphicDis)
				return _graphicDis.sceneTransform;
			return null;
		}

		//*******************************************IDisplayable接口基本参数*******************************************
		protected var _alpha:Number = 1;
		/**透明度 */
		public function get alpha():Number
		{
			return _alpha;
		}
		public function set alpha(value:Number):void
		{
			_alpha = value;
		}
		
		//这里的设置其实只是一个借口的问题，并没有什么实际用途
		protected var _blendMode:String = BlendMode.NORMAL;
		
		public function get blendMode():String
		{
			return _blendMode;
		}
		public function set blendMode(value:String):void
		{
			_blendMode = value;
		}
		
		/**显示位置X*/
		public function get x() : Number
		{
			return _position.x;
		}

		public function set x(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_position.x != value)
				{
					syncX(value, this);
				}
			}
		}

		public function syncX(value : Number, initiator : BaseObj3D) : void
		{
			if (_graphicDis)
			{
				if (_position.x != value)
				{
					_position.x = value;
					if (_clingGroundCalculate != null)
					{
						_position.y = _clingGroundCalculate(_position.x, _position.z);
					}
					_showPosition.x = _position.x + _offset.x;
					_showPosition.y = _position.y + _offset.y;
					_graphicDis.x = _showPosition.x;
					_graphicDis.y = _showPosition.y;
					if (_staticGraphicDis) {
						_staticGraphicDis.x = _showPosition.x;
						_staticGraphicDis.y = _showPosition.y;
					}
					calculateVolumeBounds();
					syncInfo(initiator);
				}
			}
		}

		/**显示位置Y*/
		public function get y() : Number
		{
			return _position.y;
		}

		public function set y(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_clingGroundCalculate == null)
				{
					if (_position.y != value)
					{
						syncY(value, this);
					}
				}
			}
		}

		public function syncY(value : Number, initiator : BaseObj3D) : void
		{
			if (_graphicDis)
			{
				if (_clingGroundCalculate == null)
				{
					if (_position.y != value)
					{
						_position.y = value;
						_showPosition.y = _position.y + _offset.y;
						_graphicDis.y = _showPosition.y;
						if (_staticGraphicDis) {
							_staticGraphicDis.y = _showPosition.y;
						}
						syncInfo(initiator);
					}
				}
			}
		}

		public function get z() : Number
		{
			return _position.z;
		}

		public function set z(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_position.z != value)
				{
					syncZ(value, this);
				}
			}
		}

		public function syncZ(value : Number, initiator : BaseObj3D) : void
		{
			if (_graphicDis)
			{
				if (_position.z != value)
				{
					_position.z = value;
					if (_clingGroundCalculate != null)
					{
						_position.y = _clingGroundCalculate(_position.x, _position.z);
					}
					_showPosition.y = _position.y + _offset.y;
					_showPosition.z = _position.z + _offset.z;
					_graphicDis.y = _showPosition.y;
					_graphicDis.z = _showPosition.z;
					if (_staticGraphicDis) {
						_staticGraphicDis.y = _showPosition.y;
						_staticGraphicDis.z = _showPosition.z;
					}
					calculateVolumeBounds();
					syncInfo(initiator);
				}
			}
		}

		public function set scale(value : Vector3D) : void
		{
			scaleX = value.x;
			scaleY = value.y;
			scaleZ = value.z;
		}

		public function get scale() : Vector3D
		{
			return _scale;
		}

		public function setScale(value : Number) : void
		{
			scaleX = value;
			scaleY = value;
			scaleZ = value;
		}

		public function set rotation(value : Vector3D) : void
		{
			rotationX = value.x;
			rotationY = value.y;
			rotationZ = value.z;
		}

		public function get rotation() : Vector3D
		{
			return _rotation;
		}

		public function get scaleX() : Number
		{
			return _scale.x;
		}

		public function set scaleX(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_scale.x != value)
				{
					_scale.x = value;
					_graphicDis.scaleX = _scale.x;
					if (_staticGraphicDis) {
						_staticGraphicDis.scaleX = _scale.x;
					}
				}
			}
		}

		public function get scaleY() : Number
		{
			return _scale.y;
		}

		public function set scaleY(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_scale.y != value)
				{
					_scale.y = value;
					_graphicDis.scaleY = _scale.y;
					if (_staticGraphicDis) {
						_staticGraphicDis.scaleY = _scale.y;
					}
				}
			}
		}

		public function get scaleZ() : Number
		{
			return _scale.z;
		}

		public function set scaleZ(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_scale.z != value)
				{
					_scale.z = value;
					_graphicDis.scaleZ = _scale.z;
					if (_staticGraphicDis) {
						_staticGraphicDis.scaleZ = _scale.z;
					}
				}
			}
		}

		public function get rotationX() : Number
		{
			return _rotation.x;
		}

		public function set rotationX(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_rotation.x != value)
				{
					syncRotationX(value, this);
				}
			}
		}

		public function syncRotationX(value : Number, initiator : BaseObj3D) : void
		{
			if (_graphicDis)
			{
				if (_rotation.x != value)
				{
					TweenLite.killTweensOf(_graphicRotation, false, {x: true});
					_rotation.x = value;
					_showRotation.x = _rotation.x;
					if (_clingGroundCalculate != null && _volumeBounds)
					{
						_graphicRotation.x = _showRotation.x;
						calculateVolumeBounds();
					}
					else
					{
						_graphicDis.rotationX = _showRotation.x;
						_graphicRotation.x = _graphicDis.rotationX;
					}
					syncInfo(initiator);
				}
			}
		}

		public function get rotationY() : Number
		{
			return _rotation.y;
		}

		public function set rotationY(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_rotation.y != value)
				{
					syncRotationY(value, this);
				}
			}
		}

		public function syncRotationY(value : Number, initiator : BaseObj3D) : void
		{
			if (_graphicDis)
			{
				if (_rotation.y != value)
				{
					TweenLite.killTweensOf(_graphicRotation, false, {y: true});
					_rotation.y = value;
					_showRotation.y = _rotation.y;
					if (_clingGroundCalculate != null && _volumeBounds)
					{
						_graphicRotation.y = _showRotation.y;
						calculateVolumeBounds();
					}
					else
					{
						_graphicDis.rotationY = _showRotation.y;
						_graphicRotation.y = _graphicDis.rotationY;
					}
					syncInfo(initiator);
				}
			}
		}

		public function get rotationZ() : Number
		{
			return _rotation.z;
		}

		public function set rotationZ(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_rotation.z != value)
				{
					syncRotationZ(value, this);
				}
			}
		}

		public function syncRotationZ(value : Number, initiator : BaseObj3D) : void
		{
			if (_graphicDis)
			{
				if (_rotation.z != value)
				{
					_rotation.z = value;
					_showRotation.z = _rotation.z;
					if (_clingGroundCalculate != null && _volumeBounds)
					{
						_graphicRotation.z = _showRotation.z;
						calculateVolumeBounds();
					}
					else
					{
						_graphicDis.rotationZ = _showRotation.z;
						_graphicRotation.z = _graphicDis.rotationZ;
					}
					syncInfo(initiator);
				}
			}
		}

		/**偏移量X*/
		public function get offsetX() : Number
		{
			return _offset.x;
		}

		public function set offsetX(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_offset.x != value)
				{
					_offset.x = value;
					_showPosition.x = _position.x + _offset.x;
					_graphicDis.x = _showPosition.x;
					if (_staticGraphicDis) {
						_staticGraphicDis.x = _showPosition.x;
					}
					syncInfo(this);
				}
			}
		}

		/**偏移量Y*/
		public function get offsetY() : Number
		{
			return _offset.y;
		}

		public function set offsetY(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_offset.y != value)
				{
					_offset.y = value;
					_showPosition.y = _position.y + _offset.y;
					_graphicDis.y = _showPosition.y;
					if (_staticGraphicDis) {
						_staticGraphicDis.y = _showPosition.y;
					}
					syncInfo(this);
				}
			}
		}

		/**偏移量Z*/
		public function get offsetZ() : Number
		{
			return _offset.z;
		}

		public function set offsetZ(value : Number) : void
		{
			if (_graphicDis)
			{
				if (_offset.z != value)
				{
					_offset.z = value;
					_showPosition.z = _position.z + _offset.z;
					_graphicDis.z = _showPosition.z;
					if (_staticGraphicDis) {
						_staticGraphicDis.z = _showPosition.z;
					}
					syncInfo(this);
				}
			}
		}

		/**所属显示对象(显示对象容器)*/
		public function get parent() : ObjectContainer3D
		{
			return _parent;
		}

		/**所属显示对象(显示对象容器)*/
		public function set parent(value : ObjectContainer3D) : void
		{
			if (_parent == value)
				return;
			_parent = value;
			
			validateGraphic();
		}

		public function get graphicDis() : ObjectContainer3D
		{
			return _graphicDis;
		}

		public function set graphicDis(value : ObjectContainer3D) : void
		{
			if (_graphicDis == value)
				return;
			removeFromGraphic();
			_graphicDis = value;
			validateGraphic();
		}
		
		private function validateGraphic() : void
		{
			if (_isRendering && _parent && _graphicDis && _visible && _isInViewDistance)
			{
				addToGraphic();
			}
			else
			{
				removeFromGraphic();
			}
		}
		
		/**
		 * 获取体积法线。@L.L.M.Sunny
		 * @param minX
		 * @param minZ
		 * @param maxX
		 * @param maxZ
		 * @return
		 *
		 */
		private function getVolumeNormal(minX : Number, minZ : Number, maxX : Number, maxZ : Number) : Vector3D
		{
			var normal : Vector3D = null;
			if (_graphicRotation && _clingGroundCalculate != null)
			{
				normal = new Vector3D();
				var radianY : Number = _graphicRotation.y * MathConsts.DEGREES_TO_RADIANS;
				//求旋转后面区域
				var dist : Number = MathUtil.getDistance(0, 0, minX, minZ);
				var radian : Number = Math.atan2(minZ, minX);
				var dx : Number = Math.cos(radianY + radian);
				var dy : Number = Math.sin(radianY + radian);
				var px1 : Number = _showPosition.x + dist * dx;
				var pz1 : Number = _showPosition.z + dist * dy;
				var py1 : Number = _clingGroundCalculate(px1, pz1);
				//
				dist = MathUtil.getDistance(0, 0, maxX, minZ);
				radian = Math.atan2(minZ, maxX);
				dx = Math.cos(radianY + radian);
				dy = Math.sin(radianY + radian);
				var px2 : Number = _showPosition.x + dist * dx;
				var pz2 : Number = _showPosition.z + dist * dy;
				var py2 : Number = _clingGroundCalculate(px2, pz2);
				//
				dist = MathUtil.getDistance(0, 0, maxX, maxZ);
				radian = Math.atan2(maxZ, maxX);
				dx = Math.cos(radianY + radian);
				dy = Math.sin(radianY + radian);
				var px3 : Number = _showPosition.x + dist * dx;
				var pz3 : Number = _showPosition.z + dist * dy;
				var py3 : Number = _clingGroundCalculate(px3, pz3);
				//求法向量
				var a : Number = py1 * pz2 + py2 * pz3 + py3 * pz1 - py1 * pz3 - py2 * pz1 - py3 * pz2;
				var b : Number = -(px1 * pz2 + px2 * pz3 + px3 * pz1 - px3 * pz2 - px2 * pz1 - px1 * pz3);
				var c : Number = px1 * py2 + px2 * py3 + px3 * py1 - px1 * py3 - px2 * py1 - px3 * py2;
				var d : Number = -(px1 * py2 * pz3 + px2 * py3 * pz1 + px3 * py1 * pz2 - px1 * py3 * pz2 - px2 * py1 * pz3 - px3 * py2 * pz1);
				var e : Number = Math.sqrt(a * a + b * b + c * c);
				var vx : Number = a / e;
				var vy : Number = b / e;
				var vz : Number = c / e;
				//trace(vx.toFixed(1), vy.toFixed(1), vz.toFixed(1));

				var normalX : Number = Math.acos(vz) * MathConsts.RADIANS_TO_DEGREES - 90;
				//var normalY : Number = Math.asin(vy) * 57.33;
				var normalZ : Number = Math.acos(vx) * MathConsts.RADIANS_TO_DEGREES;
				//trace("normal:", normalX.toFixed(1) /*, normalY.toFixed(1)*/, normalZ.toFixed(1));
				normal.setTo(normalX, 0, normalZ);
			}
			return normal;
		}

		/**
		 * 计算体积边界。@L.L.M.Sunny
		 *
		 */
		private function calculateVolumeBounds() : void
		{
			if (_graphicDis && _clingGroundCalculate != null && _volumeBounds)
			{
				var normalLT : Vector3D = getVolumeNormal(_volumeBounds.minX, _volumeBounds.minZ, 0, 0); //左上
				var normalRT : Vector3D = getVolumeNormal(0, _volumeBounds.minZ, _volumeBounds.maxX, 0); //右上
				var normalRB : Vector3D = getVolumeNormal(0, 0, _volumeBounds.maxX, _volumeBounds.maxZ); //右下
				var normalLB : Vector3D = getVolumeNormal(_volumeBounds.minX, 0, 0, _volumeBounds.maxZ); //左下

				var ltxAbs : Number = normalLT.x < 0 ? -normalLT.x : normalLT.x;
				var rtxAbs : Number = normalRT.x < 0 ? -normalRT.x : normalRT.x;
				var rbxAbs : Number = normalRB.x < 0 ? -normalRB.x : normalRB.x;
				var lbxAbs : Number = normalLB.x < 0 ? -normalLB.x : normalLB.x;

				var currXabs : Number = ltxAbs;
				var normalX : Number = normalLT.x;
				if (currXabs > rtxAbs)
				{
					currXabs = rtxAbs;
					normalX = normalRT.x;
				}
				if (currXabs > rbxAbs)
				{
					currXabs = rbxAbs;
					normalX = normalRB.x;
				}
				if (currXabs > lbxAbs)
				{
					currXabs = lbxAbs;
					normalX = normalLB.x;
				}

				var ltzAbs : Number = normalLT.z - 90 < 0 ? 90 - normalLT.z : normalLT.z - 90;
				var rtzAbs : Number = normalRT.z - 90 < 0 ? 90 - normalRT.z : normalRT.z - 90;
				var rbzAbs : Number = normalRB.z - 90 < 0 ? 90 - normalRB.z : normalRB.z - 90;
				var lbzAbs : Number = normalLB.z - 90 < 0 ? 90 - normalLB.z : normalLB.z - 90;

				var currZabs : Number = ltzAbs;
				var normalZ : Number = normalLT.z;
				if (currZabs > rtzAbs)
				{
					currZabs = rtzAbs;
					normalZ = normalRT.z;
				}
				if (currZabs > rbzAbs)
				{
					currZabs = rbzAbs;
					normalZ = normalRB.z;
				}
				if (currZabs > lbzAbs)
				{
					currZabs = lbzAbs;
					normalZ = normalLB.z;
				}

				var volumeMatrix : Matrix3D = new Matrix3D();
				Matrix3DUtil.rotateX(volumeMatrix, normalX, true);
				Matrix3DUtil.rotateZ(volumeMatrix, normalZ, true);
				Matrix3DUtil.rotateY(volumeMatrix, _graphicRotation.y - 90, false);

				var rotations : Vector.<Vector3D> = Matrix3DUtils.decompose(volumeMatrix);
				var tiltAngle : Number = rotations[1].z * MathConsts.RADIANS_TO_DEGREES - 90;
				var rollAngle : Number = -rotations[1].y * MathConsts.RADIANS_TO_DEGREES;
				//trace("rotation:", (rotations[1].x * 57.33).toFixed(1), (rotations[1].y * 57.33).toFixed(1), (rotations[1].z * 57.33).toFixed(1));
				//trace(tiltAngle, rollAngle);

				_graphicDis.rotateTo(0, 0, 0);
				var disMatrix : Matrix3D = _graphicDis.transform;
				Matrix3DUtil.rotateX(disMatrix, tiltAngle, true);
				Matrix3DUtil.rotateZ(disMatrix, rollAngle, true);
				Matrix3DUtil.rotateX(disMatrix, _graphicRotation.x, false);
				Matrix3DUtil.rotateY(disMatrix, _graphicRotation.y, false);
				Matrix3DUtil.rotateZ(disMatrix, _graphicRotation.z, false);
				_graphicDis.transform = disMatrix;
			}
		}

		/**
		 * 设置地面坐标
		 * @param x
		 * @param y
		 */
		public function setGroundXY(x : Number, y : Number) : void
		{
			if(GlobalConfig.use2DMap)//暂时先这么写，因为现在还没有完整的时间去调整坐标系，怕有问题，所以暂时照原样搞，等以后有充足的时间，再来进行重构
			{
				this.x = x;
				this.z = y;
			}
			else
			{
				this.x = x;
				this.z = y;
			}
		}

		public function faceToGround(x : Number, y : Number, angularVelocity : Number = 0.001, minTweenDuration : Number = 0.05, maxTweenDuration : Number = 0.1) : void
		{
			if (_graphicDis)
			{
				if (x == _position.x && y == _position.z)
					return;
				TweenLite.killTweensOf(_graphicRotation, false, {y: true});
				_tempDirection.setTo(x - _position.x, 0, y - _position.z);
				_tempDirection.normalize();
				var rotY : Number = Math.acos(_originalDirection.dotProduct(_tempDirection)) * 180 / Math.PI;
				if (_tempDirection.x > 0)
					rotY = -rotY;
				if (_isRendering && _parent && _isInViewDistance && _visible && angularVelocity > 0)
				{
					var dr : Number = _graphicDis.rotationY - rotY;
					if (dr > 180)
						_graphicDis.rotationY -= 360;
					else if (dr < -180)
						_graphicDis.rotationY += 360;
					dr = _graphicRotation.y - rotY;
					if (dr > 180)
						_graphicRotation.y -= 360;
					else if (dr < -180)
						_graphicRotation.y += 360;
					dr = Math.abs(rotY - _graphicDis.rotationY);
					var duration : Number = dr * angularVelocity;
					if (duration < minTweenDuration)
						duration = minTweenDuration;
					else if (duration > maxTweenDuration)
						duration = maxTweenDuration;
					_rotation.y = rotY;
					TweenLite.to(_graphicRotation, duration, {y: _rotation.y, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateGraphicRotation, onComplete: onUpdateGraphicRotation});
				}
				else
				{
					rotationY = rotY;
				}
			}
		}

		public function turnRoundTo(angle : Number, angularVelocity : Number = 0.001, minTweenDuration : Number = 0.05, maxTweenDuration : Number = 0.1) : void
		{
			if (_graphicDis)
			{
				TweenLite.killTweensOf(_graphicRotation, false, {y: true});
				if (_isRendering && _parent && _isInViewDistance && _visible && angularVelocity > 0)
				{
					var dr : Number = _graphicDis.rotationY - angle;
					if (dr > 180)
						_graphicDis.rotationY -= 360;
					else if (dr < -180)
						_graphicDis.rotationY += 360;
					dr = _graphicRotation.y - angle;
					if (dr > 180)
						_graphicRotation.y -= 360;
					else if (dr < -180)
						_graphicRotation.y += 360;
					dr = Math.abs(angle - _graphicDis.rotationY);
					var duration : Number = dr * angularVelocity;
					if (duration < minTweenDuration)
						duration = minTweenDuration;
					else if (duration > maxTweenDuration)
						duration = maxTweenDuration;
					_rotation.y = angle;
					TweenLite.to(_graphicRotation, duration, {y: _rotation.y, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateGraphicRotation, onComplete: onUpdateGraphicRotation});
				}
				else
				{
					rotationY = angle;
				}
			}
		}

		public function tiltTo(angle : Number, angularVelocity : Number = 0.001, minTweenDuration : Number = 0.05, maxTweenDuration : Number = 0.1) : void
		{
			if (_graphicDis)
			{
				TweenLite.killTweensOf(_graphicRotation, false, {x: true});
				if (_isRendering && _parent && _isInViewDistance && _visible && angularVelocity > 0)
				{
					var dr : Number = _graphicDis.rotationX - angle;
					if (dr > 180)
						_graphicDis.rotationX -= 360;
					else if (dr < -180)
						_graphicDis.rotationX += 360;
					dr = _graphicRotation.x - angle;
					if (dr > 180)
						_graphicRotation.x -= 360;
					else if (dr < -180)
						_graphicRotation.x += 360;
					dr = Math.abs(angle - _graphicDis.rotationX);
					var duration : Number = dr * angularVelocity;
					if (duration < minTweenDuration)
						duration = minTweenDuration;
					else if (duration > maxTweenDuration)
						duration = maxTweenDuration;
					_rotation.x = angle;
					TweenLite.to(_graphicRotation, duration, {x: angle, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateGraphicRotation, onComplete: onUpdateGraphicRotation});
				}
				else
				{
					rotationX = angle;
				}
			}
		}

		protected function onUpdateGraphicRotation() : void
		{
			if (_graphicDis)
			{
				_graphicDis.rotationX = _graphicRotation.x;
				_graphicDis.rotationY = _graphicRotation.y;
				_graphicDis.rotationZ = _graphicRotation.z;

				calculateVolumeBounds();
				syncInfo(this);
			}
		}

		//*******************************************IFrameRender接口基本参数*******************************************
		public function startRender() : void
		{
			if (_isRendering)
				return;
			_isRendering = true;
			validateGraphic();
			if (_needRun)
			{
				Tick.instance.addCallBack(onTick);
			}
		}
		
		public function stopRender() : void
		{
			if (!_isRendering)
				return;
			_isRendering = false;
			validateGraphic();
			Tick.instance.removeCallBack(onTick);
			TweenLite.killTweensOf(_graphicRotation);
			TweenLite.killTweensOf(_graphicDis);
			TweenLite.killTweensOf(this);
		}

		public function setRenderAnimator(value : IRenderAnimator) : void
		{
			if (_renderAnimator)
			{
				_renderAnimator.dispose();
				_renderAnimator = null;
			}
			_renderAnimator = value;
			if (_renderAnimator)
			{
				_renderAnimator.setOwner(this);
			}
		}

		private function onTick(gapTm : uint = 0) : void
		{
			if (!_isRendering)
				return;
		
			run(gapTm);
		}

		/**显示数据跑起来 */
		public function run(gapTm : uint) : void
		{
			if (_renderAnimator)
			{
				_renderAnimator.update();
			}
		}

		private function onSyncObjDispose(obj : BaseObj3D) : void
		{
			removeSyncInfo(obj);
		}

		/**
		 *
		 * @param initiator 发起对象
		 *
		 */
		protected function syncInfo(initiator : BaseObj3D) : void
		{
			if (!_syncInfos)
			{
				return;
			}
			for each (var info : BaseObjSyncInfo in _syncInfos)
			{
				if (info.obj != initiator) //阻止互相同步时循环执行。
				{
					info.syncInfo(_position, _rotation, this);
				}
			}
		}

		public function addSyncInfo(info : BaseObjSyncInfo) : void
		{
			if (!info)
				return;
			if (!_syncInfos)
			{
				_syncInfos = new Dictionary();
			}
			var currInfo : BaseObjSyncInfo = _syncInfos[info.obj];
			if (currInfo)
			{
				if (currInfo.obj is BaseObj3D)
				{
					(currInfo.obj as BaseObj3D)._syncTarget = null;
				}
				if (currInfo.obj is BaseEntity)
				{
					(currInfo.obj as BaseEntity).removeDisposeCallback(onSyncObjDispose);
				}
				currInfo.dispose();
			}
			_syncInfos[info.obj] = info;
			if (info.obj is BaseObj3D)
			{
				(info.obj as BaseObj3D)._syncTarget = this;
			}
			if (info.obj is BaseEntity)
			{
				(info.obj as BaseEntity).addDisposeCallback(onSyncObjDispose);
			}
			syncInfo(this);
		}

		public function removeSyncInfo(obj : Object) : void
		{
			if (!obj)
				return;
			if (!_syncInfos)
				return;
			var info : BaseObjSyncInfo = _syncInfos[obj];
			if (info)
			{
				if (info.obj is BaseObj3D)
				{
					(info.obj as BaseObj3D)._syncTarget = null;
				}
				if (info.obj is BaseEntity)
				{
					(info.obj as BaseEntity).removeDisposeCallback(onSyncObjDispose);
				}
				info.dispose();
				_syncInfos[obj] = null;
				delete _syncInfos[obj];
			}
		}

		public function removeAllSyncInfo() : void
		{
			if (!_syncInfos)
				return;
			for (var obj : Object in _syncInfos)
			{
				var info : BaseObjSyncInfo = _syncInfos[obj];
				if (info.obj is BaseObj3D)
				{
					(info.obj as BaseObj3D)._syncTarget = null;
				}
				if (info.obj is BaseEntity)
				{
					(info.obj as BaseEntity).removeDisposeCallback(onSyncObjDispose);
				}
				info.dispose();
				_syncInfos[obj] = null;
				delete _syncInfos[obj];
			}
		}

		/**
		 * 同步信息到目标
		 * @param target
		 *
		 */
		public function syncPostionTo(target : BaseObj3D, syncHeight : Boolean = false, syncRotation : Boolean = false) : void
		{
			var info : BaseObjSyncInfo = new BaseObjSyncInfo(this, syncHeight, syncRotation);
			target.addSyncInfo(info);
		}

		/**
		 * 解除同步绑定
		 *
		 */
		public function unSyncTarget() : void
		{
			if (_syncTarget)
			{
				if (_syncTarget.usable)
				{
					_syncTarget.removeSyncInfo(this);
				}
				_syncTarget = null;
			}
		}

		public function set mouseEnable(value : Boolean) : void
		{
			_mouseEnable = value;
		}

		/** 是否可以选中 **/
		public function get mouseEnable() : Boolean
		{
			return _mouseEnable;
		}
		
		public function set mouseEnabled(value : Boolean) : void
		{
			_mouseEnable = value;
		}
		
		public function get mouseEnabled() : Boolean
		{
			return _mouseEnable;
		}

		public function set needInViewDist(value : Boolean) : void
		{
			_needInViewDist = value;
		}

		public function get needInViewDist() : Boolean
		{
			return _needInViewDist;
		}

		public function get renderLimitable() : Boolean
		{
			return _renderLimitable;
		}

		public function set renderLimitable(value : Boolean) : void
		{
			_renderLimitable = value;
		}

		public function get interactTime() : int
		{
			return _interactTime;
		}

		/**
		 * 更新互动时间
		 *
		 */
		public function updateInteractTime() : void
		{
			_interactTime = getTimer();
		}
		
		public function get isClingGround() : Boolean
		{
			return _clingGroundCalculate != null;
		}

		public function set clingGroundCalculate(value : Function) : void
		{
			if (_graphicDis)
			{
				if (_clingGroundCalculate == value)
					return;
				_clingGroundCalculate = value;
				_position.y = 0;
				if (_clingGroundCalculate != null)
				{
					_position.y = _clingGroundCalculate(_position.x, _position.z);
				}
				_showPosition.y = _position.y + _offset.y;
				_graphicDis.y = _showPosition.y;
				if (_staticGraphicDis) {
					//_staticGraphicDis.y = _showPosition.y;
				}

				if (_clingGroundCalculate != null && _volumeBounds)
				{
					calculateVolumeBounds();
				}
				else
				{
					_showRotation.x = _rotation.x;
					_showRotation.y = _rotation.y;
					_showRotation.z = _rotation.z;

					_graphicDis.rotationX = _showRotation.x;
					_graphicDis.rotationY = _showRotation.y;
					_graphicDis.rotationZ = _showRotation.z;

					_graphicRotation.x = _graphicDis.rotationX;
					_graphicRotation.y = _graphicDis.rotationY;
					_graphicRotation.z = _graphicDis.rotationZ;
				}
				syncInfo(this);
			}
		}

		public function dispose() : void
		{
			//销毁回调
			if (_disposeCallbackVec)
			{
				CallBackUtil.exceteCallBackData(this, _disposeCallbackVec);
				_disposeCallbackVec.length = 0;
			}
			if (_inViewDistanceChangedCallbackVec)
			{
				_inViewDistanceChangedCallbackVec.length = 0;
			}
			if (_renderAnimator)
			{
				_renderAnimator.dispose();
				_renderAnimator = null;
			}
			Tick.instance.removeCallBack(onTick);
			id = NaN;
			type = null;
			name = null;
			_isRendering = false;
			_parent = null;
			if (_graphicDis)
			{
				TweenLite.killTweensOf(_graphicDis);
				if (_graphicDis.parent)
					_graphicDis.parent.removeChild(_graphicDis);
				if (_graphicDis is PoolContainer3D)
					PoolContainer3D.recycle(_graphicDis as PoolContainer3D);
				else if (_graphicDis is PoolEntityContainer3D)
					PoolEntityContainer3D.recycle(_graphicDis as PoolEntityContainer3D);
				_graphicDis = null;
			}
			//if (_staticGraphicDis) {
			//	if (_staticGraphicDis.parent) {
			//		_staticGraphicDis.parent.removeChild(_staticGraphicDis);
			//	}
			//	if (_staticGraphicDis is PoolContainer3D) {
			//		PoolContainer3D.recycle(_staticGraphicDis as PoolContainer3D);
			//	} else if (_staticGraphicDis is PoolEntityContainer3D) {
			//		PoolEntityContainer3D.recycle(_staticGraphicDis as PoolEntityContainer3D);
			//	}
			//}
			_staticGraphicDis = null;
			_data = null;
			_sceneName = null;
			_visible = false;
			_needRun = false;
			_isInViewDistance = false;
			if (_attachLimitable)
			{
				_attachLimitable.length = 0;
				_attachLimitable = null;
			}
			_attachDisplayVisible = null;
			_needInViewDist = false;
			_renderLimitable = false;
			_mouseEnable = false;
			_interactTime = 0;
			_clingGroundCalculate = null;
			_showPosition.setTo(0, 0, 0);
			_showRotation.setTo(0, 0, 0);
			_position.setTo(0, 0, 0);
			_offset.setTo(0, 0, 0);
			_scale.setTo(0, 0, 0);
			_rotation.setTo(0, 0, 0);
			TweenLite.killTweensOf(_graphicRotation);
			_graphicRotation.setTo(0, 0, 0);
			_volumeBounds = null;
			if (_syncInfos)
			{
				for (var obj : Object in _syncInfos)
				{
					var info : BaseObjSyncInfo = _syncInfos[obj];
					if (info.obj is BaseEntity)
					{
						(info.obj as BaseEntity).removeDisposeCallback(onSyncObjDispose);
					}
					info.dispose();
					_syncInfos[obj] = null;
					delete _syncInfos[obj];
				}
				_syncInfos = null;
			}
			if (_syncTarget)
			{
				if (_syncTarget.usable)
				{
					_syncTarget.removeSyncInfo(this);
				}
				_syncTarget = null;
			}
			TweenLite.killTweensOf(this);
			_usable = false;
			_disposing = false;
		}
		
		public function instanceDestroy() : void
		{
			dispose();
		}
		
		public function instanceDispose() : void
		{
			dispose();
		}

		public function reSet($parameters : Array) : void
		{
			//改变唯一ID
			_uniqueID = (++UNIQUE_ID);

			id = NaN;
			type = null;
			name = null;
			_disposing = false;
			_usable = true;
			_needInViewDist = false;
			_renderLimitable = false;
			_interactTime = 0;
			_clingGroundCalculate = null;
			canRemoved = true;
			_needRun = false;
			_isRendering = false;
			_visible = true;
			_mouseEnable = false;
			_isInViewDistance = false;
			_attachLimitable = [];
			_attachDisplayVisible = new Dictionary(true);
			_syncInfos = null;
			_sceneName = null;
			_showPosition.setTo(0, 0, 0);
			_showRotation.setTo(0, 0, 0);
			_position.setTo(0, 0, 0);
			_offset.setTo(0, 0, 0);
			_scale.setTo(1, 1, 1);
			_rotation.setTo(0, 0, 0);
			_graphicRotation.setTo(0, 0, 0);
			_volumeBounds = null;
			_renderAnimator = null;
			_alpha = 1.0;
			_zOffset = 0;
		}

		public function get sceneName() : String
		{
			return _sceneName;
		}

		public function set sceneName(value : String) : void
		{
			_sceneName = value;
		}

		public function set volumeBounds(value : VolumeBounds) : void
		{
			if (_volumeBounds == value)
				return;
			_volumeBounds = value;
			if (_graphicDis)
			{
				if (_clingGroundCalculate != null && _volumeBounds)
				{
					calculateVolumeBounds();
				}
				else
				{
					_showRotation.x = _rotation.x;
					_showRotation.y = _rotation.y;
					_showRotation.z = _rotation.z;

					_graphicDis.rotationX = _showRotation.x;
					_graphicDis.rotationY = _showRotation.y;
					_graphicDis.rotationZ = _showRotation.z;

					_graphicRotation.x = _graphicDis.rotationX;
					_graphicRotation.y = _graphicDis.rotationY;
					_graphicRotation.z = _graphicDis.rotationZ;
				}
				syncInfo(this);
			}
		}

		public function get volumeBounds() : VolumeBounds
		{
			return _volumeBounds;
		}

		public function set needRun(value : Boolean) : void
		{
			if (_needRun == value)
				return;
			_needRun = value;
			if (_isRendering)
			{
				if (_needRun)
				{
					Tick.instance.addCallBack(onTick);
				}
				else
				{
					Tick.instance.removeCallBack(onTick);
				}
			}
		}

		public function get isRendering() : Boolean
		{
			return _isRendering;
		}

		/**是否显示 */
		public function get visible() : Boolean
		{
			return _visible;
		}

		/**是否显示 */
		public function set visible(value : Boolean) : void
		{
			if (_visible == value)
				return;
			_visible = value;
			validateGraphic();
		}

		protected function addToGraphic() : void
		{
			if (_parent && _graphicDis)
			{
				if (_graphicDis.parent != _parent)
				{
					_parent.addChild(_graphicDis);
					syncInfo(this);
				}
			}
		}
		
		protected function removeFromGraphic() : void
		{
			if (_graphicDis)
			{
				if (_graphicDis.parent)
				{
					_graphicDis.parent.removeChild(_graphicDis);
					syncInfo(this);
				}
			}
		}

		/**
		 * 是否在可视范围内
		 * @param value
		 */
		public function set isInViewDistance(value : Boolean) : void
		{
			if (_isInViewDistance != value)
			{
				_isInViewDistance = value;
				validateGraphic();
				//当视野状态变化时回调
				CallBackUtil.exceteCallBackData(this, _inViewDistanceChangedCallbackVec);
			}
		}

		public function get isInViewDistance() : Boolean
		{
			return _isInViewDistance;
		}

		/**
		 * 添加进出视野时的回调
		 * @param call
		 *
		 */
		public function addInViewDistanceChangedCallback(value : Function, ... args) : void
		{
			if (!_inViewDistanceChangedCallbackVec)
			{
				_inViewDistanceChangedCallbackVec = new Vector.<CallBackData>();
			}
			CallBackUtil.addCallBackData(_inViewDistanceChangedCallbackVec, value, args);
		}

		/**
		 * 移除进出视野的回调
		 * @param call
		 *
		 */
		public function removeInViewDistanceChangedCallback(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_inViewDistanceChangedCallbackVec, value);
		}

		/**
		 * 添加销毁的回调
		 * @param call
		 *
		 */
		public function addDisposeCallback(value : Function, ... args) : void
		{
			if (!_disposeCallbackVec)
			{
				_disposeCallbackVec = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_disposeCallbackVec, value, args);
		}

		/**
		 * 移除销毁的回调
		 * @param call
		 *
		 */
		public function removeDisposeCallback(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_disposeCallbackVec, value);
		}

		public function get attachLimitable() : Array
		{
			return _attachLimitable;
		}

		public function addAttachLimitable(attachType : String) : void
		{
			var index : int = _attachLimitable.indexOf(attachType);
			if (index < 0)
				_attachLimitable.push(attachType);
		}

		public function internalAttachVisible(attachType : String, visible : Boolean) : void
		{
			if (_attachDisplayVisible[attachType] == visible)
				return;
			_attachDisplayVisible[attachType] = visible;
			setAttachVisible(attachType, visible);
		}

		public function setAttachVisible(attachType : String, visible : Boolean) : void
		{
		}

		public function getAttachVisible(attachType : String) : Boolean
		{
			var index : int = _attachLimitable.indexOf(attachType);
			if (index > -1)
				return _attachDisplayVisible[attachType];
			return true;
		}

		/**销毁显示对象 */
		public function destroy() : void
		{
			dispose();
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
			_pos ||= new Point();
			_pos.setTo(this.x, -this.z);
			return _pos;
		}
		
		public function set pos(value:Point):void
		{
			_pos = value;
		}
		
		protected var _zOffset : int;
		
		final public function get zOffset() : int
		{
			return _zOffset;
		}
		
		public function set zOffset(value : int) : void
		{
			_zOffset = value;
		}
		
		protected var _depth : int;
		
		final public function get depth() : int
		{
			return _depth;
		}
		
		public function set depth(value : int) : void
		{
			_depth = value;
		}
		
		public function set staticGraphicDis(value : ObjectContainer3D) : void {
			this._staticGraphicDis = value;
		}
	}
}
