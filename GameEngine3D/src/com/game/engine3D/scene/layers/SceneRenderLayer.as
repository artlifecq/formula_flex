package com.game.engine3D.scene.layers
{
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.mainCore.libCore.log.ZLog;
	
	import flash.display.BlendMode;
	import flash.utils.Dictionary;
	
	import away3d.containers.ObjectContainer3D;

	/**
	 *
	 * 角色换装层 (此类支持向外部渲染，比如界面上显示动态的角色换装)
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午1:26:38
	 *
	 */
	public class SceneRenderLayer extends ObjectContainer3D
	{
		private static const MAX_BATCH_RENDER : int = 10;
		/**
		 * 场景
		 */
		private var _scene3D : GameScene3D;
		private var _baseObjList : Vector.<BaseObj3D>;
		
		private var _waitBatchRender : Vector.<BaseObj3D>;
		
		private var _currRenderLimitNumByType : Dictionary;
		
		private var _maxRenderLimitNumByType : Dictionary;
		
		private var _currAttachLimitNumByType : Dictionary;
		
		private var _maxAttachLimitNumByType : Dictionary;
		
		private var _maxOtherRenderLimitNum : int;
		
		private var _currOtherRenderLimitNum : int;
		
		private var _renderObjCnt : int = 0;
		private var _tickCnt : uint = 0;
		private var _viewDistanceSquare : Number = 0;
		private var _viewFilter : Function = null;

		public function SceneRenderLayer(scene : GameScene3D, viewFilter : Function = null)
		{
			super();
			_scene3D = scene;
			_baseObjList = new Vector.<BaseObj3D>();
			_waitBatchRender = new Vector.<BaseObj3D>();
			_currRenderLimitNumByType = new Dictionary();
			_maxRenderLimitNumByType = new Dictionary();
			_currAttachLimitNumByType = new Dictionary();
			_maxAttachLimitNumByType = new Dictionary();
			_maxOtherRenderLimitNum = -1;
			_currOtherRenderLimitNum = 0;
			_renderObjCnt = 0;
			_viewFilter = viewFilter;
		}

		/**
		 * @private
		 * 场景所有角色集合
		 */
		public function get baseObjList() : Vector.<BaseObj3D>
		{
			return _baseObjList;
		}

		public function get renderObjCnt() : uint
		{
			return _renderObjCnt;
		}

		public function get baseObjCnt() : uint
		{
			return _baseObjList.length;
		}

		/**
		 * 清空
		 */
		public function clear() : void
		{
			//角色
			//------------------------------------
			//移除所有角色，但不移除主角 和 鼠标点击效果虚拟角色,主要是回收操作！！！
			var len : int = _baseObjList.length;
			while (len-- > 0)
			{
				var obj : BaseObj3D = _baseObjList[len];
				removeBaseObj(obj);
			}
			var type : String;
			for (type in _currRenderLimitNumByType)
			{
				_currRenderLimitNumByType[type] = 0;
			}
			for (type in _currAttachLimitNumByType)
			{
				_currAttachLimitNumByType[type] = 0;
			}
			_currOtherRenderLimitNum = 0;
			_renderObjCnt = 0;
			_tickCnt = 0;
			_viewDistanceSquare = 0;
		}

		public function destroy() : void
		{
			clear();
			_viewFilter = null;
			dispose();
		}

		/**
		 * 向场景中添加角色 
		 * @param baseObj      要添加的角色
		 * @param parent       添加到什么容器上去
		 * @param needInViewDist        是否开启视野判断
		 * @param renderLimitable       是否有显示限制
		 * 
		 */		
		public function addBaseObj(baseObj : BaseObj3D, parent : ObjectContainer3D = null, needInViewDist : Boolean = true, renderLimitable : Boolean = false) : void
		{
			if (!baseObj)
			{
				return;
			}
			if (_baseObjList.indexOf(baseObj) == -1)
			{
				//强制改变此值,并更新到各个BaseObj3D内
				baseObj.parent = parent || this;
				baseObj.needInViewDist = needInViewDist;
				baseObj.renderLimitable = renderLimitable;
				baseObj.needRun = true;
				viewStateAdd(baseObj);
				if (renderLimitable)
				{
					_waitBatchRender.push(baseObj);
				}
				else
				{
					baseObj.startRender();
				}
				_baseObjList.push(baseObj);

				//ZLog.add("###场景角色数量：" + _baseObjList.length);
			}
		}

		/**
		 * 从场景中移除角色
		 * @param $sc
		 * @param $recycle 是否池回收
		 */
		public function removeBaseObj(baseObj : BaseObj3D, recycle : Boolean = true) : void
		{
			if (!baseObj)
			{
				return;
			}
			//先做个判断
			if (!baseObj.canRemoved)
			{
				trace("不能移除该角色, ID:" + baseObj.id + ",type:" + baseObj.type);
				return;
			}
			var index : int = _baseObjList.indexOf(baseObj);
			if (index > -1)
			{
				//从数组中移除
				_baseObjList.splice(index, 1);
				index = _waitBatchRender.indexOf(baseObj);
				if (index > -1)
				{
					_waitBatchRender.splice(index, 1);
				}
				//清除缓动
				baseObj.sceneName = null;
				baseObj.parent = null;
				baseObj.stopRender();
				if (recycle)
				{
					baseObj.destroy();
					baseObj = null;
				}
				ZLog.add("###场景角色数量：" + _baseObjList.length);
			}
		}

		/**
		 * 从场景中移除角色(通过ID和类型)
		 * @param id
		 * @param type
		 * @param recycle 是否池回收
		 */
		public function removeBaseObjByID(id : int, type : String, recycle : Boolean = true) : void
		{
			var obj : BaseObj3D = getBaseObjByID(id, type);
			if (obj)
			{
				removeBaseObj(obj, recycle);
			}
		}

		/**
		 * 从场景中移除角色(通过类型)
		 * @param type
		 * @param recycle 是否池回收
		 */
		public function removeBaseObjByType(type : String, recycle : Boolean = true) : void
		{
			var list : Array = getBaseObjByType(type);
			var len : int = list.length;
			while (len-- > 0)
			{
				var bo : BaseObj3D = list[len];
				removeBaseObj(bo, recycle);
			}
		}

		/**
		 * 从场景中查找角色
		 * @parm id 角色ID
		 * @parm type 角色类型
		 */
		public function getBaseObjByID(id : Number, type : String) : BaseObj3D
		{
			var bo : BaseObj3D;
			var len : int = _baseObjList.length;
			while (len-- > 0)
			{
				bo = _baseObjList[len];
				if (bo && bo.id == id && bo.type == type)
				{
					return bo;
				}
			}
			return null;
		}

		/**
		 * 从场景中查找角色
		 * @parm type 角色类型
		 */
		public function getBaseObjByType(type : String) : Array
		{
			var typeArr : Array = [];
			var obj : BaseObj3D;
			var len : int = _baseObjList.length;
			while (len-- > 0)
			{
				obj = _baseObjList[len];
				if (obj && obj.type == type)
				{
					typeArr.push(obj);
				}
			}
			return typeArr;
		}

		public function getCurrOtherRenderNum() : int
		{
			return _currOtherRenderLimitNum;
		}

		public function getMaxOtherRenderNum() : int
		{
			return _maxOtherRenderLimitNum;
		}

		public function setMaxOtherRenderNum(value : int) : void
		{
			_maxOtherRenderLimitNum = value;
			_currOtherRenderLimitNum = 0;
		}

		public function getCurrRenderNum(type : String) : int
		{
			return _currRenderLimitNumByType[type];
		}

		public function getMaxRenderNum(type : String) : int
		{
			return _maxRenderLimitNumByType[type];
		}

		public function setMaxRenderNum(type : String, value : int) : void
		{
			if (value > -1)
			{
				_maxRenderLimitNumByType[type] = value;
				_currRenderLimitNumByType[type] = 0;
			}
			else
			{
				_maxRenderLimitNumByType[type] = null;
				delete _maxRenderLimitNumByType[type];
				_currRenderLimitNumByType[type] = null;
				delete _currRenderLimitNumByType[type];
			}
		}

		public function getCurrAttachNum(type : String) : int
		{
			return _currAttachLimitNumByType[type];
		}

		public function getMaxAttachNum(type : String) : int
		{
			return _maxAttachLimitNumByType[type];
		}

		public function setMaxAttachNum(type : String, value : int) : void
		{
			if (value > -1)
			{
				_maxAttachLimitNumByType[type] = value;
				_currAttachLimitNumByType[type] = 0;
			}
			else
			{
				_maxAttachLimitNumByType[type] = null;
				delete _maxAttachLimitNumByType[type];
				_currAttachLimitNumByType[type] = null;
				delete _currAttachLimitNumByType[type];
			}
		}

		public function isOtherRenderLimit() : Boolean
		{
			if (_maxOtherRenderLimitNum > -1)
				return _currOtherRenderLimitNum > _maxOtherRenderLimitNum;
			return false;
		}

		public function isRenderLimit(type : String) : Boolean
		{
			if (_maxRenderLimitNumByType[type] != null)
			{
				var maxRenderLimitNum : int = _maxRenderLimitNumByType[type];
				if (maxRenderLimitNum > -1)
				{
					var currRenderLimitNum : int = _currRenderLimitNumByType[type];
					return currRenderLimitNum > maxRenderLimitNum;
				}
			}
			return false;
		}

		public function isAttachLimit(type : String) : Boolean
		{
			if (_maxAttachLimitNumByType[type] != null)
			{
				var maxAttachLimitNum : int = _maxAttachLimitNumByType[type];
				if (maxAttachLimitNum > -1)
				{
					var currAttachLimitNum : int = _currAttachLimitNumByType[type];
					return currAttachLimitNum > maxAttachLimitNum;
				}
			}
			return false;
		}

		private function baseObjSort(baA : BaseObj3D, baB : BaseObj3D) : int
		{
			if (_scene3D.mainChar)
			{
				var disA : Number = MathUtil.getDistanceNoSqrt(_scene3D.mainChar.x, _scene3D.mainChar.z, baA.x, baA.z);
				var disB : Number = MathUtil.getDistanceNoSqrt(_scene3D.mainChar.x, _scene3D.mainChar.z, baB.x, baB.z);
				var inViewA : Boolean = disA < _viewDistanceSquare
				var inViewB : Boolean = disA < _viewDistanceSquare;
				if (inViewA && inViewB)
				{
					if (baA.interactPriority > baB.interactPriority)
					{
						return 1;
					}
					else if (baA.interactPriority < baB.interactPriority)
					{
						return -1;
					}
					else
					{
						if (disA > disB)
						{
							return -1;
						}
						else if (disA < disB)
						{
							return 1;
						}
					}
				}
				else if (inViewA)
				{
					return 1;
				}
				else if (inViewB)
				{
					return -1;
				}
			}
			return 0;
		}

		private function viewStateAdd(baseObj : BaseObj3D) : void
		{
			if (baseObj)
			{
				if (baseObj.usable)
				{
					var inViewDistance : Boolean = true;
					if (_viewFilter != null)
					{
						inViewDistance = _viewFilter(baseObj);
					}
					if (inViewDistance && baseObj.needInViewDist)
					{
						if (_scene3D.mainChar)
						{
							var dist : Number = MathUtil.getDistanceNoSqrt(_scene3D.mainChar.x, _scene3D.mainChar.z, baseObj.x, baseObj.z);
							inViewDistance = dist < _viewDistanceSquare;
						}
					}
					if (inViewDistance && baseObj.renderLimitable)
					{
						if (_maxRenderLimitNumByType[baseObj.type] != null)
						{
							var maxRenderLimitNum : int = _maxRenderLimitNumByType[baseObj.type];
							if (maxRenderLimitNum > -1)
							{
								var currRenderLimitNum : int = _currRenderLimitNumByType[baseObj.type];
								currRenderLimitNum++;
								_currRenderLimitNumByType[baseObj.type] = currRenderLimitNum;
								if (currRenderLimitNum > maxRenderLimitNum)
									inViewDistance = false;
							}
						}
						else if (_maxOtherRenderLimitNum > -1)
						{
							_currOtherRenderLimitNum++;
							if (_currOtherRenderLimitNum > _maxOtherRenderLimitNum)
								inViewDistance = false;
						}
					}
					baseObj.isInViewDistance = inViewDistance;
					if (inViewDistance)
					{
						_renderObjCnt++;
					}
					if (baseObj.attachLimitable)
					{
						for each (var attachType : String in baseObj.attachLimitable)
						{
							var attachVisible : Boolean = true;
							if (_maxAttachLimitNumByType[attachType] != null)
							{
								var maxAttachLimitNum : int = _maxAttachLimitNumByType[attachType];
								if (maxAttachLimitNum > -1)
								{
									var currAttachLimitNum : int = _currAttachLimitNumByType[attachType];
									currAttachLimitNum++;
									_currAttachLimitNumByType[attachType] = currAttachLimitNum;
									if (currAttachLimitNum > maxAttachLimitNum)
										attachVisible = false;
								}
							}
							baseObj.internalAttachVisible(attachType, attachVisible);
						}
					}
					
					if(baseObj.enableMask && _scene3D.sceneMapLayer.district)
					{
						var isInMask:Boolean = _scene3D.sceneMapLayer.district.isPointInMask(baseObj.graphicDis.position);
						if(isInMask)
						{
							baseObj.isAlpha = true;
						}
						else
						{
							baseObj.isAlpha = false;
						}
//						if(!baseObj.isHiding)
//						{	
//							if(isInMask)
//							{
//								baseObj.blendMode = BlendMode.LAYER;
//								baseObj.alpha = 0.5;
//							}
//							else
//							{
//								baseObj.blendMode = BlendMode.NORMAL;
//								baseObj.alpha = 1;
//							}
//						}
					}
				}
				else
				{
					removeBaseObj(baseObj);
				}
			}
		}

		private function updateViewState() : void
		{
			_viewDistanceSquare = _scene3D.viewDistance * _scene3D.viewDistance;
			_baseObjList.sort(baseObjSort);
			var type : String;
			for (type in _currRenderLimitNumByType)
			{
				_currRenderLimitNumByType[type] = 0;
			}
			for (type in _currAttachLimitNumByType)
			{
				_currAttachLimitNumByType[type] = 0;
			}
			_currOtherRenderLimitNum = 0;
			_renderObjCnt = 0;
			var baseObj : BaseObj3D;
			var len : int = _baseObjList.length;
			var index : int = len - 1;
			//var currTime : int = getTimer();
			//各个检测视野逻辑
			while (index >= 0)
			{
				//trace("=================", index);
				baseObj = _baseObjList[index];
				viewStateAdd(baseObj);
				index--;
			}
		}

		/**
		 * 运行
		 */
		final public function run(gapTm : uint) : void
		{
			_tickCnt++;
			var isInRender : Boolean = Boolean(_tickCnt & 3);
			//
			if (isInRender)
			{
				var count : int = 0;
				while (_waitBatchRender.length > 0)
				{
					var baseObj : BaseObj3D = _waitBatchRender.shift();
					baseObj.startRender();
					count++;
					if (count > MAX_BATCH_RENDER)
					{
						break;
					}
				}
				updateViewState();
			}
		}
	}
}
