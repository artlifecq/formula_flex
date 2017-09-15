package com.game.engine3D.scene.render
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.core.poolObject.PoolContainer3D;
	import com.game.engine3D.core.poolObject.PoolEntityContainer3D;
	import com.game.engine3D.scene.render.vo.IRenderUnit3D;
	import com.game.engine3D.scene.render.vo.MaterialPropertyData;
	import com.game.engine3D.scene.render.vo.MethodData;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.scene.render.vo.RenderResourceData;
	import com.game.engine3D.scene.render.vo.RenderUnitChild;
	import com.game.engine3D.scene.render.vo.RenderUnitData3D;
	import com.game.engine3D.scene.render.vo.RenderUnitSyncInfo;
	import com.game.engine3D.scene.render.vo.VolumeBounds;
	import com.game.engine3D.utils.CallBackUtil;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.CallBackData;
	import com.game.engine3D.vo.FadeAlphaRectData;
	import com.game.engine3D.vo.SoftOutlineData;
	
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display3D.Context3DCompareMode;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix3D;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	
	import away3d.animators.AnimatorBase;
	import away3d.animators.IAnimator;
	import away3d.animators.IAnimatorOwner;
	import away3d.animators.SkeletonAnimator;
	import away3d.audio.SoundBox;
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.SkeletonBone;
	import away3d.containers.View3D;
	import away3d.core.base.SubMesh;
	import away3d.core.math.Matrix3DUtils;
	import away3d.core.pick.PickingColliderType;
	import away3d.entities.CompositeMesh;
	import away3d.entities.Entity;
	import away3d.entities.EntityLayerType;
	import away3d.entities.Mesh;
	import away3d.entities.SparticleMesh;
	import away3d.events.MouseEvent3D;
	import away3d.materials.MaterialBase;
	import away3d.materials.TextureMaterial;
	import away3d.materials.lightpickers.LightPickerBase;
	import away3d.materials.methods.EffectMethodBase;
	import away3d.materials.methods.FogMethod;
	import away3d.primitives.CubeGeometry;
	import away3d.utils.Cast;

	/**
	 *
	 * 3D渲染单元
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午1:26:38
	 *
	 */
	public class RenderUnit3D extends BaseObj3D implements IRenderUnit3D
	{
		private static var _pool : InstancePool = new InstancePool("RenderUnit3D", 2000);
		private static var _cnt : int = 0;

		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create(rpd : RenderParamData3D,is25D:Boolean = false) : RenderUnit3D
		{
			_cnt++;
			//利用池生成RenderUnit
			return _pool.createObj(RenderUnit3D, rpd,is25D) as RenderUnit3D;
		}

		public static function recycle(ru : RenderUnit3D) : void
		{
			if (!ru || ru.isInPool)
				return;
			_cnt--;
			//利用池回收RenderUnit
			_pool.recycleObj(ru);
		}

		public static function get cnt() : int
		{
			return _cnt;
		}

		/**
		 * 玻璃效果颜色
		 * @param color
		 *
		 */
		public static function setGlassPassColor(color : uint) : void
		{
			MaterialBase.glassPassColor = color;
		}

		public static var VISIBLE_NEED_ASYNC_LOADED : Boolean = false;
		
		/**
		 * 单次时的最大持续时间
		 */
		public static var ONCE_MAX_DURATION_TIME : int = 10000;
		
		private static var pickDummyMaterial : TextureMaterial = null;

		protected var _renderParamData : RenderParamData3D;
		protected var _renderResourceData : RenderResourceData;
		protected var _renderUnitData : RenderUnitData3D = null;
		
		protected var _drawElements : Vector.<ObjectContainer3D>;
		protected var _animatorElements : Vector.<CompositeMesh>;
		protected var _baseVirtualElements : Vector.<ObjectContainer3D>;
		
		private var _visibleNeedAsyncLoaded : Boolean;
		
		private var _nextRenderParamData : RenderParamData3D;
		private var _nextRenderResourceData : RenderResourceData;
		private var _setVisibleMap : Dictionary;
		
		private var _isElementStatus : Boolean;
		private var _hasSkeletonAnimator : Boolean;
		private var _meshes : Vector.<Mesh>;
		private var _rootObj3ds : Vector.<ObjectContainer3D>;
		private var _childObj3ds : Vector.<ObjectContainer3D>;
		private var _castsShadows : Boolean;
		private var _showBounds : Boolean;
		
		public var useFog : Boolean;

		//各种回调，统一回传参数：	(ru:RenderUnit3D=null)
		//===============================================================================
		private var _addedCallBackList : Vector.<CallBackData>;
		private var _removedCallBackList : Vector.<CallBackData>;
		private var _errorCallBackList : Vector.<CallBackData>;
		private var _playCompleteCallBackList : Vector.<CallBackData>;
		private var _mouseUpCallBackList : Vector.<CallBackData>;
		private var _mouseDownCallBackList : Vector.<CallBackData>;
		private var _mouseOverCallBackList : Vector.<CallBackData>;
		private var _mouseOutCallBackList : Vector.<CallBackData>;
		private var _mouseRightUpCallBackList : Vector.<CallBackData>;
		private var _mouseRightDownCallBackList : Vector.<CallBackData>;
		private var _asyncResourceProgressCallBackList : Vector.<CallBackData>;
		private var _asyncResourceCompleteCallBackList : Vector.<CallBackData>;
		private var _resReady : Boolean = false;
		private var _resSwitch : Boolean = false;
		private var _animator : AnimatorBase;
		/**
		 * @private
		 * 当前状态
		 */
		private var _currentStatus : String = null; //注意这个默认值要给空
		private var _defalutStatus : String = null;
		
		private var _secondStatusGetter : Function = null;
		
		private var _animationTransitionTime : Number = 0;
		/** 动作开始时间 **/
		private var _playToTime : int = 0;
		/**
		 * 到目前为止已经播放的时间 --受播放速度的影响，如果speed为0.5，则时间为_playDuration*0.5
		 */		
		private var _currDurationTime : Number = 0;
		/**
		 * 到目前为止已经播放的时间 
		 */
		private var _playDuration : int = 0;
		/**
		 * 是否播放中
		 */
		private var _playing : Boolean;
		/**
		 * 不可见即完成
		 */
		private var _completeNotInView : Boolean;
		/**
		 * 禁用加载资源逝去时间
		 */
		private var _disableLoadResPastTime : Boolean;
		/**
		 * 禁用单次时的最大持续
		 */
		private var _disableOnceMaxDuration : Boolean;
		private var _animateSpeed : Number;
		/** 玻璃效果 **/
		private var _entityGlass : Boolean;
		/** 残影效果 **/
		private var _entityPhantom : Boolean;
		private var _pickDummyEnable : Boolean;
		private var _pickDummyBindBone : String;

		private var _totalDuration : uint;
		/**
		 * @private
		 * 是否播放完成
		 */
		private var _playComplete : Boolean;
		/**
		 * 播放重复次数
		 * */
		private var _repeat : int = 0;
		/**
		 * 生命周期
		 * */
		private var _lifecycle : int = 0;
		/**
		 * @private
		 * 当前播放次数
		 */
		private var _playCount : int = 0;

//		private var _waitAddUnitList : Vector.<RenderUnitChild>;
		private var _currChildUnitList : Vector.<RenderUnitChild>;

		protected var _compositeMesh : CompositeMesh;
		protected var _parentUnit : RenderUnit3D;
		private var _methodDatas : Vector.<MethodData>;
		//private var _boneChildrenByName : Dictionary;
		private var _softOutlineData : SoftOutlineData;
		//暂时不用了，过段时间删掉。
		private var _depthCompareMode : String = Context3DCompareMode.LESS_EQUAL;
		private var _pickDummy : Mesh;
//		private var _registeredCamera : Camera3D;
		private var _allowCameraAnimator : Boolean;
		private var _playInited : Boolean;
		private var _forceLoad : Boolean;
		//private var _colorTransform : ColorTransform;
		private var _independentColorTransform : ColorTransform;
		private var _independentAnimator : IAnimator;
		private var _shareMaterials : Boolean;
		/** 灯光 **/
		private var _lightPicker : LightPickerBase;
		private var _useLight : Boolean;
		private var _useVolume : Boolean;
		private var _fadeAlphaUrl : String;
		private var _fadeAlphaPriority : int;
		private var _fadeAlphaRect : FadeAlphaRectData;
		private var _independentMaterialName : String;
		private var _textureUrl : String;
		private var _texturePriority : int;
		private var _blendMaterialName : String;
		private var _blendMaskUrl : String;
		private var _blendUrl : String;
		private var _blendBias : Number;
		private var _useIndependentColor : Boolean;
		private var _useIndependentDiffuseColor : Boolean;
		private var _independentDiffuseColor : uint;
		private var _onlyApplyIDColorToMaterial:String;
		
		private var _layerTypeByName : Dictionary;
		private var _visibleByName : Dictionary;
		private var _zOffsetByName : Dictionary;
		private var _shareMaterialProperty : Vector.<MaterialPropertyData>;
		
		private var _is25D:Boolean = false;
		
		private var _validateChildMeshEffect:Boolean = false;

		public function RenderUnit3D(rpd : RenderParamData3D,is25D:Boolean=false)
		{
			super([rpd,is25D]);
			_currChildUnitList = new Vector.<RenderUnitChild>();
			_methodDatas = new Vector.<MethodData>();
		}
		
		override public function set zOffset(value : int) : void
		{
			if (zOffset == value || !_depthEnable)
				return;
			super.zOffset = value;
			validateZoffset();
		}
		
		override public function set y(value : Number) : void
		{
			super.y = value;
			if (_depthEnable && GlobalConfig.use2DMap)
				this.zOffset = GlobalConfig.get2DMapDepth(value);
		}
		
		override public function set alpha(value:Number):void
		{
			if (this._alpha == value)return;
			super.alpha = value;
//			_useIndependentColor = true;
			_independentColorTransform.alphaMultiplier = alpha;
			if (_renderUnitData)
			{
//				trace("alpha   被半透的unit 的类型：\t" + this.type);
				if(alpha < 1)
				{
					_renderUnitData.setIndependentColorTransform(_independentColorTransform);
				}
				else
				{
					_renderUnitData.restoreColor();
				}
			}
		}
		
		override public function set blendMode(value:String):void
		{
			if (this.blendMode == value)return;
			super.blendMode = value;
			if (_renderUnitData)
			{
//				trace("blendMode   被半透的unit 的类型：\t" + this.type);
				_renderUnitData.blendMode = value;
			}
		}
		
		/**
		 * 获取状态
		 *
		 */
		public function get status() : String
		{
			return _currentStatus;
		}

		public function set secondStatusGetter(value : Function) : void
		{
			if (_secondStatusGetter == value)
			{
				return;
			}
			_secondStatusGetter = value;
			validateAnimation();
		}

		public function set defalutStatus(value : String) : void
		{
			if (_defalutStatus == value)
			{
				return;
			}
			_defalutStatus = value;
			if (_drawElements)
			{
				for each (var element : ObjectContainer3D in _drawElements)
				{
					if (element.name == _defalutStatus)
					{
						_isElementStatus = true;
					}
				}
			}
		}

		/**
		 * 资源是否准备完毕
		 */
		public function get resReady() : Boolean
		{
			return _resReady;
		}

		/**
		 * 资源是否切换中
		 */
		public function get resSwitch() : Boolean
		{
			return _resSwitch;
		}

		public function set visibleNeedAsyncLoaded(value : Boolean) : void
		{
			_visibleNeedAsyncLoaded = value;
		}

		public function get animateSpeed() : Number
		{
			return _animateSpeed;
		}

		public function set animateSpeed(value : Number) : void
		{
			if (_animateSpeed == value)
				return;
			_animateSpeed = value;
			var animator : AnimatorBase;
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					animator = null;
					if (animatElement is IAnimatorOwner)
					{
						animator = (animatElement as IAnimatorOwner).animator as AnimatorBase;
					}
					if (animator)
					{
						if (!_hasSkeletonAnimator || (animator is SkeletonAnimator))
						{
							animator.playbackSpeed = _animateSpeed;
						}
						else
						{
							animator.playbackSpeed = 1;
						}
					}
				}
			}
			if (_drawElements)
			{
				for each (var element : ObjectContainer3D in _drawElements)
				{
					animator = null;
					if (element is IAnimatorOwner)
					{
						animator = (element as IAnimatorOwner).animator as AnimatorBase;
					}
					if (animator)
					{
						if (!_hasSkeletonAnimator || (animator is SkeletonAnimator))
						{
							animator.playbackSpeed = _animateSpeed;
						}
						else
						{
							animator.playbackSpeed = 1;
						}
					}
				}
			}
		}

		public function set allowCameraAnimator(value : Boolean) : void
		{
			_allowCameraAnimator = value;
		}

		/**
		 * @private
		 * 换装添加回调
		 * 传回参数：(this)
		 */
		public function setAddedCallBack(value : Function, ... args) : void
		{
			if (!_addedCallBackList)
			{
				_addedCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_addedCallBackList, value, args);
		}

		/**
		 * @private
		 * 移除换装添加回调
		 * 传回参数：(this)
		 */
		public function removeAddedCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_addedCallBackList, value);
		}

		/**
		 * @private
		 * 换装移除回调(dispose方法执行完之前调用)
		 * 传回参数：(this)
		 */
		public function setRemovedCallBack(value : Function, ... args) : void
		{
			if (!_removedCallBackList)
			{
				_removedCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_removedCallBackList, value, args);
		}

		/**
		 * 移除换装移除回调(dispose方法执行完之前调用)
		 */
		public function removeRemovedCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_removedCallBackList, value);
		}

		/**
		 * @private
		 * 换装错误回调
		 * 传回参数：(this)
		 */
		public function setErrorCallBack(value : Function, ... args) : void
		{
			if (!_errorCallBackList)
			{
				_errorCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_errorCallBackList, value, args);
		}

		/**
		 * @private
		 * 移除换装错误回调
		 * 传回参数：(this)
		 */
		public function removeErrorCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_errorCallBackList, value);
		}

		/**
		 * @private
		 * 换装动画播放结束回调
		 * 传回参数：(this)
		 */
		public function setPlayCompleteCallBack(value : Function, ... args) : void
		{
			if (!_playCompleteCallBackList)
			{
				_playCompleteCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_playCompleteCallBackList, value, args);
		}

		/**
		 * 移除换装动画播放结束回调
		 */
		public function removePlayCompleteCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_playCompleteCallBackList, value);
		}
		
		public function setAsyncResourceProgressCall(value : Function, ... args) : void
		{
			_asyncResourceProgressCallBackList ||= new Vector.<CallBackData>;
			CallBackUtil.addCallBackData(_asyncResourceProgressCallBackList, value, args);
		}
		
		public function removeAsyncResourceProgressCall(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_asyncResourceProgressCallBackList, value);
		}
		
		public function setAsyncResourceCompleteCall(value : Function, ... args) : void
		{
			_asyncResourceCompleteCallBackList ||= new Vector.<CallBackData>;
			CallBackUtil.addCallBackData(_asyncResourceCompleteCallBackList, value, args);
		}
		
		public function removeAsyncResourceCompleteCall(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_asyncResourceCompleteCallBackList, value);
		}

		/**
		 * @private
		 * 换装鼠标弹起回调
		 * 传回参数：(this)
		 */
		public function setMouseUpCallBack(value : Function, ... args) : void
		{
			if (!_mouseUpCallBackList)
			{
				_mouseUpCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_mouseUpCallBackList, value, args);
		}

		/**
		 * 移除换装鼠标弹起回调
		 */
		public function removeMouseUpCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_mouseUpCallBackList, value);
		}

		/**
		 * @private
		 * 换装鼠标按下回调
		 * 传回参数：(this)
		 */
		public function setMouseDownCallBack(value : Function, ... args) : void
		{
			if (!_mouseDownCallBackList)
			{
				_mouseDownCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_mouseDownCallBackList, value, args);
		}

		/**
		 * 移除换装鼠标按下回调
		 */
		public function removeMouseDownCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_mouseDownCallBackList, value);
		}

		/**
		 * @private
		 * 换装鼠标划滑过回调
		 * 传回参数：(this)
		 */
		public function setMouseOverCallBack(value : Function, ... args) : void
		{
			if (!_mouseOverCallBackList)
			{
				_mouseOverCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_mouseOverCallBackList, value, args);
		}

		/**
		 * 移除换装鼠标滑过回调
		 */
		public function removeMouseOverCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_mouseOverCallBackList, value);
		}

		/**
		 * @private
		 * 换装鼠标划移出回调
		 * 传回参数：(this)
		 */
		public function setMouseOutCallBack(value : Function, ... args) : void
		{
			if (!_mouseOutCallBackList)
			{
				_mouseOutCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_mouseOutCallBackList, value, args);
		}

		/**
		 * 移除换装鼠标移出回调
		 */
		public function removeMouseOutCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_mouseOutCallBackList, value);
		}

		/**
		 * @private
		 * 换装鼠标右键弹起回调
		 * 传回参数：(this)
		 */
		public function setMouseRightUpCallBack(value : Function, ... args) : void
		{
			if (!_mouseRightUpCallBackList)
			{
				_mouseRightUpCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_mouseRightUpCallBackList, value, args);
		}

		/**
		 * 移除换装鼠标右键弹起回调
		 */
		public function removeMouseRightUpCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_mouseRightUpCallBackList, value);
		}

		/**
		 * @private
		 * 换装鼠标右键按下回调
		 * 传回参数：(this)
		 */
		public function setMouseRightDownCallBack(value : Function, ... args) : void
		{
			if (!_mouseRightDownCallBackList)
			{
				_mouseRightDownCallBackList = new Vector.<CallBackData>;
			}
			CallBackUtil.addCallBackData(_mouseRightDownCallBackList, value, args);
		}

		/**
		 * 移除换装鼠标右键按下回调
		 */
		public function removeMouseRightDownCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_mouseRightDownCallBackList, value);
		}

		override final public function set mouseEnable(value : Boolean) : void
		{
			if (_mouseEnable != value)
			{
				super.mouseEnable = value;
				setMeshPickEnable(_mouseEnable);
			}
		}

		public function set showBounds(value : Boolean) : void
		{
			if (_showBounds == value)
				return;
			_showBounds = value;
			if (_animatorElements)
			{
				for each (var compositeMesh : CompositeMesh in _animatorElements)
				{
					compositeMesh.showBounds = _showBounds;
				}
			}
			if (_meshes)
			{
				for each (var mesh : Mesh in _meshes)
				{
					mesh.showBounds = _showBounds;
				}
			}
			if (_pickDummy)
			{
				_pickDummy.showBounds = _showBounds;
			}
		}

		public function get showBounds() : Boolean
		{
			return _showBounds;
		}

		public function set castsShadows(value : Boolean) : void
		{
			if (_castsShadows == value)
				return;
			_castsShadows = value;
			if (_animatorElements)
			{
				for each (var compositeMesh : CompositeMesh in _animatorElements)
				{
					compositeMesh.castsShadows = _castsShadows;
				}
			}
			if (_meshes)
			{
				for each (var mesh : Mesh in _meshes)
				{
					mesh.castsShadows = _castsShadows;
				}
			}
			if (_childObj3ds)
			{
				for each (var obj:ObjectContainer3D in _childObj3ds)
				{
					if (obj is Mesh)
						Mesh(obj).castsShadows = _castsShadows;
				}
			}
		}

		public function get castsShadows() : Boolean
		{
			return _castsShadows;
		}
		
		override public function set planarRenderLayer(value : uint) : void
		{
			if (_planarRenderLayer == value)
				return;
			_planarRenderLayer = value;
			if (_animatorElements)
			{
				for each (var compositeMesh : CompositeMesh in _animatorElements)
				{
					compositeMesh.planarRenderLayer = value;
				}
			}
			if (_meshes)
			{
				for each (var mesh : Mesh in _meshes)
				{
					mesh.planarRenderLayer = value;
				}
			}
			if (_childObj3ds)
			{
				for each (var obj:ObjectContainer3D in _childObj3ds)
				{
					if (obj is Entity)
						Entity(obj).planarRenderLayer = _planarRenderLayer;
				}
			}
		}

		private function initRenderUnitContent() : void
		{
			if (!_renderUnitData)
				return;
			_hasSkeletonAnimator = _renderUnitData.hasSkeletonAnimator;
			_drawElements = _renderUnitData.drawElements;
			_animatorElements = _renderUnitData.animatorElements;
			_baseVirtualElements = _renderUnitData.baseVirutalElements;
			_meshes = _renderUnitData.meshes;
			_rootObj3ds = _renderUnitData.rootObj3ds;
			_childObj3ds = _renderUnitData.childObj3ds;
			if (GlobalConfig.use2DMap)
			{
//				initChildZoffset();
				validateChildProperties();
			}
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					animatElement.castsShadows = _castsShadows;
					animatElement.planarRenderLayer = _planarRenderLayer;
					animatElement.showBounds = _showBounds;
					animatElement.extra = this;
					animatElement.pickingCollider = PickingColliderType.BOUNDS_ONLY;
					_graphicDis.addChild(animatElement);
				}
			}
			if (_drawElements)
			{
				var skeletonName:String;
				var parentSkeletonName:String;
//				for each (var element : ObjectContainer3D in _drawElements)
//				{
//					if (element.name == _defalutStatus)
//					{
//						_isElementStatus = true;
//					}
//					if (!(element is Mesh))
//					{
//						_graphicDis.addChild(element);
//					}
//					else
//					{
//						skeletonName = _renderResourceData.meshUseForSkeletonName();
//						parentSkeletonName = (_parentUnit && _parentUnit._renderResourceData) ? _parentUnit._renderResourceData.meshUseForSkeletonName() : null;
//						if(!skeletonName || skeletonName == parentSkeletonName)
//						{
//							_graphicDis.addChild(element);
//						}
//						else
//						{
//							//							Log.error(_renderParamData.sourcePath+":"+parentSkeletonName+":"+"蒙皮已经被骨骼引用，不能单独使用！");
//						}
//					}
//				}
				
				for each (var element : ObjectContainer3D in _drawElements)
				{
					if (element.name == _defalutStatus)
					{
						_isElementStatus = true;
					}
					if (!(element is Mesh))
					{
						_graphicDis.addChild(element);
					}
					else
					{
						skeletonName = _renderResourceData.meshUseForSkeletonName();
						parentSkeletonName = (_parentUnit && _parentUnit._renderResourceData) ? _parentUnit._renderResourceData.meshUseForSkeletonName() : null;
						if(!skeletonName || skeletonName == parentSkeletonName)
						{
							_graphicDis.addChild(element);
						}
						else
						{
							//							Log.error(_renderParamData.sourcePath+":"+parentSkeletonName+":"+"蒙皮已经被骨骼引用，不能单独使用！");
						}
					}
				}
				
				/*for each (var element : ObjectContainer3D in _drawElements)
				{
					if (element.name == _defalutStatus)
					{
						_isElementStatus = true;
					}
					if (!_renderResourceData.isSkinMesh || !(element is Mesh))
					{
						_graphicDis.addChild(element);
					}
				}*/
			}
			if (_meshes)
			{
				for each (var mesh : Mesh in _meshes)
				{
					mesh.castsShadows = _castsShadows;
					mesh.planarRenderLayer = _planarRenderLayer;
					mesh.showBounds = _showBounds;
					mesh.extra = this;
					mesh.pickingCollider = PickingColliderType.BOUNDS_ONLY;
				}
			}
			
			if (_staticGraphicDis && _baseVirtualElements) {
				for each(var virtual : ObjectContainer3D in _baseVirtualElements) {
					virtual.extra = this;
					_staticGraphicDis.addChild(virtual);
				}
			}
			
			_renderUnitData.shareMaterials = _shareMaterials;
			_renderUnitData.lightPicker = _useLight ? _lightPicker : null;

			validateIndependentAnimator();
			//默认播放待机动作
//			_animator = _renderUnitData.animator;
//			if (_animator)
//			{
//				_animator.addEventListener(AnimatorEvent.CYCLE_COMPLETE, onAnimationComplete);
//			}
			validateVolume();
			validateAnimation();
			registerEvent();
			setMeshPickEnable(_mouseEnable);
			validateMaterialProperty();
		}

		private function validateChildProperties() : void
		{
			var obj : ObjectContainer3D;
			
			for each (obj in _rootObj3ds)
			{
				if (obj && !_zOffsetByName.hasOwnProperty(obj.name))
				{
					_zOffsetByName[obj.name] = obj.zOffset;
				}
				if (obj is Entity)
				{
					Entity(obj).planarRenderLayer = _planarRenderLayer;
				}
			}
			for each (obj in _childObj3ds)
			{
				if (obj && !_zOffsetByName.hasOwnProperty(obj.name))
				{
					_zOffsetByName[obj.name] = obj.zOffset;
				}
				if (obj is Entity)
				{
					Entity(obj).planarRenderLayer = _planarRenderLayer;
				}
			}
		}
		
		protected function registerEvent() : void
		{
		}

		protected function unregisterEvent() : void
		{
		}
		
		private function validateMaterialProperty() : void
		{
			for each (var propertyData : MaterialPropertyData in _shareMaterialProperty)
			{
				_renderUnitData.setShareMaterial(propertyData);
			}
			_shareMaterialProperty.length = 0;
		}
		
		private function validateZoffset() : void
		{
			var obj : ObjectContainer3D;
			var value : int = this.zOffset + this.depth;
			
			for each (obj in _rootObj3ds)
			{
				if (obj && _zOffsetByName.hasOwnProperty(obj.name))
				{
					obj.zOffset = value + _zOffsetByName[obj.name];
				}
			}
			for each (obj in _childObj3ds)
			{
				if (obj && _zOffsetByName.hasOwnProperty(obj.name))
				{
					obj.zOffset = value + _zOffsetByName[obj.name];
				}
			}
		}

		private function validateEffect() : void
		{
			var obj : ObjectContainer3D;
			if (_rootObj3ds)
			{
				for each (obj in _rootObj3ds)
				{
					if (obj is SparticleMesh)
					{
						validateSparticleMeshEffect(SparticleMesh(obj));
					}
					else if (obj is Mesh) //CompositeMesh,Mesh//
					{
						validateMeshEffect(Mesh(obj));
					}
					else
					{
						validateContainerEffect(obj);
					}
				}
			}
			if (_childObj3ds)
			{
				for each (obj in _childObj3ds)
				{
					if ((GlobalConfig.use2DMap || _validateChildMeshEffect) && obj is Mesh) //CompositeMesh,Mesh//
						validateMeshEffect(Mesh(obj));
					else
						validateContainerEffect(obj);
				}
			}
		}

		private function validateSparticleMeshEffect(mesh : SparticleMesh) : void
		{
			if (!_renderUnitData)
			{
				return;
			}
//			if (!_setVisibleMap || !_setVisibleMap.hasOwnProperty(mesh.name))
//			{
//				return;
//			}
			if (!_layerTypeByName.hasOwnProperty(mesh.name))
			{
				_layerTypeByName[mesh.name] = mesh.layerType;
			}
			var layerType : uint;
			if (_setVisibleMap[mesh.name])
			{
				layerType = getLayerType(mesh.name);
			}
			else
			{
				layerType = 0;
			}
			if (_visible)
			{
				layerType = getLayerType(mesh.name);
			}
			else
			{
				layerType = 0;
			}
			if(_isHiding)
			{
				layerType = 0;
			}
			else
			{
				layerType = getLayerType(mesh.name);
			}
			mesh.layerType = layerType;
		}

		private function validateMeshEffect(mesh : Mesh) : void
		{
			if (!_renderUnitData)
			{
				return;
			}
			if (!_layerTypeByName.hasOwnProperty(mesh.name))
			{
				_layerTypeByName[mesh.name] = mesh.layerType;
			}
			var layerType : uint = getLayerType(mesh.name);
			layerType |= EntityLayerType.POST_GLASS | EntityLayerType.PLANAR_REFLECTION_LAYER;
			if (_entityGlass)
				layerType |= EntityLayerType.GLASS;
			if (_entityPhantom)
				layerType |= EntityLayerType.PHANTOM;
			if (_softOutlineData)
			{
				layerType |= EntityLayerType.OUTLINE_GLOW_LAYER; //EntityLayerType.SOFT_OUTLINE_LAYER//
				mesh.outlineColor = _softOutlineData.color;
				mesh.outlineAlpha = _softOutlineData.alpha;
				mesh.outlineSize = _softOutlineData.size;
				mesh.outlineDrawLevel = _softOutlineData.outlineDrawLevel;
			}
			
			if (_setVisibleMap && _setVisibleMap.hasOwnProperty(mesh.name))
			{
				if (!_setVisibleMap[mesh.name])
				{
					layerType = 0;
				}
			}
			var animatStatus : String;
			//设置状态
			if (_secondStatusGetter == null)
				animatStatus = _currentStatus;
			else
				animatStatus = _secondStatusGetter(_currentStatus);
			if (_visible && (!_isElementStatus || mesh.name == animatStatus))
			{
//				layerType = getLayerType(mesh.name);
			}
			else
			{
				layerType = 0;
			}
			if(_isHiding)
			{
				layerType = 0;
			}
			else
			{
//				layerType = getLayerType(mesh.name);
			}
			mesh.layerType = layerType;
		}
		
		/**
		 * 由美术来确定是否显示出来，EntityLayerType.DEFAULT可能会被勾选掉 L.L.M.Sunny
		 * @param name
		 * @return
		 *
		 */
		public function getLayerType(name : String) : uint
		{
			return uint(_layerTypeByName[name]);
		}
		
		public function getVisible(name : String) : Boolean
		{
			return Boolean(_visibleByName[name]);
		}

		private function validateContainerEffect(obj : ObjectContainer3D) : void
		{
			if (!_renderUnitData)
			{
				return;
			}
//			if (!_setVisibleMap || !_setVisibleMap.hasOwnProperty(obj.name))
//			{
//				return;
//			}
			if (!_visibleByName.hasOwnProperty(obj.name))
			{
				_visibleByName[obj.name] = obj.visible;
			}
			var objVisible : Boolean;
			if (_setVisibleMap[obj.name])
			{
				objVisible = getVisible(obj.name);
			}
			else
			{
				objVisible = false;
			}
			var animatStatus : String;
			//设置状态
			if (_secondStatusGetter == null)
				animatStatus = _currentStatus;
			else
				animatStatus = _secondStatusGetter(_currentStatus);
			if (_visible && (!_isElementStatus || obj.name == animatStatus))
			{
				objVisible = getVisible(obj.name);
			}
			else
			{
				objVisible = false;
			}
			if(_isHiding)
			{
				objVisible = false;
			}
			else
			{
				objVisible = getVisible(obj.name);
			}
			obj.visible = objVisible;
		}

		private function setMeshPickEnable(value : Boolean) : void
		{
			if (!_renderUnitData)
			{
				return;
			}
			var usePickDummy : Boolean = false;
			if (_pickDummyEnable)
			{
				usePickDummy = setUsePickDummy(value);
			}
			if (_drawElements)
			{
				for each (var element : ObjectContainer3D in _drawElements)
				{
					element.mouseEnabled = (value && !usePickDummy);
					if (element.mouseEnabled)
					{
						if (element is Mesh)
						{
							element.addEventListener(MouseEvent3D.MOUSE_UP, handleMouseUpEvent3D);
							element.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
							element.addEventListener(MouseEvent3D.MOUSE_OVER, handlerMouseOverEvent3D);
							element.addEventListener(MouseEvent3D.MOUSE_OUT, handlerMouseOutEvent3D);
							element.addEventListener(MouseEvent3D.RIGHT_MOUSE_UP, handleRightMouseUpEvent3D);
							element.addEventListener(MouseEvent3D.RIGHT_MOUSE_DOWN, handleRightMouseDownEvent3D);
						}
					}
					else
					{
						if (element is Mesh)
						{
							element.removeEventListener(MouseEvent3D.MOUSE_UP, handleMouseUpEvent3D);
							element.removeEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
							element.removeEventListener(MouseEvent3D.MOUSE_OVER, handlerMouseOverEvent3D);
							element.removeEventListener(MouseEvent3D.MOUSE_OUT, handlerMouseOutEvent3D);
							element.removeEventListener(MouseEvent3D.RIGHT_MOUSE_UP, handleRightMouseUpEvent3D);
							element.removeEventListener(MouseEvent3D.RIGHT_MOUSE_DOWN, handleRightMouseDownEvent3D);
						}
					}
				}
			}
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					animatElement.mouseEnabled = (value && !usePickDummy);
					if (animatElement.mouseEnabled)
					{
						animatElement.addEventListener(MouseEvent3D.MOUSE_UP, handleMouseUpEvent3D);
						animatElement.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
						animatElement.addEventListener(MouseEvent3D.MOUSE_OVER, handlerMouseOverEvent3D);
						animatElement.addEventListener(MouseEvent3D.MOUSE_OUT, handlerMouseOutEvent3D);
						animatElement.addEventListener(MouseEvent3D.RIGHT_MOUSE_UP, handleRightMouseUpEvent3D);
						animatElement.addEventListener(MouseEvent3D.RIGHT_MOUSE_DOWN, handleRightMouseDownEvent3D);
					}
					else
					{
						animatElement.removeEventListener(MouseEvent3D.MOUSE_UP, handleMouseUpEvent3D);
						animatElement.removeEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
						animatElement.removeEventListener(MouseEvent3D.MOUSE_OVER, handlerMouseOverEvent3D);
						animatElement.removeEventListener(MouseEvent3D.MOUSE_OUT, handlerMouseOutEvent3D);
						animatElement.removeEventListener(MouseEvent3D.RIGHT_MOUSE_UP, handleRightMouseUpEvent3D);
						animatElement.removeEventListener(MouseEvent3D.RIGHT_MOUSE_DOWN, handleRightMouseDownEvent3D);
					}
				}
			}
		}

		private function setUsePickDummy(value : Boolean) : Boolean
		{
			if (_pickDummy)
			{
				_pickDummy.mouseEnabled = false;
				_pickDummy.hookingJointName = null;
				if (_pickDummy.parent)
				{
					_pickDummy.parent.removeChild(_pickDummy);
				}
				_pickDummy.removeEventListener(MouseEvent3D.MOUSE_UP, handleMouseUpEvent3D);
				_pickDummy.removeEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
				_pickDummy.removeEventListener(MouseEvent3D.MOUSE_OVER, handlerMouseOverEvent3D);
				_pickDummy.removeEventListener(MouseEvent3D.MOUSE_OUT, handlerMouseOutEvent3D);
				_pickDummy.removeEventListener(MouseEvent3D.RIGHT_MOUSE_UP, handleRightMouseUpEvent3D);
				_pickDummy.removeEventListener(MouseEvent3D.RIGHT_MOUSE_DOWN, handleRightMouseDownEvent3D);
				_pickDummy.dispose();
				_pickDummy = null;
			}
			if (value)
			{
				if (!pickDummyMaterial)
				{
					pickDummyMaterial = new TextureMaterial(Cast.asyncTexture(new BitmapData(64, 64, true, 0), true, false, false));
					pickDummyMaterial.blendMode = BlendMode.LAYER;
				}
				var bounds : VolumeBounds = getBounds();
				var width : int = bounds.maxX - bounds.minX;
				var height : int = bounds.maxY - bounds.minY;
				var depth : int = bounds.maxZ - bounds.minZ;
				if (_pickDummyBindBone)
				{
					if (_animatorElements && _animatorElements.length > 0)
					{
						var compositeMesh : CompositeMesh = _animatorElements[0];
						if (compositeMesh)
						{
							_pickDummy = new Mesh(new CubeGeometry(height, width, depth), pickDummyMaterial);
							_pickDummy.hookingJointName = _pickDummyBindBone;
							compositeMesh.addChild(_pickDummy);
						}
					}
					else
					{
						var skeletonBone : SkeletonBone = getBoneByName(_pickDummyBindBone);
						if (skeletonBone)
						{
							_pickDummy = new Mesh(new CubeGeometry(height, width, depth), pickDummyMaterial);
							skeletonBone.addChild(_pickDummy);
						}
					}
				}
				else
				{
					_pickDummy = new Mesh(new CubeGeometry(width, height, depth), pickDummyMaterial);
					_graphicDis.addChild(_pickDummy);
				}
				if (_pickDummy)
				{
					_pickDummy.mouseEnabled = true;
					_pickDummy.showBounds = _showBounds;
					_pickDummy.addEventListener(MouseEvent3D.MOUSE_UP, handleMouseUpEvent3D);
					_pickDummy.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
					_pickDummy.addEventListener(MouseEvent3D.MOUSE_OVER, handlerMouseOverEvent3D);
					_pickDummy.addEventListener(MouseEvent3D.MOUSE_OUT, handlerMouseOutEvent3D);
					_pickDummy.addEventListener(MouseEvent3D.RIGHT_MOUSE_UP, handleRightMouseUpEvent3D);
					_pickDummy.addEventListener(MouseEvent3D.RIGHT_MOUSE_DOWN, handleRightMouseDownEvent3D);
					return true;
				}
			}
			return false;
		}

		public function get pickDummyEnable() : Boolean
		{
			return _pickDummyEnable;
		}

		public function setPickDummyEnable(value : Boolean, bindBone : String = null) : void
		{
			if (_pickDummyEnable == value && _pickDummyBindBone == bindBone)
				return;
			_pickDummyEnable = value;
			_pickDummyBindBone = bindBone;
			setMeshPickEnable(_mouseEnable);
		}

		private function validateVolume() : void
		{
			if (!_drawElements)
				return;
			if (_volumeBounds)
			{
				var bounds : VolumeBounds = getBounds();
				if (bounds)
				{
					_volumeBounds.setTo(bounds.minX, bounds.minY, bounds.minZ, bounds.maxX, bounds.maxY, bounds.maxZ);
				}
			}
		}

		public function setIndependentAnimator(animator : IAnimator) : void
		{
			if (_independentAnimator == animator)
				return;
			_independentAnimator = animator;
			validateIndependentAnimator();
		}

		private function validateIndependentAnimator() : void
		{
			if (!_drawElements)
				return;
			if (_independentAnimator)
			{
				if (_animatorElements)
				{
					for each (var animatElement : CompositeMesh in _animatorElements)
					{
						if (animatElement is IAnimatorOwner)
						{
							(animatElement as IAnimatorOwner).animator = _independentAnimator;
						}
					}
				}
				else
				{
					for each (var element : ObjectContainer3D in _drawElements)
					{
						if (element is IAnimatorOwner)
						{
							(element as IAnimatorOwner).animator = _independentAnimator;
						}
					}
				}
			}
		}

		public function get animator() : AnimatorBase
		{
			return _animator;
		}

		/** 动作 **/
		private function validateAnimation() : void
		{
			if (!_renderUnitData)
			{
				return;
			}
			_animator = null;
			var animatStatus : String;
			//设置状态
			if (_secondStatusGetter == null)
				animatStatus = _currentStatus;
			else
				animatStatus = _secondStatusGetter(_currentStatus);
			_totalDuration = _renderUnitData.getAnimationDuration(animatStatus);
			var offsetTime : Number = NaN;
			if (_playing)
			{
				offsetTime = uint(_currDurationTime) % _totalDuration;
			}
			else if (_playToTime > -1)
			{
				offsetTime = _playToTime;
			}
			if (offsetTime > _totalDuration)
			{
				offsetTime = _totalDuration;
			}
			var activeStatus : String = null;
			var currAnimator : AnimatorBase;
			if (_drawElements)
			{
				for each (var element : ObjectContainer3D in _drawElements)
				{
					currAnimator = null;
					var childAnimatOffsetTime : Number = NaN;
					if (element is IAnimatorOwner)
					{
						currAnimator = (element as IAnimatorOwner).animator as AnimatorBase;
					}
					if (_isElementStatus)
					{
						element.visible = _visible && (!_setVisibleMap.hasOwnProperty(element.name) || _setVisibleMap[element.name]) && element.name == animatStatus;
						if (_isRendering && _visible && _isInViewDistance)
						{
							if (element.visible)
							{
								if (currAnimator)
								{
									currAnimator.start(offsetTime);
									if (_playing)
									{
										CONFIG::GameEngine3D_Debug
											{
												if (_repeat != 0)
												{
													if (currAnimator.looping)
														trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "_应当设置为不循环[no loop]！");
												}
												else
												{
													if (!currAnimator.looping)
														trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "_应当设置为循环[loop]！");
												}
											}
									}
									else
									{
										currAnimator.stop();
									}
								}
							}
							else
							{
								if (currAnimator)
								{
									currAnimator.stop();
								}
							}
						}
						else
						{
							if (currAnimator)
							{
								currAnimator.stop();
							}
						}
						if (currAnimator)
						{
							currAnimator.playbackSpeed = _animateSpeed;
							if (element.visible)
							{
								_animator = currAnimator;
								_totalDuration = _animator.duration;
							}
						}
					}
					else
					{
						if (currAnimator)
						{
							if (currAnimator is SkeletonAnimator)
							{
								if (_isRendering && _visible && _isInViewDistance)
								{
									activeStatus = null;
									if (animatStatus)
									{
										if (currAnimator.animationSet.hasAnimation(animatStatus))
										{
											activeStatus = animatStatus;
										}
										else if (_defalutStatus && currAnimator.animationSet.hasAnimation(_defalutStatus))
										{
											CONFIG::GameEngine3D_Debug
												{
													trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "_没有找到动作_" + animatStatus, "将取默认动作_" + _defalutStatus);
												}
												activeStatus = _defalutStatus;
										}
									}
									if (activeStatus)
									{
										(currAnimator as SkeletonAnimator).play(activeStatus, _animationTransitionTime, offsetTime);
									}
									else
									{
										(currAnimator as SkeletonAnimator).start(offsetTime);
									}
									if (_playing)
									{
										CONFIG::GameEngine3D_Debug
											{
												if (_repeat != 0)
												{
													if (currAnimator.looping)
														trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "_动作_" + currAnimator.name + "_应当设置为不循环[no loop]！");
												}
												else
												{
													if (!currAnimator.looping)
														trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "_动作_" + currAnimator.name + "_应当设置为循环[loop]！");
												}
											}
									}
									else
									{
										currAnimator.stop();
									}
								}
								else
								{
									currAnimator.stop();
								}
								currAnimator.playbackSpeed = _animateSpeed;
								if (_animator)
								{
									if (!(_animator is SkeletonAnimator))
									{
										_animator = currAnimator;
										_totalDuration = _animator.duration;
									}
								}
								else
								{
									_animator = currAnimator;
									_totalDuration = _animator.duration;
								}
							}
							else
							{
								if (_hasSkeletonAnimator)
								{
									if (_isRendering && _visible && _isInViewDistance)
									{
										if (!currAnimator.isPlaying)
										{
											currAnimator.start(0);
										}
									}
									else
									{
										currAnimator.stop();
									}
									currAnimator.playbackSpeed = 1;
								}
								else
								{
									if (_isRendering && _visible && _isInViewDistance)
									{
										currAnimator.start(offsetTime);
										if (element.visible)
										{
											if (_playing)
											{
												CONFIG::GameEngine3D_Debug
													{
														if (_repeat != 0)
														{
															if (currAnimator.looping)
																trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "_应当设置为不循环[no loop]！");
														}
														else
														{
															if (!currAnimator.looping)
																trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "_应当设置为循环[loop]！");
														}
													}
											}
											else
											{
												currAnimator.stop();
											}
										}
										else
										{
											currAnimator.stop();
										}
									}
									else
									{
										currAnimator.stop();
									}
									currAnimator.playbackSpeed = _animateSpeed;
									if (!_animator)
									{
										_animator = currAnimator;
										_totalDuration = _animator.duration;
									}
									childAnimatOffsetTime = offsetTime;
								}
							}
						}
					}
					validateChildrenAnimation(element, childAnimatOffsetTime);
				}
			}
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					currAnimator = null;
					if (animatElement is IAnimatorOwner)
					{
						currAnimator = (animatElement as IAnimatorOwner).animator as AnimatorBase;
					}
					currAnimator = animatElement.animator as AnimatorBase;
					if (currAnimator)
					{
						if (_isRendering && _visible && _isInViewDistance)
						{
							if (currAnimator is SkeletonAnimator)
							{
								if (animatStatus)
								{
									if (currAnimator.animationSet.hasAnimation(animatStatus))
									{
										activeStatus = animatStatus;
									}
									else if (_defalutStatus && currAnimator.animationSet.hasAnimation(_defalutStatus))
									{
										CONFIG::GameEngine3D_Debug
											{
												trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.animatorSourchPath + "_没有找到动作_" + animatStatus, "将取默认动作_" + _defalutStatus);
											}
											activeStatus = _defalutStatus;
									}
								}
								if (activeStatus)
								{
									(currAnimator as SkeletonAnimator).play(activeStatus, _animationTransitionTime, offsetTime);
								}
								else
								{
									(currAnimator as SkeletonAnimator).start(offsetTime);
								}
								CONFIG::GameEngine3D_Debug
									{
										if (_playing)
										{
											if (_repeat != 0)
											{
												if (currAnimator.looping)
													trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.animatorSourchPath + "_动作_" + currAnimator.name + "_应当设置为不循环[no loop]！");
											}
											else
											{
												if (!currAnimator.looping)
													trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.animatorSourchPath + "_动作_" + currAnimator.name + "_应当设置为循环[loop]！");
											}
										}
									}
							}
							else
							{
								currAnimator.start(offsetTime);
								CONFIG::GameEngine3D_Debug
									{
										if (_playing)
										{
											if (_repeat != 0)
											{
												if (currAnimator.looping)
													trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.animatorSourchPath + "_应当设置为不循环[no loop]！");
											}
											else
											{
												if (!currAnimator.looping)
													trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.animatorSourchPath + "_应当设置为循环[loop]！");
											}
										}
									}
							}
							if (!_playing)
							{
								currAnimator.stop();
							}
						}
						else
						{
							currAnimator.stop();
						}
						currAnimator.playbackSpeed = _animateSpeed;
						if (_animator)
						{
							if (!(_animator is SkeletonAnimator))
							{
								_animator = currAnimator;
								_totalDuration = _animator.duration;
							}
						}
						else
						{
							_animator = currAnimator;
							_totalDuration = _animator.duration;
						}
					}
					validateChildrenAnimation(animatElement);
				}
			}
			
			if (_isRendering && _visible && _isInViewDistance)
			{
				if (_playing)
				{
					registerCameraAnimator();
				}
				else
				{
					unregisterCameraAnimator();
				}
			}
			else
			{
				unregisterCameraAnimator();
			}
			//trace("validateAnimation", _renderParamData.sourcePath, _currDurationTime, _totalDuration, offsetTime, getTimer());
		}

		private function validateChildrenAnimation(meshElement : ObjectContainer3D, offsetTime : Number = NaN) : void
		{
			var animatChildren : Array = _renderUnitData.getChildrenWithAnimat(meshElement);
			var childAnimator : AnimatorBase;
			var childElement : ObjectContainer3D;
			for each (childElement in animatChildren)
			{
				childAnimator = null;
				if (childElement is IAnimatorOwner)
				{
					childAnimator = (childElement as IAnimatorOwner).animator as AnimatorBase;
				}
				if (childAnimator)
				{
					if (meshElement.visible)
					{
						if (_isRendering && _visible && _isInViewDistance)
						{
							if (_hasSkeletonAnimator)
							{
								if (!childAnimator.isPlaying)
								{
									childAnimator.start(0);
								}
							}
							else
							{
								childAnimator.start(offsetTime);
								if (_playing)
								{
								}
								else
								{
									childAnimator.stop();
								}
							}
						}
					}
					else
					{
						childAnimator.stop();
					}
				}
			}
		}

		private function registerCameraAnimator() : void
		{
			if (!_allowCameraAnimator)
				return;
//			if (_registeredCamera)
//				return;
			if (!_graphicDis || !_graphicDis.scene || !_graphicDis.scene.view || !_graphicDis.scene.view.camera)
				return;
//			_registeredCamera = _graphicDis.scene.view.camera;
			if (_renderUnitData && _renderUnitData.camera3DAnimators)
			{
				for each (var animator : AnimatorBase in _renderUnitData.camera3DAnimators)
				{
//					_registeredCamera.registerCameraAnimator(animator);
					animator.visible = true;
				}
			}
		}

		private function unregisterCameraAnimator() : void
		{
			//			if (!_registeredCamera)
			//				return;
			if (_renderUnitData && _renderUnitData.camera3DAnimators)
			{
				for each (var animator : AnimatorBase in _renderUnitData.camera3DAnimators)
				{
					//_registeredCamera.unregisterCameraAnimator(animator);
					animator.visible = false;
				}
			}
			//			_registeredCamera = null;
		}

		private function validateGraphic() : void
		{
			if (!_renderResourceData)
				return;
			var graphicDisVisible : Boolean = true;
			if (_visibleNeedAsyncLoaded && !_renderResourceData.isAsyncLoaded)
			{
				graphicDisVisible = false;
			}
			if (_fadeAlphaUrl)
			{
				if (!_renderUnitData.fadeAlphaMethodData)
				{
					graphicDisVisible = false;
				}
			}
			_graphicDis.visible = graphicDisVisible;
		}

		private function onValidateGraphic(resData : RenderResourceData) : void
		{
			CallBackUtil.exceteCallBackData(this, _asyncResourceCompleteCallBackList);
			validateGraphic();
		}

		private function validateProperties() : void
		{
			if (!_renderUnitData)
				return;
			initRenderUnitContent();
			validateEffect();
			validateZoffset();
			_renderUnitData.setMethods(_methodDatas);
			if (_textureUrl)
			{
				_renderUnitData.setIndependentTexture(_textureUrl, _texturePriority, _independentMaterialName);
			}
			if (_blendMaskUrl)
			{
				_renderUnitData.addBlend(_blendMaskUrl, _blendUrl, _blendMaterialName);
				_renderUnitData.blendBias = _blendBias;
			}
			if (_useIndependentColor)
			{
				_renderUnitData.setIndependentColorTransform(_independentColorTransform);
			}
			if (_useIndependentDiffuseColor)
			{
				_renderUnitData.setIndependentDiffuseColor(_independentDiffuseColor,_onlyApplyIDColorToMaterial);
			}
			if (_fadeAlphaUrl)
			{
				_renderUnitData.addFadeAlpha(_fadeAlphaUrl, _fadeAlphaPriority, _fadeAlphaRect, validateGraphic);
				validateGraphic();
			}
			//_renderUnitData.validateMeterials();//不需要了
		}
		
		public function setIndependentTexture(url : String, priority : int, materialName : String = null) : void
		{
			_textureUrl = url;
			_texturePriority = priority;
			_independentMaterialName = materialName;
			if (_renderUnitData)
			{
				_renderUnitData.setIndependentTexture(_textureUrl, _texturePriority, _independentMaterialName);
			}
		}
		
		public function setIndependentMatarial(materialName : String, propertyName : String, value : *) : void
		{
			var propertyData : MaterialPropertyData = new MaterialPropertyData();
			propertyData.materialName = materialName;
			propertyData.propertyName = propertyName;
			propertyData.propertyValue = value;
			if (_renderUnitData)
			{
				_renderUnitData.setShareMaterial(propertyData);
			}
			else
			{
				_shareMaterialProperty.push(propertyData);
			}
		}

		public function restoreTexture() : void
		{
			if (_renderUnitData)
			{
				_renderUnitData.restoreTexture();
			}
			_textureUrl = null;
			_texturePriority = 0;
			_independentMaterialName = null;
		}

		public function set shareMaterials(value : Boolean) : void
		{
			if (_shareMaterials == value)
				return;
			_shareMaterials = value;
			if (_renderUnitData)
			{
				_renderUnitData.shareMaterials = _shareMaterials;
				_renderUnitData.updateMaterials();
			}
		}

		/**
		 * //暂时不用了，过段时间删掉。
		 * @param parent
		 *
		 */
		private function updateGroupMaterials(parent : ObjectContainer3D) : void
		{
			var num : int = parent.numChildren;
			while (num-- > 0)
			{
				var child : ObjectContainer3D = parent.getChildAt(num);
				if (child is Mesh)
				{
					var subMeshes : Vector.<SubMesh> = (child as Mesh).subMeshes;
					var subMaterial : MaterialBase;
					for (var i : int = 0; i < subMeshes.length; i++)
					{
						subMaterial = subMeshes[i].material;
						subMaterial.depthCompareMode = _depthCompareMode;
					}
				}
				else
				{
					updateGroupMaterials(child);
				}
			}
		}

		public function addFadeAlpha(url : String, priority : int, rect : FadeAlphaRectData = null) : void
		{
			if (!url)
				return;
			if (_fadeAlphaUrl == url)
				return;
			_fadeAlphaUrl = url;
			_fadeAlphaPriority = priority;
			_fadeAlphaRect = rect;
			if (_renderUnitData)
			{
				_renderUnitData.addFadeAlpha(_fadeAlphaUrl, _fadeAlphaPriority, _fadeAlphaRect, validateGraphic);
				validateGraphic();
			}
		}
		
		public function removeFadeAlpha() : void
		{
			if (_renderUnitData)
			{
				_renderUnitData.removeFadeAlpha();
			}
			_fadeAlphaUrl = null;
			_fadeAlphaPriority = 0;
			_fadeAlphaRect = null;
		}

		public function setFadeAlphaRect(rect : FadeAlphaRectData) : void
		{
			if (_fadeAlphaRect == rect)
			{
				return;
			}
			_fadeAlphaRect = rect;
			if (_renderUnitData)
			{
				_renderUnitData.setFadeAlphaRect(_fadeAlphaRect);
			}
		}

		public function addMethod(methodData : MethodData) : void
		{
			if (!methodData || !methodData.method)
			{
				return;
			}
			if (!useFog && (methodData.method is FogMethod))
			{
				return;
			}
			if (_methodDatas.indexOf(methodData) == -1)
			{
				_methodDatas.push(methodData);
			}
			if (_renderUnitData)
			{
				_renderUnitData.addMethod(methodData);
			}
		}

		public function removeMethod(methodData : MethodData) : void
		{
			if (_methodDatas.length > 0)
			{
				var index : int = _methodDatas.indexOf(methodData);
				if (index != -1)
				{
					_methodDatas.splice(index, 1);
				}
			}
			if (_renderUnitData)
			{
				_renderUnitData.removeMethod(methodData);
			}
		}

		/**清除所有方法*/
		public function removeAllMethods() : void
		{
			if (_renderUnitData)
			{
				_renderUnitData.removeAllMethods();
			}
			if (_methodDatas)
			{
				_methodDatas.length = 0;
			}
		}

		public function setSoftOutline(data : SoftOutlineData) : void
		{
			if (_softOutlineData == data)
				return;
			_softOutlineData = data;
			validateEffect();
		}

		/**
		 * 这个方法已经过时了
		 * @param value
		 *
		 */
		public function set depthCompareMode(value : String) : void
		{
			if (_depthCompareMode == value)
				return;
			_depthCompareMode = value;
			if (_renderUnitData == null)
				return;
			//_renderUnitData.validateMeterials();
		}

		override public function startRender() : void
		{
			if (_isRendering)
				return;
			super.startRender();

			//trace("startRender", _renderParamData.sourcePath, getTimer());
			loadRes();
			validateAnimation();
		}
		
		override public function stopRender() : void
		{
			if (!_isRendering)
				return;
			super.stopRender();

			validateAnimation();
		}
		
		override public function set isHiding(value:Boolean):void
		{
			if (_isHiding != value)
			{
				super.isHiding = value;
				validateEffect();
			}
		}
		
		override public function set visible(value : Boolean) : void
		{
			if (_visible != value)
			{
				super.visible = value;
				if (_visible)
				{
					loadRes();
				}
				validateAnimation();
				validateEffect();
			}
		}

		override public function set isInViewDistance(value : Boolean) : void
		{
			if (_isInViewDistance != value)
			{
				super.isInViewDistance = value;
				if (_isInViewDistance)
				{
					loadRes();
				}
				validateAnimation();
			}
			if (_completeNotInView && _playInited && !_isInViewDistance)
			{
				callStop();
			}
		}

		/**
		 * 动作序列完成
		 * @param e
		 */
//		private function onAnimationComplete(e : Event) : void
//		{
//			(_animator as AnimatorBase).removeEventListener(AnimatorEvent.CYCLE_COMPLETE, onAnimationComplete);
//			//			if ( _loadAnimationComplete )
//			//				_loadAnimationComplete( this );
//		}

		/**
		 * 鼠标弹起事件
		 * @param e
		 *
		 */
		private function handleMouseUpEvent3D(e : MouseEvent3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseUpCallBackList, e);
		}

		/**
		 * 鼠标按下事件
		 * @param e
		 *
		 */
		private function handleMouseDownEvent3D(e : MouseEvent3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseDownCallBackList, e);
		}

		/**
		 * 鼠标滑过事件
		 * @param e
		 *
		 */
		private function handlerMouseOverEvent3D(e : MouseEvent3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseOverCallBackList, e);
		}

		/**
		 * 鼠标移出事件
		 * @param e
		 *
		 */
		private function handlerMouseOutEvent3D(e : MouseEvent3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseOutCallBackList, e);
		}

		/**
		 * 鼠标右键弹起事件
		 * @param e
		 *
		 */
		private function handleRightMouseUpEvent3D(e : MouseEvent3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseRightUpCallBackList, e);
		}

		/**
		 * 鼠标右键按下事件
		 * @param e
		 *
		 */
		private function handleRightMouseDownEvent3D(e : MouseEvent3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseRightDownCallBackList, e);
		}

		public function get renderParamData() : RenderParamData3D
		{
			return _renderParamData;
		}

		public function get renderUnitData() : RenderUnitData3D
		{
			return _renderUnitData;
		}

		/**
		 * 被遮挡后，是否启用玻璃效果
		 * @param value
		 */
		public function set entityGlass(value : Boolean) : void
		{
			if (_entityGlass == value)
				return;
			_entityGlass = value;
			validateEffect();
		}

		/**
		 * 残影效果
		 * @param value
		 */
		public function set entityPhantom(value : Boolean) : void
		{
			if (_entityPhantom == value)
				return;
			_entityPhantom = value;
			validateEffect();
		}
		
		public function get validateChildMeshEffect():Boolean
		{
			return _validateChildMeshEffect;
		}
		
		public function set validateChildMeshEffect(value:Boolean):void
		{
			_validateChildMeshEffect = value;
		}

		private function onSetRenderResourceData(resData : RenderResourceData) : void
		{
			if (resData)
			{
				if (resData != _renderResourceData || resData.meshSourcePath != _renderParamData.sourcePath || resData.animatorSourcePath != _renderParamData.animatorSourchPath)
				{
					trace("要内存泄漏啦......要内存泄漏啦......要内存泄漏啦......要内存泄漏啦......要内存泄漏啦......");
					return;
				}
				if (resData.isLoaded)
				{
					_resReady = true;
					_resSwitch = false;
					_renderUnitData = SceneRenderCache.getRenderUnitData(resData, this.type, this.id);
					
					validateGraphic();
					validateProperties();
					validateUnitChildren();
					validateAnimation();
					//执行添加回调
					if (_addedCallBackList)
					{
						CallBackUtil.exceteCallBackData(this, _addedCallBackList);
					}
				}
			}
		}

		private function onRenderResourceDataError(resData : RenderResourceData) : void
		{
			//执行错误回调
			if (_errorCallBackList)
			{
				CallBackUtil.exceteCallBackData(this, _errorCallBackList);
				_errorCallBackList.length = 0;
			}
		}

		private function validateUnitChildren() : void
		{
			var len : int = _currChildUnitList.length;
			for (var i : int = len - 1; i >= 0; i--)
			{
				var childData : RenderUnitChild = _currChildUnitList[i];
				if (childData.renderUnit && childData.renderUnit.usable)
				{
					if (childData.compositeIndex > -1 || childData.boneName)
					{
						doWaitAddBone(childData);
					}
					else if (childData.meshIndex > -1 || childData.childName)
					{
						doWaitAddChild(childData);
					}
					else
					{
						doWaitAddUnit(childData);
					}
				}
				else
				{
					removeUnitChildFromList(childData.renderUnit);
				}
			}
		}

		private function addChildDataToList(childData : RenderUnitChild) : void
		{
			_currChildUnitList.push(childData);
			childData.renderUnit.setRemovedCallBack(doUnitChildRemoved, childData);
		}

		/**
		 * 添加单元到合成配件
		 * @param ru
		 * @param boneName
		 * @param compositeIndex
		 *
		 */
		public function addUnitAtComposite(ru : RenderUnit3D, compositeIndex : int = 0, boneName : String = null) : void
		{
			var childData : RenderUnitChild;
			var index : int = getChildDataIndexByUnit(ru);
			if (index < 0)
			{
				childData = new RenderUnitChild(ru, null, boneName, compositeIndex);
				addChildDataToList(childData);
			}
			else
			{
				childData = _currChildUnitList[index];
			}
			if (_resReady && !_resSwitch)
			{
				doWaitAddBone(childData);
			}
		}

		/**
		 * 添加单元到模型挂接
		 * @param ru
		 * @param boneName
		 * @param compositeIndex
		 *
		 */
		public function addUnitAtJoint(ru : RenderUnit3D, childName : String, compositeIndex : int = 0) : void
		{
			var childData : RenderUnitChild;
			var index : int = getChildDataIndexByUnit(ru);
			if (index < 0)
			{
				childData = new RenderUnitChild(ru, childName, null, compositeIndex);
				addChildDataToList(childData);
			}
			else
			{
				childData = _currChildUnitList[index];
			}

			if (resReady)
			{
				doWaitAddBone(childData);
			}
		}

		public function addUnitAtBone(ru : RenderUnit3D, boneName : String) : void
		{
			var childData : RenderUnitChild;
			var index : int = getChildDataIndexByUnit(ru);
			if (index < 0)
			{
				childData = new RenderUnitChild(ru, null, boneName);
				addChildDataToList(childData);
			}
			else
			{
				childData = _currChildUnitList[index];
			}
			
			if (resReady)
			{
				doWaitAddBone(childData);
			}
		}

		private function doAddCompositeUnit(childData : RenderUnitChild, ru : RenderUnit3D) : void
		{
			var element : ObjectContainer3D = null;
			if (ru != this)
			{
				var animatorElements : Vector.<CompositeMesh> = childData.renderUnit._animatorElements;
				element = (animatorElements && childData.meshIndex >= 0 && childData.meshIndex < animatorElements.length) ? animatorElements[childData.meshIndex] : null;
			}
			if (!element)
			{
				var drawElements : Vector.<ObjectContainer3D> = childData.renderUnit._drawElements;
				element = (drawElements && childData.meshIndex >= 0 && childData.meshIndex < drawElements.length) ? drawElements[childData.meshIndex] : null;
			}
			if (element)
			{
				if (element.parent)
				{
					element.parent.removeChild(element);
				}
				element.hookingJointName = null;
				if (_animatorElements && childData.compositeIndex > -1 && childData.compositeIndex < _animatorElements.length)
				{
					var compositeMesh : CompositeMesh = _animatorElements[childData.compositeIndex];
					if (childData.boneName)
					{
						element.hookingJointName = childData.boneName;
						compositeMesh.addChild(element);
					}
					else if (childData.childName)
					{
						element.hookingJointName = childData.childName;
						compositeMesh.addChild(element);
					}
					else
					{
						if (element is Mesh)
						{
							childData.renderUnit._parentUnit = this;
							childData.renderUnit._renderResourceData.meshUseForSkeleton(_renderParamData.animatorSourchPath);
							childData.renderUnit._renderResourceData.isSkinMesh = true;
							childData.renderUnit._compositeMesh = compositeMesh;
							compositeMesh.addUnit(Mesh(element));
							if (ru != this)
							{
								addCompositeMaterials(compositeMesh, ru);
							}
						}
						else
						{
							CONFIG::GameEngine3D_Debug
							{
								trace(GlobalConfig.DEBUG_HEAD + " " + childData.renderUnit.renderParamData.sourcePath + "不是一个有效的蒙皮资源！");
							}
						}
					}
				}
				else
				{
					CONFIG::GameEngine3D_Debug
					{
						trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "使用的动画" + _renderParamData.animatorSourchPath + "不是一个有效的骨骼动画资源！");
					}
				}
			}
			else
			{
				CONFIG::GameEngine3D_Debug
				{
					trace(GlobalConfig.DEBUG_HEAD + " " + childData.renderUnit.renderParamData.sourcePath + "没有可用于添加到合成配件的元素！");
				}
			}
		}

		private function doWaitAddBone(childData : RenderUnitChild) : void
		{
			if (childData.compositeIndex > -1)
			{
				if (_animatorElements && childData.compositeIndex < _animatorElements.length)
				{
					if (childData.renderUnit && childData.renderUnit.usable)
					{
						if (childData.renderUnit.resReady && !childData.renderUnit.resSwitch)
						{
							doAddCompositeUnit(childData, childData.renderUnit);
						}
						else
						{
							childData.renderUnit.setAddedCallBack(doAddCompositeUnit, childData);
						}
					}
				}
				else
				{
					if (childData.renderUnit != this)
					{
						childData.renderUnit.parent = _graphicDis;
					}
					CONFIG::GameEngine3D_Debug
						{
							trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "使用的动画" + _renderParamData.animatorSourchPath + "不是一个有效的骨骼动画资源，将添加到同级层！");
						}
				}
			}
			else
			{
				if (childData.renderUnit && childData.renderUnit.usable)
				{
					var bone : SkeletonBone = getBoneByName(childData.boneName);
					if (bone)
					{
						childData.renderUnit.parent = bone;
					}
					else
					{
						if (childData.renderUnit != this)
						{
							childData.renderUnit.parent = _graphicDis;
						}
						CONFIG::GameEngine3D_Debug
							{
								trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "没有找到或没激活骨骼：" + childData.boneName + "，将添加到同级层！");
							}
					}
				}
			}
		}

		public function addUnitAtChild(ru : RenderUnit3D, childName : String, meshIndex : int = -1) : void
		{
			var childData : RenderUnitChild;
			var index : int = getChildDataIndexByUnit(ru);
			if (index < 0)
			{
				childData = new RenderUnitChild(ru, childName, null, -1, meshIndex);
				addChildDataToList(childData);
			}
			else
			{
				childData = _currChildUnitList[index];
			}
			if (resReady)
			{
				doWaitAddChild(childData);
			}
		}
		
		private function doWaitAddChild(childData : RenderUnitChild) : void
		{
			if (childData.renderUnit && childData.renderUnit.usable)
			{
				if (childData.meshIndex >= 0 && childData.meshIndex < _drawElements.length)
				{
					childData.renderUnit.parent = _drawElements[childData.meshIndex];
				}
				else
				{
					var container : ObjectContainer3D = getChildByName(childData.childName);
					if (container)
					{
						childData.renderUnit.parent = container;
					}
					else
					{
						if (childData.renderUnit != this)
						{
							childData.renderUnit.parent = _graphicDis;
						}
						CONFIG::GameEngine3D_Debug
							{
								trace(GlobalConfig.DEBUG_HEAD + " " + _renderParamData.sourcePath + "没有找到挂节点：" + childData.childName + "，将添加到同级层");
							}
					}
				}
			}
		}

		public function addUnitChild(ru : RenderUnit3D) : void
		{
			var childData : RenderUnitChild;
			var index : int = getChildDataIndexByUnit(ru);
			if (index < 0)
			{
				childData = new RenderUnitChild(ru, null, null);
				addChildDataToList(childData);
			}
			else
			{
				childData = _currChildUnitList[index];
			}
			if (resReady)
			{
				doWaitAddUnit(childData);
			}
		}

		private function doWaitAddUnit(childData : RenderUnitChild) : void
		{
			if (childData.renderUnit != this)
			{
				childData.renderUnit.parent = _graphicDis;
			}
			if (childData.renderUnit.renderParamData.isEffectMethodType)
			{
				if (childData.renderUnit.resReady && !childData.renderUnit.resSwitch)
				{
					doSetUnitChildMethods(childData, childData.renderUnit);
				}
				else
				{
					childData.renderUnit.setAddedCallBack(doSetUnitChildMethods, childData);
				}
			}
		}

		private function doSetUnitChildMethods(childData : RenderUnitChild, ru : RenderUnit3D) : void
		{
			if (childData.renderUnit.resReady && !childData.renderUnit.resSwitch && childData.renderUnit.renderParamData.isEffectMethodType)
			{
				var methodChanged : Boolean = false;
				var renderMethods : Vector.<EffectMethodBase> = childData.renderUnit.renderUnitData.effectMethods;
				var effectMethodMaterialNames : Array = childData.renderUnit.renderParamData.effectMethodMaterialNames;
				for each (var method : EffectMethodBase in renderMethods)
				{
					if (getMethodDataIndexByMethod(method) < 0)
					{
						_methodDatas.push(new MethodData(method, effectMethodMaterialNames));
						methodChanged = true;
					}
				}
				if (methodChanged && _renderUnitData)
				{
					_renderUnitData.setMethods(_methodDatas);
				}
			}
		}

		private function getMethodDataIndexByMethod(method : EffectMethodBase) : int
		{
			var len : int = _methodDatas.length;
			for (var i : int = len - 1; i >= 0; i--)
			{
				var methodData : MethodData = _methodDatas[i];
				if (methodData.method == method)
				{
					return i;
				}
			}
			return -1;
		}

		private function doUnitChildRemoved(childData : RenderUnitChild, ru : RenderUnit3D) : void
		{
			removeUnitChild(ru);
		}

		public function removeUnitChild(ru : RenderUnit3D) : void
		{
			if (!ru)
				return;
			removeUnitChildFromList(ru);
		}

		private function removeUnitChildEffectMethods(ru : RenderUnit3D) : Boolean
		{
			var methodChanged : Boolean = false;
			if (ru.resReady && !ru.resSwitch && ru.renderParamData.isEffectMethodType)
			{
				var renderMethods : Vector.<EffectMethodBase> = ru.renderUnitData.effectMethods;
				var methodIndex : int;
				for each (var method : EffectMethodBase in renderMethods)
				{
					methodIndex = getMethodDataIndexByMethod(method);
					if (methodIndex > -1)
					{
						var methodData : MethodData = _methodDatas[methodIndex];
						_methodDatas.splice(methodIndex, 1);
						methodChanged = true;
					}
				}
			}
			return methodChanged;
		}

		private function removeUnitChildFromList(ru : RenderUnit3D) : void
		{
			if (!ru)
				return;
			var index : int = getChildDataIndexByUnit(ru);
			var childData : RenderUnitChild = index > -1 ? _currChildUnitList[index] : null;
			if (childData)
			{
				var methodChanged : Boolean = removeUnitChildEffectMethods(ru);
				if (childData.renderUnit.usable)
				{
					childData.renderUnit.removeAddedCallBack(doAddCompositeUnit);
					childData.renderUnit.removeAddedCallBack(doSetUnitChildMethods);
					childData.renderUnit.removeRemovedCallBack(doUnitChildRemoved);
					childData.renderUnit.restoreAllChildUnits();
				}
				_currChildUnitList.splice(index, 1);
				childData.destroy();
				if (methodChanged && _renderUnitData)
				{
					_renderUnitData.setMethods(_methodDatas);
				}
			}
		}

		private function getChildDataIndexByUnit(ru : RenderUnit3D) : int
		{
			var childData : RenderUnitChild;
			var len : int = _currChildUnitList.length;
			for (var i : int = len - 1; i >= 0; i--)
			{
				childData = _currChildUnitList[i];
				if (childData.renderUnit == ru)
				{
					return i;
				}
			}
			return -1;
		}

		private function addCompositeMaterials(compositeMesh : CompositeMesh, ru : RenderUnit3D) : void
		{
			if (ru == this || !_renderUnitData || !compositeMesh || !ru || !ru.renderUnitData)
			{
				return;
			}
			var isAdded : Boolean = _renderUnitData.addCompositeMaterials(ru.renderUnitData);
			if (isAdded)
			{
				_renderUnitData.updateMaterials();
			}
		}

		/**
		 * 设置动作状态，且开始播放动作，播放的开始时间为参数time
		 * @param status
		 * @param transition "如：0.2"
		 * @param time
		 * @param animateSpeed
		 *
		 */
		public function setStatus(status : String, transitionTime : Number = 0, time : int = 0, animateSpeed : Number = 1) : void
		{
			if (!_currentStatus)
				transitionTime = 0;
			_currentStatus = status;
			_animationTransitionTime = transitionTime;
			play(time, animateSpeed);
		}

		public function play(time : int = -1, animateSpeed : Number = 1) : void
		{
			_playing = true;
			_playCount = 0;
			_playComplete = false;
			_playInited = true;
			_currDurationTime = 0;
			_playToTime = time;
			if (_playToTime > -1)
			{
				_currDurationTime = _playToTime;
			}
			_playDuration = 0;
			_animateSpeed = animateSpeed;
			if (_completeNotInView && !_isInViewDistance)
			{
				callStop();
			}
			else
			{
				loadRes();
				validateAnimation();
			}
		}

		public function stop(time : int = -1) : void
		{
			_playing = false;
			_playToTime = time;
			_currDurationTime = 0;
			_playDuration = 0;
			validateAnimation();
		}

		public function get isPlaying() : Boolean
		{
			return _playing;
		}

		private function loadRes() : void
		{
			//如果是有资源数据
			if (!_renderResourceData && _renderParamData && ((_isRendering && _playInited && _visible && _isInViewDistance) || _forceLoad)) //隐藏的时候，就不处理加载了。
			{
				//加载新的换装
				_renderResourceData = SceneRenderCache.installRenderResourceData(_renderParamData.sourcePath, _renderParamData.animatorSourchPath, this) as RenderResourceData;
				_renderResourceData.isOnlyInstance = _renderParamData.isOnlyInstance;
				if (_visibleNeedAsyncLoaded && !_renderResourceData.isAsyncLoaded)
				{
					_renderResourceData.setSyncResCompleteCallBack(onValidateGraphic);
					_renderResourceData.setSyncResProgressCallBack(onNextSyncResProgress);
				}
				if (_renderResourceData.isLoaded)
				{
					onSetRenderResourceData(_renderResourceData);
				}
				else
				{
					_renderResourceData.setResCompleteCallBack(onSetRenderResourceData);
					_renderResourceData.setResErrorCallBack(onRenderResourceDataError);
					if (!_renderResourceData.isLoading)
					{
						_renderResourceData.loadSource(_renderParamData.sourcePath, _renderParamData.animatorSourchPath, _renderParamData.priority);
					}
				}
			}
		}
		
		private function tryLoadNextRes() : void
		{
			//如果是有资源数据
			if (!_nextRenderResourceData && _nextRenderParamData)
			{
				if ((_isRendering && _playInited && _visible && _isInViewDistance) || _forceLoad) //隐藏的时候，就不处理加载了。
				{
					//加载新的换装
					_nextRenderResourceData = SceneRenderCache.installRenderResourceData(_nextRenderParamData.sourcePath, _nextRenderParamData.animatorSourchPath, this) as RenderResourceData;
					_nextRenderResourceData.isOnlyInstance = _nextRenderParamData.isOnlyInstance;
					if (_visibleNeedAsyncLoaded && !_nextRenderResourceData.isAsyncLoaded)
					{
						_nextRenderResourceData.setSyncResCompleteCallBack(onNextSyncResComplete);
						_nextRenderResourceData.setSyncResProgressCallBack(onNextSyncResProgress);
					}
					if (_nextRenderResourceData.isLoaded)
					{
						onSetNextRenderResourceData(_nextRenderResourceData);
					}
					else
					{
						_nextRenderResourceData.setResCompleteCallBack(onSetNextRenderResourceData);
						_nextRenderResourceData.setResErrorCallBack(onNextRenderResourceDataError);
						if (!_nextRenderResourceData.isLoading)
						{
							_nextRenderResourceData.loadSource(_nextRenderParamData.sourcePath, _nextRenderParamData.animatorSourchPath, _nextRenderParamData.priority);
						}
					}
				}
				else
				{
					doSetRenderParamData(_nextRenderParamData);
				}
			}
		}
		
		private function onNextSyncResProgress(progress:*,resData : RenderResourceData) : void
		{
			if (_asyncResourceProgressCallBackList)
				CallBackUtil.exceteCallBackData(this, _asyncResourceProgressCallBackList, progress);
		}

		private function onNextSyncResComplete(resData : RenderResourceData) : void
		{
			clearNextSource();
			doSetRenderParamData(_nextRenderParamData);
			loadRes();
		}

		private function onSetNextRenderResourceData(resData : RenderResourceData) : void
		{
			if (!_visibleNeedAsyncLoaded || _nextRenderResourceData.isAsyncLoaded)
			{
				clearNextSource();
				doSetRenderParamData(_nextRenderParamData);
				loadRes();
			}
		}

		private function onNextRenderResourceDataError(resData : RenderResourceData) : void
		{
			clearNextSource();
			doSetRenderParamData(_nextRenderParamData);
			//执行错误回调
			if (_errorCallBackList)
			{
				CallBackUtil.exceteCallBackData(this, _errorCallBackList);
				_errorCallBackList.length = 0;
			}
		}

		public function setRenderParamData(data : RenderParamData3D) : void
		{
			if (!data)
			{
				return;
			}
			if (_renderParamData == data)
			{
				doSetRenderParamData(data);
				loadRes();
			}
			else
			{
				if (_renderParamData)
				{
					clearNextSource();
					_nextRenderParamData = data;
					_resSwitch = true;
					return;
				}
				doSetRenderParamData(data);
			}
		}

		private function doSetRenderParamData(data : RenderParamData3D) : void
		{
			if (_renderParamData)
			{
				clearSource();
			}
			_renderParamData = data;
			id = _renderParamData.id;
			type = _renderParamData.type;
			_forceLoad = _renderParamData.forceLoad;
			_nextRenderParamData = null;
		}

		override public function reSet($parameters : Array) : void
		{
			super.reSet(null);
			setRenderParamData($parameters[0]);
			_is25D = $parameters[1];
			if (!_graphicDis)
			{
				if(_is25D)
				{
					_graphicDis = PoolEntityContainer3D.create();
				}
				else
				{
					_graphicDis = PoolContainer3D.create();
				}
			}
			_nextRenderParamData = null;
			_currentStatus = null;
			_visibleNeedAsyncLoaded = VISIBLE_NEED_ASYNC_LOADED;
			_renderResourceData = null;
			_nextRenderResourceData = null;
			_renderUnitData = null;
			_drawElements = null;
			_animatorElements = null;
			_isElementStatus = false;
			_hasSkeletonAnimator = false;
			_meshes = null;
			_rootObj3ds = null;
			_childObj3ds = null;
			_playing = false;
			_currDurationTime = 0;
			_playDuration = 0;
			_playToTime = 0;
			_completeNotInView = false;
			_disableLoadResPastTime = false;
			_disableOnceMaxDuration = false;
			_animateSpeed = 1;
			_animator = null;
			_shareMaterials = true;
			_lightPicker = null;
			_useLight = false;
			_useVolume = false;
			_playComplete = false;
			_playInited = false;
			_pickDummyEnable = false;
			_pickDummyBindBone = null;
			_defalutStatus = null;
			_secondStatusGetter = null;
			_compositeMesh = null;
			_parentUnit = null;
			_repeat = 0;
			_lifecycle = 0;
			_playCount = 0;
			_totalDuration = 0;
			_resReady = false;
			_resSwitch = false;
			_castsShadows = false;
			_showBounds = false;
			_mouseEnable = false;
			_entityGlass = false;
			_entityPhantom = false;
			_independentAnimator = null;
			_depthCompareMode = Context3DCompareMode.LESS_EQUAL;
			_allowCameraAnimator = false;
			_softOutlineData = null;
			_independentColorTransform = new ColorTransform();
			_fadeAlphaUrl = null;
			_fadeAlphaPriority = 0;
			_fadeAlphaRect = null;
			_independentMaterialName = null;
			_textureUrl = null;
			_texturePriority = 0;
			_blendMaterialName = null;
			_blendMaskUrl = null;
			_blendUrl = null;
			_blendBias = 0;
			_useIndependentColor = false;
			_useIndependentDiffuseColor = false;
			_independentDiffuseColor = 0;
			_setVisibleMap = new Dictionary(true);
			_layerTypeByName = new Dictionary(true);
			_visibleByName = new Dictionary(true);
			_zOffsetByName = new Dictionary(true);
			_shareMaterialProperty = new Vector.<MaterialPropertyData>();
			
			useFog = false;
			_validateChildMeshEffect = false;
			
			_isAlpha = false;
			blendMode = BlendMode.NORMAL;
			alpha = 1;
		}

		/**
		 * 如果需要更新了模型后需要复原更新前的状态，在更新模型前要创建同步信息快照。@L.L.M.Sunny
		 * @return
		 *
		 */
		public function buildSyncInfo() : RenderUnitSyncInfo
		{
			if (!_playInited)
				return null;
			if (!_drawElements)
				return null;
			var time : int = 0;
			var animator : AnimatorBase;
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					animator = null;
					if (animatElement is IAnimatorOwner)
						animator = (animatElement as IAnimatorOwner).animator as AnimatorBase;
					if (animator)
					{
						time = animator.time;
						break;
					}
				}
			}
			else
			{
				for each (var element : ObjectContainer3D in _drawElements)
				{
					animator = null;
					if (element is IAnimatorOwner)
						animator = (element as IAnimatorOwner).animator as AnimatorBase;
					if (animator)
					{
						time = animator.time;
						break;
					}
				}
			}
			var info : RenderUnitSyncInfo = new RenderUnitSyncInfo(_currentStatus, _animateSpeed, _playing, time);
			return info;
		}

		/**
		 * 执行这个渲染单元的快照
		 * 提交同步快照。@L.L.M.Sunny
		 * @param info
		 *
		 */
		public function applySyncInfo(info : RenderUnitSyncInfo) : void
		{
			if (!info)
				return;
			setStatus(info.status, 0, info.time, info.animateSpeed);
			if (!info.playing)
			{
				stop(info.time);
			}
		}

		public function setIndependentColor(red : Number, green : Number, blue : Number, alpha : Number = 1.0) : void
		{
			_useIndependentColor = true;
			_independentColorTransform.redMultiplier = red;
			_independentColorTransform.greenMultiplier = green;
			_independentColorTransform.blueMultiplier = blue;
			_independentColorTransform.alphaMultiplier = alpha*_alpha;

			_independentColorTransform.redOffset = 0;
			_independentColorTransform.greenOffset = 0;
			_independentColorTransform.blueOffset = 0;
			_independentColorTransform.alphaOffset = 0;
			if (_renderUnitData)
			{
				_renderUnitData.setIndependentColorTransform(_independentColorTransform);
			}
		}

		public function restoreColor() : void
		{
			//可能是hurtstate的演示调用
			_useIndependentColor = false;
			_independentColorTransform.redMultiplier = 1;
			_independentColorTransform.greenMultiplier = 1;
			_independentColorTransform.blueMultiplier = 1;
			_independentColorTransform.alphaMultiplier = _alpha;
			if (_renderUnitData)
			{
				if(alpha < 1)
				{
					_renderUnitData.setIndependentColorTransform(_independentColorTransform);
				}
				else
				{
					_renderUnitData.restoreColor();
				}
			}
			
		}
		
		public function setIndependentDiffuseColor(value : uint,onlyApplyToMaterial:String = null) : void
		{
			_useIndependentDiffuseColor = true;
			_independentDiffuseColor = value;
			_onlyApplyIDColorToMaterial = onlyApplyToMaterial;
			if (_renderUnitData)
			{
				_renderUnitData.setIndependentDiffuseColor(_independentDiffuseColor,onlyApplyToMaterial);
			}
		}
		
		public function restoreDiffuseColor() : void
		{
			_useIndependentDiffuseColor = false;
			_independentDiffuseColor = 0;
			_onlyApplyIDColorToMaterial = null;
			if (_renderUnitData)
			{
				_renderUnitData.restoreDiffuseColor();
			}
		}

		public function addBlend(blendMaskUrl : String, blendUrl : String, blendMaterialName : String = null) : void
		{
			_blendMaskUrl = blendMaskUrl;
			_blendUrl = blendUrl;
			_blendMaterialName = blendMaterialName;
			_blendBias = 0;
			if (_renderUnitData)
			{
				_renderUnitData.addBlend(blendMaskUrl, blendUrl, blendMaterialName);
			}
		}

		public function get blendBias() : Number
		{
			return _blendBias;
		}

		public function set blendBias(value : Number) : void
		{
			_blendBias = value;
			if (_renderUnitData)
			{
				_renderUnitData.blendBias = _blendBias;
			}
		}

		public function removeBlend() : void
		{
			if (_renderUnitData)
			{
				_renderUnitData.removeBlend();
			}
			_blendMaskUrl = null;
			_blendUrl = null;
			_blendBias = 0;
			_blendMaterialName = null;
		}
		
		public function restoreAllChildUnits() : void
		{
			if (_currChildUnitList)
			{
				for each (var childData : RenderUnitChild in _currChildUnitList)
				{
					if (childData.renderUnit && childData.renderUnit.usable)
					{
						childData.renderUnit.removeAddedCallBack(doAddCompositeUnit);
						childData.renderUnit.removeAddedCallBack(doSetUnitChildMethods);
						childData.renderUnit.removeRemovedCallBack(doUnitChildRemoved);
						childData.renderUnit.restoreElementsParent(this, parent);
					}
					childData.destroy();
				}
				_currChildUnitList.length = 0;
			}
			var skeletonName:String;
			var parentSkeletonName:String;
			if (_drawElements)
			{
				for each (var element : ObjectContainer3D in _drawElements)
				{
					
//					if (!(element is Mesh))
//					{
//						element.hookingJointName = null;
//						_graphicDis.addChild(element);
//					}
//					else
//					{
//						skeletonName = _renderResourceData.meshUseForSkeletonName();
//						parentSkeletonName = (_parentUnit && _parentUnit._renderResourceData) ? _parentUnit._renderResourceData.meshUseForSkeletonName() : null;
//						if(!skeletonName || skeletonName == parentSkeletonName)
//						{
//							element.hookingJointName = null;
//							_graphicDis.addChild(element);
//						}
//						else 
//						{
//							Log.error(_renderParamData.sourcePath+":"+parentSkeletonName+":"+"蒙皮已经被骨骼引用，不能单独使用！");
//						}
//					}
					
					if (!(element is Mesh))
					{
						element.hookingJointName = null;
						_graphicDis.addChild(element);
					}
					else
					{
						skeletonName = _renderResourceData.meshUseForSkeletonName();
						parentSkeletonName = (_parentUnit && _parentUnit._renderResourceData) ? _parentUnit._renderResourceData.meshUseForSkeletonName() : null;
						if(!skeletonName || skeletonName == parentSkeletonName)
						{
							element.hookingJointName = null;
							_graphicDis.addChild(element);
						}
						else 
						{
							//							Log.error(_renderParamData.sourcePath+":"+parentSkeletonName+":"+"蒙皮已经被骨骼引用，不能单独使用！");
						}
					}
					if (_compositeMesh && (element is Mesh))
					{
						var index : int = _compositeMesh.getUnitIndex(Mesh(element));
						if (index > -1)
							_compositeMesh.removeUnitByIndex(index);
					}
					
					/*if (!_renderResourceData.isSkinMesh || !(element is Mesh))
					{
						element.hookingJointName = null;
						_graphicDis.addChild(element);
					}
					if (_compositeMesh && (element is Mesh))
					{
						var index : int = _compositeMesh.getUnitIndex(Mesh(element));
						if (index > -1)
							_compositeMesh.removeUnitByIndex(index);
					}*/
				}
			}
			_compositeMesh = null;
			_parentUnit = null;
		}

		protected function restoreElementsParent(parentUnit : RenderUnit3D, parent : ObjectContainer3D) : void
		{
			if (!_graphicDis)
			{
				return;
			}
			if (_drawElements)
			{
				var animatorElements : Vector.<CompositeMesh> = parentUnit._animatorElements;
				for each (var drawElement : ObjectContainer3D in _drawElements)
				{
					if (animatorElements && (drawElement is Mesh))
					{
						for each (var animatElement : CompositeMesh in animatorElements)
						{
							var index : int = animatElement.getUnitIndex(Mesh(drawElement));
							if (index > -1)
								animatElement.removeUnitByIndex(index);
						}
					}
					drawElement.hookingJointName = null;
//					_graphicDis.addChild(drawElement);
					if(drawElement.parent)//只有添加到显示列表的元件在restore的时候需要重新添加到本unit里  --by chenminglai
						_graphicDis.addChild(drawElement);
				}
			}
		}

		public function getChildSceneTransformByName(name : String) : Matrix3D
		{
			var child : ObjectContainer3D = getChildByName(name);
			if (child)
			{
				return child.sceneTransform;
			}
			return null;
		}

		public function getBoneSceneTransformByName(name : String) : Matrix3D
		{
			var bone : SkeletonBone = getBoneByName(name);
			if (bone)
			{
				return bone.sceneTransform;
			}
			return null;
		}

		public function getChildRelativeTransformByName(name : String) : Matrix3D
		{
			var child : ObjectContainer3D = getChildByName(name);
			if (child)
			{
				var result : Matrix3D = new Matrix3D();
				toParentTransform(child, result);
				return result;
			}
			return null;
		}

		public function getBoneRelativeTransformByName(name : String) : Matrix3D
		{
			var bone : SkeletonBone = getBoneByName(name);
			if (bone)
			{
				var result : Matrix3D = new Matrix3D();
				toParentTransform(bone, result);
				return result;
			}
			return null;
		}

		private function toParentTransform(child : ObjectContainer3D, transform : Matrix3D) : void
		{
			if (!child)
				return;
			if (child is SkeletonBone)
			{
				var localTransform : Matrix3D = (child as SkeletonBone).localTransform();
				transform.append(localTransform);
			}
			else
			{
				transform.append(child.transform);
			}
			if (child != _graphicDis)
			{
				var parent : ObjectContainer3D = child.virtualParent;
				toParentTransform(parent, transform);
			}
		}

		public function getChildScreenPositionByName(name : String) : Point
		{
			var view : View3D = _graphicDis.scene.view;
			if (view)
			{
				var result : Matrix3D = getChildSceneTransformByName(name);
				if (!result)
					return null;
				var pos2D : Vector3D = view.project(result.position, Matrix3DUtils.CALCULATION_VECTOR3D);
				return new Point(pos2D.x, pos2D.z);
			}
			return null;
		}

		public function getBoneScreenPositionByName(name : String) : Point
		{
			var view : View3D = _graphicDis.scene.view;
			if (view)
			{
				var result : Matrix3D = getBoneSceneTransformByName(name);
				if (!result)
					return null;
				var pos2D : Vector3D = view.project(result.position, Matrix3DUtils.CALCULATION_VECTOR3D);
				return new Point(pos2D.x, pos2D.z);
			}
			return null;
		}

		/**
		 * 获得模型上指定名称的容器
		 * @param name
		 * @return
		 */
		public function getChildByName(name : String) : ObjectContainer3D
		{
			if (_renderUnitData == null)
				return null;
			return _renderUnitData.getChildByName(name);
		}

		/**
		 * 获得模型上指定名称集的容器集合
		 * @param name
		 * @return
		 */
		public function getChildsByNames(names : Array) : Array
		{
			if (_renderUnitData == null)
				return null;
			return _renderUnitData.getChildsByNames(names);
		}

		/**
		 * 获取模型上指定名称的骨骼
		 * @param value
		 * @return
		 */
		public function getBoneByName(name : String) : SkeletonBone
		{
			if (_renderUnitData == null)
				return null;
			return _renderUnitData.getBoneByName(name);
		}
		
		public function get camera() : Camera3D
		{
			if (_renderResourceData)
				return _renderResourceData.camera;
			return null;
		}
		
		public function get soundBox():SoundBox
		{
			return _renderResourceData?_renderResourceData.soundBox:null;
		}

		/**
		 * 添加指定的显示对象到对应的骨胳上
		 * @param value
		 * @param obj
		 * @return
		 *
		 */
		/*public function addChildAtBone(boneName : String, child : ObjectContainer3D, compositeIndex : int = 0, isCompositeUnit : Boolean = false) : Boolean
		{
			if (child == null)
				return false;
			if (boneName == null || boneName == "")
				return false;
			if (_animatorElements && compositeIndex > -1 && compositeIndex < _animatorElements.length)
			{
				if (child.parent)
				{
					child.parent.removeChild(child);
				}
				child.hookingJointName = null;
				var compositeMesh : CompositeMesh = _animatorElements[compositeIndex];
				if (isCompositeUnit && child is Mesh)
				{
					compositeMesh.addUnit(Mesh(child));
				}
				else
				{
					child.hookingJointName = boneName;
					compositeMesh.addChild(child);
				}
			}
			else
			{
				var bone : SkeletonBone = getBoneByName(boneName);
				if (bone == null)
					return false;
				bone.addChild(child);
			}
			if (!_boneChildrenByName)
				_boneChildrenByName = new Dictionary();
			var children : Array = _boneChildrenByName[boneName];
			if (!children)
				_boneChildrenByName[boneName] = children = [];
			if (children.indexOf(child) == -1)
				children.push(child);
			return true;
		}*/

		/*public function removeChildAtBone(boneName : String, child : ObjectContainer3D, compositeIndex : int = 0) : Boolean
		{
			if (child == null)
				return false;
			if (boneName == null || boneName == "")
				return false;
			if (_animatorElements && compositeIndex > -1 && compositeIndex < _animatorElements.length)
			{
				if (child.parent == _animatorElements[compositeIndex])
				{
					child.parent.removeChild(child);
				}
				child.hookingJointName = null;
				if (child is Mesh)
				{
					_animatorElements[compositeIndex].removeUnit(Mesh(child));
				}
			}
			else
			{
				var bone : SkeletonBone = getBoneByName(boneName);
				if (bone == null)
					return false;
				if (child.parent == bone)
					child.parent.removeChild(child);
			}
			if (_boneChildrenByName)
			{
				var children : Array = _boneChildrenByName[boneName];
				if (children)
				{
					var index : int = children.indexOf(child);
					if (index > -1)
						children.splice(index, 1);
				}
			}
			return true;
		}*/

		public function setVisibleByName(names : Array, visible : Boolean) : void
		{
			if (_setVisibleMap && names)
			{
				for each (var nameStr : String in names)
				{
					_setVisibleMap[nameStr] = visible;
				}
				validateEffect();
			}
		}

		public function get totalDuration() : uint
		{
			return _totalDuration;
		}

		public function set repeat(value : int) : void
		{
			_repeat = value;
		}

		public function get repeat() : int
		{
			return _repeat;
		}

		public function set lifecycle(value : int) : void
		{
			_lifecycle = value;
		}

		public function get lifecycle() : int
		{
			return _lifecycle;
		}

		/**
		 * 设置拾取光（灯光拾取器）
		 * @param value
		 *
		 */
		public function set lightPicker(value : LightPickerBase) : void
		{
			if (_lightPicker == value)
				return;
			_lightPicker = value;
			if (_renderUnitData)
			{
				_renderUnitData.lightPicker = _useLight ? _lightPicker : null;
			}
		}

		public function set useLight(value : Boolean) : void
		{
			if (_useLight == value)
				return;
			_useLight = value;
			if (_renderUnitData)
			{
				_renderUnitData.lightPicker = _useLight ? _lightPicker : null;
			}
		}

		public function getBounds() : VolumeBounds
		{
			if (!_drawElements)
			{
				return null;
			}
			if (_drawElements)
			{
				for each (var element : ObjectContainer3D in _drawElements)
				{
					if(element.name.indexOf("chest") != -1 || element.name.indexOf("zero") != -1)//这里处理下策划自己加的挂点到模型里面去，干扰了模型的包围盒
					{
						continue;
					}
					var bounds : VolumeBounds = new VolumeBounds(element.minX * element.scaleX, element.minY * element.scaleY, element.minZ * element.scaleZ, //
						element.maxX * element.scaleX, element.maxY * element.scaleY, element.maxZ * element.scaleZ);
					return bounds;
				}
			}
			return null;
		}

		public function get height() : Number
		{
			var bounds : VolumeBounds = getBounds();
			if (bounds)
			{
				var gh : int = bounds.maxX - bounds.minY;
				return gh;
			}
			return 0;
		}

		public function get width() : Number
		{
			var bounds : VolumeBounds = getBounds();
			if (bounds)
			{
				var gw : Number = bounds.maxX - bounds.minX;
				return gw;
			}
			return 0;
		}

		public function get boundZ() : Number
		{
			var bounds : VolumeBounds = getBounds();
			if (bounds)
			{
				var gd : Number = bounds.maxZ - bounds.minZ;
				return gd;
			}
			return 0;
		}

		public function get radius() : Number
		{
			var bounds : VolumeBounds = getBounds();
			if (bounds)
			{
				var gw : Number = bounds.maxX - bounds.minX;
				var gh : Number = bounds.maxZ - bounds.minZ;
				return MathUtil.getDistance(0, 0, gw, gh);
			}
			return 0;
		}

		public function get useVolume() : Boolean
		{
			return _useVolume;
		}

		public function set useVolume(value : Boolean) : void
		{
			if (_useVolume == value)
				return;
			_useVolume = value;
			if (_useVolume)
			{
				volumeBounds = new VolumeBounds();
				validateVolume();
			}
			else
			{
				volumeBounds = null;
			}
		}

		public function set completeWhenInvisible(value : Boolean) : void
		{
			_completeNotInView = value;
		}

		/**
		 * 禁用加载资源逝去时间
		 * @param value
		 *
		 */
		public function set disableLoadResPastTime(value : Boolean) : void
		{
			_disableLoadResPastTime = value;
		}
		
		/**
		 * 禁用单次时最大持续
		 * @param value
		 *
		 */
		public function set disableOnceMaxDuration(value : Boolean) : void
		{
			_disableOnceMaxDuration = value;
		}
		
		override public function run(gapTm : uint) : void
		{
			super.run(gapTm);
			if (_isRendering)
			{
				tryLoadNextRes();
				if (_playing && !_playComplete)
				{
					if (_resReady || (!_resReady && !_disableLoadResPastTime))
					{
						_playDuration += gapTm;
						_currDurationTime += gapTm * _animateSpeed;
					}
					if (!_resReady)
					{
						return;
					}
					_playCount = _totalDuration > 0 ? int(_currDurationTime / _totalDuration) : 0;
					if (_repeat == 0)
					{
						if (_lifecycle > 0 && _playDuration >= _lifecycle)
						{
							callStop();
						}
					}
					else if (_repeat == 1)
					{
						if (_playCount >= _repeat)
						{
							callStop();
						}
						else if (!_disableOnceMaxDuration && _currDurationTime >= ONCE_MAX_DURATION_TIME)
						{
							callStop();
						}
					}
					else //非无限循环
					{
						if (_playCount >= _repeat)
						{
							callStop();
						}
					}
//                    if (_playing && _registeredCamera && _registeredCamera.camera3DAnimators.length > 0) {
//                        CameraFrontController.screenVibration();
//                    }
					
				}
				if(_isAlpha)
				{
					blendMode = BlendMode.LAYER;
					alpha = 0.3;
				}
				else
				{
					blendMode = BlendMode.NORMAL;
					alpha = 1;
				}
			}
		}
		
		private function callStop() : void
		{
			_playComplete = true;
			stop(_totalDuration);
			CallBackUtil.exceteCallBackData(this, _playCompleteCallBackList);
		}

		private function clearNextSource() : void
		{
			if (_nextRenderResourceData)
			{
				_nextRenderResourceData.removeSyncResCompleteCallBack(onNextSyncResComplete);
				_nextRenderResourceData.removeResCompleteCallBack(onSetNextRenderResourceData);
				_nextRenderResourceData.removeResErrorCallBack(onNextRenderResourceDataError);
				//释放旧的换装
				SceneRenderCache.uninstallRenderResourceData(_nextRenderParamData.sourcePath, _nextRenderParamData.animatorSourchPath, this);
				_nextRenderResourceData = null;
			}
		}

		private function clearSource() : void
		{
			_animator = null;
			//释放缓存
			if (_renderResourceData)
			{
				_renderResourceData.removeSyncResProgressCallBack(onValidateGraphic);
				_renderResourceData.removeSyncResCompleteCallBack(onNextSyncResProgress);
				_renderResourceData.removeResCompleteCallBack(onSetRenderResourceData);
				_renderResourceData.removeResErrorCallBack(onRenderResourceDataError);
				//释放旧的换装
				SceneRenderCache.uninstallRenderResourceData(_renderParamData.sourcePath, _renderParamData.animatorSourchPath, this);
			}
			_resReady = false;
			_resSwitch = false;
			unregisterCameraAnimator();
			setMeshPickEnable(false);

			_isElementStatus = false;
			_hasSkeletonAnimator = false;
			if (_animatorElements)
			{
				for each (var compositeMesh : CompositeMesh in _animatorElements)
				{
					compositeMesh.castsShadows = false;
					compositeMesh.showBounds = false;
					compositeMesh.extra = null;
					compositeMesh.pickingCollider = null;
					compositeMesh.removeAllUnits();
					if (compositeMesh.parent)
					{
						compositeMesh.parent.removeChild(compositeMesh);
					}
				}
				_animatorElements = null;
			}
			if (_drawElements)
			{
				for each (var element : ObjectContainer3D in _drawElements)
				{
					if (_compositeMesh)
					{
						if (element is Mesh)
						{
							var index : int = _compositeMesh.getUnitIndex(Mesh(element));
							if (index > -1)
								_compositeMesh.removeUnitByIndex(index);
						}
					}
					if (element.parent)
					{
						element.parent.removeChild(element);
					}
					element.hookingJointName = null;
				}
				_drawElements = null;
			}
			_compositeMesh = null;
			if (_meshes)
			{
				for each (var mesh : Mesh in _meshes)
				{
					mesh.castsShadows = false;
					mesh.showBounds = false;
					mesh.extra = null;
					mesh.pickingCollider = null;
				}
				_meshes = null;
			}
			if (_baseVirtualElements) {
				for each(var baseVirtual : ObjectContainer3D in _baseVirtualElements) {
					baseVirtual.extra = null;
					if (baseVirtual.parent) {
						baseVirtual.parent.removeChild(baseVirtual);
					}
				}
				_baseVirtualElements = null;
			}
			/*if (_boneChildrenByName)
			{
				for (var boneName : String in _boneChildrenByName)
				{
					var children : Array = _boneChildrenByName[boneName];
					for each (var child : ObjectContainer3D in children)
					{
						if (child.parent)
							child.parent.removeChild(child);
					}
					children.length = 0;
					_boneChildrenByName[boneName] = null;
					delete _boneChildrenByName[boneName];
				}
				_boneChildrenByName = null;
			}*/
			if (_renderUnitData)
			{
				restoreRenderUnit();
				SceneRenderCache.recycleRenderUnitData(_renderResourceData, _renderUnitData);
				_renderUnitData = null;
			}
			var name : String;
			if (_setVisibleMap)
			{
				for (name in _setVisibleMap)
				{
					_setVisibleMap[name] = null;
					delete _setVisibleMap[name];
				}
			}
			if (_layerTypeByName)
			{
				for (name in _layerTypeByName)
				{
					_layerTypeByName[name] = null;
					delete _layerTypeByName[name];
				}
			}
			if (_visibleByName)
			{
				for (name in _visibleByName)
				{
					_visibleByName[name] = null;
					delete _visibleByName[name];
				}
			}
			if (_zOffsetByName)
			{
				for (name in _zOffsetByName)
				{
					_zOffsetByName[name] = null;
					delete _zOffsetByName[name];
				}
			}
//			_waitAddUnitList.length = 0;
			_rootObj3ds = null;
			_childObj3ds = null;
			_renderParamData = null;
			_renderResourceData = null;
		}
		
		private function restoreRenderUnit() : void
		{
			if (!_renderUnitData)
				return;
			
			var obj : ObjectContainer3D;
			var name : String;
			var objVisible : Boolean;
			var layerType : uint;
			if (_rootObj3ds)
			{
				for each (obj in _rootObj3ds)
				{
					name = obj.name;
					if (_zOffsetByName && _zOffsetByName.hasOwnProperty(name))
					{
						obj.zOffset = int(_zOffsetByName[name]);
					}
					if (obj is Mesh)
					{
						if (_layerTypeByName && _layerTypeByName.hasOwnProperty(name))
						{
							layerType = uint(_layerTypeByName[name]);
							(obj as Mesh).layerType = layerType;
						}
					}
					else
					{
						if (_visibleByName && _visibleByName.hasOwnProperty(name))
						{
							objVisible = Boolean(_visibleByName[name]);
							obj.visible = objVisible;
						}
					}
				}
			}
			if (_childObj3ds)
			{
				for each (obj in _childObj3ds)
				{
					name = obj.name;
					if (_visibleByName && _visibleByName.hasOwnProperty(name))
					{
						objVisible = Boolean(_visibleByName[name]);
						obj.visible = objVisible;
					}
					if (_zOffsetByName && _zOffsetByName.hasOwnProperty(name))
					{
						obj.zOffset = int(_zOffsetByName[name]);
					}
				}
			}
		}
		
		public function getUnitChildDatas() : Vector.<RenderUnitChild>
		{
			return _currChildUnitList;
		}

		/**销毁显示对象 */
		override public function destroy() : void
		{
			recycle(this);
		}

		override public function dispose() : void
		{
			//标识正在释放中
			_disposing = true;
			//执行移除回收回调
			if (_removedCallBackList)
			{
				CallBackUtil.exceteCallBackData(this, _removedCallBackList);
				_removedCallBackList.length = 0;
			}
			//			if (_animator)
			//			{
			//				//(_animator as AnimatorBase).removeEventListener(AnimatorEvent.CYCLE_COMPLETE, onAnimationComplete);
			//				_animator.stop();
			//			}
			clearNextSource();
			clearSource();
			_nextRenderParamData = null;
			stop();
			_entityGlass = false;
			_softOutlineData = null;
			_mouseEnable = false;
			removeAllMethods();
			_playing = false;
			_completeNotInView = false;
			_disableLoadResPastTime = false;
			_disableOnceMaxDuration = false;
			_pickDummyEnable = false;
			_pickDummyBindBone = null;
			_totalDuration = 0;
			if (_independentAnimator)
			{
				_independentAnimator.dispose();
				_independentAnimator = null;
			}
		
			restoreAllChildUnits();
			_visibleNeedAsyncLoaded = false;
			_currentStatus = null;
			_defalutStatus = null;
			_secondStatusGetter = null;
			
//			_animationTransition = null;
			_playToTime = 0;
			_currDurationTime = 0;
			_playDuration = 0;
			_playComplete = false;
			_playInited = false;
			_forceLoad = false;
			_castsShadows = false;
			_showBounds = false;
			_allowCameraAnimator = false;
			_shareMaterials = false;
			_lightPicker = null;
			_useLight = false;
			_useVolume = false;
			_fadeAlphaUrl = null;
			_fadeAlphaPriority = 0;
			_fadeAlphaRect = null;
			_independentMaterialName = null;
			_textureUrl = null;
			_texturePriority = 0;
			_blendMaterialName = null;
			_blendMaskUrl = null;
			_blendUrl = null;
			_blendBias = 0;
			_useIndependentColor = false;
			_useIndependentDiffuseColor = false;
			_independentDiffuseColor = 0;
			_onlyApplyIDColorToMaterial = null;
			_setVisibleMap = null;
			_layerTypeByName = null;
			_visibleByName = null;
			useFog = false;
			
			if (_addedCallBackList)
			{
				_addedCallBackList.length = 0;
			}
			if (_errorCallBackList)
			{
				_errorCallBackList.length = 0;
			}
			if (_playCompleteCallBackList)
			{
				_playCompleteCallBackList.length = 0;
			}
			if (_mouseUpCallBackList)
			{
				_mouseUpCallBackList.length = 0;
			}
			if (_mouseDownCallBackList)
			{
				_mouseDownCallBackList.length = 0;
			}
			if (_mouseOverCallBackList)
			{
				_mouseOverCallBackList.length = 0;
			}
			if (_mouseOutCallBackList)
			{
				_mouseOutCallBackList.length = 0;
			}
			if (_mouseRightUpCallBackList)
			{
				_mouseRightUpCallBackList.length = 0;
			}
			if (_mouseRightDownCallBackList)
			{
				_mouseRightDownCallBackList.length = 0;
			}
			if (_asyncResourceCompleteCallBackList)
			{
				_asyncResourceCompleteCallBackList.length = 0;
				_asyncResourceCompleteCallBackList = null;
			}
			if (_asyncResourceProgressCallBackList)
			{
				_asyncResourceProgressCallBackList.length = 0;
				_asyncResourceProgressCallBackList = null;
			}
			unregisterEvent();
			super.dispose();
		}
		
		override public function set staticGraphicDis(value:ObjectContainer3D):void
		{
			super.staticGraphicDis = value;
		}
		
		public function changeBaseVirtualParent(toBone : Boolean) : void 
		{
			if (null == this._staticGraphicDis || null == this._baseVirtualElements) 
			{
				return;
			}
			for each(var virtual : ObjectContainer3D in this._baseVirtualElements) 
			{
                if (-1 != virtual.name.indexOf("st_")) {
                    continue;
                }
				for each(var unit : RenderUnitChild in _currChildUnitList) 
				{
					if (virtual.name == unit.childName) 
					{
						unit.renderUnit.parent = null;
						unit.boneName = "c_0_body_01";
						if (toBone)
						{
							addUnitAtBone(unit.renderUnit, "c_0_body_01");
						}
						else
						{
							addUnitAtChild(unit.renderUnit, unit.childName);
						}
					}
				}
			}
		}
//		public function get compositeMesh():CompositeMesh
//		{
//			return _compositeMesh;
//		}
	}
}
