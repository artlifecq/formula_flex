package com.game.engine3D.scene.render.vo
{
	import com.game.engine3D.core.poolObject.PoolEntityContainer3D;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction3D;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.BaseObjSyncInfo;
	
	import flash.geom.Matrix3D;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.core.math.Matrix3DUtils;
	import away3d.events.MouseEvent3D;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 基本的渲染实体
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午11:12:28
	 *
	 */
	public class BaseEntity extends BaseObj3D
	{
		private var _renderSet : RenderSet3D;
		private var _baseObjList : Vector.<BaseObjChild>;
		protected var _camouflageEntity : BaseEntity;
		private var _imposters : Vector.<BaseEntity>;
		private var _waitAddObjList : Vector.<BaseObjChild>;

		public function BaseEntity(type : String, id : Number)
		{
			super([type, id]);
			_waitAddObjList = new Vector.<BaseObjChild>();
			_baseObjList = new Vector.<BaseObjChild>();
		}

		
		override public function set alpha(value:Number):void
		{
			super.alpha = value;
			_renderSet.alpha = value;
			var len : int = _baseObjList.length;
			while (len-- > 0)
			{
				var obj : BaseObj3D = _baseObjList[len].baseObj;
				obj.alpha = value;
			}
		}

		private function setBaseObjState(baseObj : BaseObj3D) : void
		{
			baseObj.isInViewDistance = _isInViewDistance;
			baseObj.needRun = false;
			if (_isRendering)
			{
				baseObj.startRender();
			}
		}

		public function addBaseObj(baseObj : BaseObj3D) : void
		{
			var childData : BaseObjChild;
			var index : int = getChildDataIndexByObj(baseObj);
			if (index < 0)
			{
				childData = new BaseObjChild(null, baseObj, null);
				addChildDataToList(childData);
			}
			else
			{
				childData = _baseObjList[index];
			}
			//
			doWaitAddChild(childData);
			setBaseObjState(baseObj);
		}

		public function addBaseObjToUnitChild(renderUnitType : String, id : int, childName : String, baseObj : BaseObj3D) : void
		{
			if (!_renderSet)
			{
				return;
			}
			var ru : RenderUnit3D = _renderSet.getRenderUnitByID(renderUnitType, id);
			if (ru)
			{
				var childData : BaseObjChild;
				var index : int = getChildDataIndexByObj(baseObj);
				if (index < 0)
				{
					childData = new BaseObjChild(ru, baseObj, childName);
					addChildDataToList(childData);
				}
				else
				{
					childData = _baseObjList[index];
				}
				if (ru.resReady)
				{
					doWaitAddChild(childData);
				}
				else
				{
					addWaitRenderUnitChild(childData);
				}
				setBaseObjState(baseObj);
			}
		}

		private function doWaitAddChild(childData : BaseObjChild) : void
		{
			removeWaitAddObj(childData.baseObj);
			if (childData.renderUnit && childData.renderUnit.usable && childData.baseObj && childData.baseObj.usable)
			{
				childData.renderUnit.removeAddedCallBack(doUnitChildAdded);
				if (childData.childName)
				{
					var childParent : ObjectContainer3D = childData.renderUnit.getChildByName(childData.childName);
					if (childParent)
						childData.baseObj.parent = childParent;
					else
						childData.baseObj.parent = childData.renderUnit.graphicDis;
				}
				else
				{
					childData.baseObj.parent = _renderSet.graphicDis;
				}
			}
		}

		private function addWaitRenderUnitChild(childData : BaseObjChild) : void
		{
			var index : int = _waitAddObjList.indexOf(childData);
			if (index < 0)
			{
				_waitAddObjList.push(childData);
			}
			childData.renderUnit.setAddedCallBack(doUnitChildAdded, childData);
		}

		private function getChildDataIndexByObj(baseObj : BaseObj3D) : int
		{
			var childData : BaseObjChild;
			var len : int = _baseObjList.length;
			for (var i : int = len - 1; i >= 0; i--)
			{
				childData = _baseObjList[i];
				if (childData.baseObj == baseObj)
				{
					return i;
				}
			}
			return -1;
		}

		private function addChildDataToList(childData : BaseObjChild) : void
		{
			_baseObjList.push(childData);
			childData.renderUnit.setRemovedCallBack(doUnitChildRemoved, childData);
		}

		private function doUnitChildAdded(childData : BaseObjChild, ru : RenderUnit3D) : void
		{
			if (childData.renderUnit && childData.renderUnit.usable && childData.baseObj && childData.baseObj.usable)
			{
				doWaitAddChild(childData);
			}
			else
			{
				removeBaseObj(childData.baseObj);
			}
		}

		private function doUnitChildRemoved(childData : BaseObjChild, ru : RenderUnit3D) : void
		{
			removeBaseObj(ru);
		}

		private function removeWaitAddObj(baseObj : BaseObj3D) : void
		{
			var childData : BaseObjChild;
			var len : int = _waitAddObjList.length;
			for (var i : int = len - 1; i >= 0; i--)
			{
				childData = _waitAddObjList[i];
				if (childData.baseObj == baseObj)
				{
					_waitAddObjList.splice(i, 1);
					break;
				}
			}
		}

		public function removeBaseObj(baseObj : BaseObj3D) : void
		{
			removeWaitAddObj(baseObj);
			var index : int = getChildDataIndexByObj(baseObj);
			var childData : BaseObjChild = index > -1 ? _baseObjList[index] : null;
			if (childData)
			{
				if (childData.renderUnit.usable)
				{
					childData.renderUnit.removeAddedCallBack(doUnitChildAdded);
					childData.renderUnit.removeRemovedCallBack(doUnitChildRemoved);
				}
				childData.baseObj.destroy();
				childData.destroy();
				_baseObjList.splice(index, 1);
			}
		}

		public function removeBaseObjByID(id : Number, type : String) : void
		{
			var len : int = _baseObjList.length;
			while (len-- > 0)
			{
				var childData : BaseObjChild = _baseObjList[len];
				if (childData.baseObj.id == id && childData.baseObj.type == type)
				{
					removeBaseObj(childData.baseObj);
				}
			}
		}

		public function getBaseObjByID(id : Number, type : String) : BaseObj3D
		{
			var len : int = _baseObjList.length;
			while (len-- > 0)
			{
				var childData : BaseObjChild = _baseObjList[len];
				if (childData.baseObj.id == id && childData.baseObj.type == type)
				{
					return childData.baseObj;
				}
			}
			return null;
		}

		/**
		 * @private
		 * 换装
		 */
		public function get avatar() : RenderSet3D
		{
			return _renderSet;
		}

		override public function reSet($parameters : Array) : void
		{
			super.reSet(null);
			_mouseEnable = true;
			_camouflageEntity = null;
			_imposters = null;
			type = $parameters[0];
			id = $parameters[1];
			_renderSet = RenderSet3D.create(type, id);

			if (!_graphicDis)
			{
				_graphicDis = PoolEntityContainer3D.create();
			}
			_renderSet.parent = _graphicDis;
			_renderSet.mouseEnable = _mouseEnable;
			_renderSet.needRun = false;
			_renderSet.setMouseUpCallBack(handleMouseUp);
			_renderSet.setMouseDownCallBack(handleMouseDown);
			_renderSet.setMouseOverCallBack(handlerMouseOver);
			_renderSet.setMouseOutCallBack(handlerMouseOut);
			_renderSet.setMouseRightUpCallBack(handleMouseRightUp);
			_renderSet.setMouseRightDownCallBack(handleMouseRightDown);
		}

		/**
		 * 鼠标弹起
		 * @param rs
		 *
		 */
		private function handleMouseUp(e : MouseEvent3D, ru : RenderUnit3D, rs : RenderSet3D) : void
		{
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_ENTITY_MOUSE_UP, e, position, this, ru);
		}

		/**
		 * 鼠标按下
		 * @param rs
		 *
		 */
		private function handleMouseDown(e : MouseEvent3D, ru : RenderUnit3D, rs : RenderSet3D) : void
		{
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_ENTITY_MOUSE_DOWN, e, position, this, ru);
		}

		/**
		 * 鼠标滑过
		 * @param rs
		 *
		 */
		private function handlerMouseOver(e : MouseEvent3D, ru : RenderUnit3D, rs : RenderSet3D) : void
		{
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_ENTITY_MOUSE_OVER, e, position, this, ru);
		}

		/**
		 * 鼠标移出
		 * @param rs
		 *
		 */
		private function handlerMouseOut(e : MouseEvent3D, ru : RenderUnit3D, rs : RenderSet3D) : void
		{
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_ENTITY_MOUSE_OUT, e, position, this, ru);
		}

		/**
		 * 鼠标右键弹起
		 * @param rs
		 *
		 */
		private function handleMouseRightUp(e : MouseEvent3D, ru : RenderUnit3D, rs : RenderSet3D) : void
		{
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_ENTITY_MOUSE_RIGHT_UP, e, position, this, ru);
		}

		/**
		 * 鼠标右键按下
		 * @param rs
		 *
		 */
		private function handleMouseRightDown(e : MouseEvent3D, ru : RenderUnit3D, rs : RenderSet3D) : void
		{
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_ENTITY_MOUSE_RIGHT_DOWN, e, position, this, ru);
		}

		/**
		 * 对整个换装的每一项执行函数
		 * @param func 第一个参数是参数BaseEntity, 第二个参数是RenderUnit
		 *
		 */
		public function forEachRenderUnit(func : Function, args : Array = null) : void
		{
			var funcArgs : Array;
			if (args)
				funcArgs = args.concat(this);
			else
				funcArgs = [this];
			avatar.forEachRenderUnit(func, funcArgs);
		}

		override public function run(gapTm : uint) : void
		{
			super.run(gapTm);
			//更新换装
			this.avatar.run(gapTm);
			if (_baseObjList)
			{
				var i : uint = 0;
				for (i = 0; i < _baseObjList.length; i++)
				{
					var childData : BaseObjChild = _baseObjList[i];
					childData.baseObj.run(gapTm); //更新换装 
				}
			}
		}

		override public function startRender() : void
		{
			super.startRender();
			_renderSet.startRender();
			//
			var i : uint = 0;
			var childData : BaseObjChild;
			for (i = 0; i < _baseObjList.length; i++)
			{
				childData = _baseObjList[i];
				childData.baseObj.startRender();
			}
		}

		override public function stopRender() : void
		{
			super.stopRender();
			if (_renderSet)
				_renderSet.stopRender();
			//
			var i : uint = 0;
			var childData : BaseObjChild;
			for (i = 0; i < _baseObjList.length; i++)
			{
				childData = _baseObjList[i];
				childData.baseObj.stopRender();
			}
		}

		final override public function set needInViewDist(value : Boolean) : void
		{
			if (_needInViewDist != value)
			{
				super.needInViewDist = value;
				_renderSet.needInViewDist = value;
				//
				var i : uint = 0;
				var childData : BaseObjChild;
				for (i = 0; i < _baseObjList.length; i++)
				{
					childData = _baseObjList[i];
					childData.baseObj.needInViewDist = value;
				}
			}
		}

		final override public function set renderLimitable(value : Boolean) : void
		{
			if (_renderLimitable != value)
			{
				super.renderLimitable = value;
				_renderSet.renderLimitable = value;
				//
				var i : uint = 0;
				var childData : BaseObjChild;
				for (i = 0; i < _baseObjList.length; i++)
				{
					childData = _baseObjList[i];
					childData.baseObj.renderLimitable = value;
				}
			}
		}

		/**
		 * 是否在可视范围内
		 * @param value
		 */
		final override public function set isInViewDistance(value : Boolean) : void
		{
			if (_isInViewDistance != value)
			{
				super.isInViewDistance = value;
				_renderSet.isInViewDistance = value;
				//
				var i : uint = 0;
				var childData : BaseObjChild;
				for (i = 0; i < _baseObjList.length; i++)
				{
					childData = _baseObjList[i];
					childData.baseObj.isInViewDistance = value;
				}
			}
		}

		override public function set mouseEnable(value : Boolean) : void
		{
			if (_mouseEnable != value)
			{
				_mouseEnable = value;
				_renderSet.mouseEnable = _mouseEnable;
			}
		}

		public function getChildScenePositionByName(renderUnitType : String, id : int, name : String) : Vector3D
		{
			if (!_renderSet)
				return null;
			var ru : RenderUnit3D = _renderSet.getRenderUnitByID(renderUnitType, id);
			if (!ru)
				return null;
			var result : Matrix3D = ru.getChildSceneTransformByName(name);
			if (result)
			{
				return result.position;
			}
			return null;
		}

		public function getBoneScenePositionByName(renderUnitType : String, id : int, name : String) : Vector3D
		{
			if (!_renderSet)
				return null;
			var ru : RenderUnit3D = _renderSet.getRenderUnitByID(renderUnitType, id);
			if (!ru)
				return null;
			var result : Matrix3D = ru.getBoneSceneTransformByName(name);
			if (result)
			{
				return result.position;
			}
			return null;
		}

		private function toParentTransform(child : ObjectContainer3D, transform : Matrix3D) : void
		{
			if (!child)
				return;
			transform.append(child.transform);
			if (child != _graphicDis)
			{
				var parent : ObjectContainer3D = child.parent;
				toParentTransform(parent, transform);
			}
		}

		public function getChildRelativePositionByName(renderUnitType : String, id : int, name : String) : Vector3D
		{
			if (!_renderSet)
				return null;
			var ru : RenderUnit3D = _renderSet.getRenderUnitByID(renderUnitType, id);
			if (!ru)
				return null;
			var result : Matrix3D = ru.getChildSceneTransformByName(name);
			if (result)
			{
				toParentTransform(ru.parent, result);
				return result.position;
			}
			return null;
		}

		public function getBoneRelativePositionByName(renderUnitType : String, id : int, name : String) : Vector3D
		{
			if (!_renderSet)
				return null;
			var ru : RenderUnit3D = _renderSet.getRenderUnitByID(renderUnitType, id);
			if (!ru)
				return null;
			var result : Matrix3D = ru.getBoneSceneTransformByName(name);
			if (result)
			{
				toParentTransform(ru.parent, result);
				return result.position;
			}
			return null;
		}

		public function getChildScreenPositionByName(renderUnitType : String, id : int, name : String) : Point
		{
			var view : View3D = _graphicDis.scene.view;
			if (view)
			{
				var pos3D : Vector3D = getChildScenePositionByName(renderUnitType, id, name);
				if (!pos3D)
					return null;
				var pos2D : Vector3D = view.project(pos3D, Matrix3DUtils.CALCULATION_VECTOR3D);
				return new Point(pos2D.x, pos2D.z);
			}
			return null;
		}

		public function getBoneScreenPositionByName(renderUnitType : String, id : int, name : String) : Point
		{
			var view : View3D = _graphicDis.scene.view;
			if (view)
			{
				var pos3D : Vector3D = getBoneScenePositionByName(renderUnitType, id, name);
				if (!pos3D)
					return null;
				var pos2D : Vector3D = view.project(pos3D, Matrix3DUtils.CALCULATION_VECTOR3D);
				return new Point(pos2D.x, pos2D.z);
			}
			return null;
		}

		public function setRenderUseVolume(renderUnitType : String, id : int, useVolume : Boolean) : void
		{
			if (_renderSet)
			{
				if (_renderSet.volumeRender)
				{
					_renderSet.removeRenderAddedCallBack(_renderSet.volumeRender.type, _renderSet.volumeRender.id, onRenderAddedUseVolume);
				}
				_renderSet.setRenderUseVolume(renderUnitType, id, useVolume);
				if (useVolume)
				{
					_renderSet.setRenderAddedCallBack(renderUnitType, id, onRenderAddedUseVolume);
				}
				else
				{
					volumeBounds = null;
				}
			}
			else
			{
				volumeBounds = null;
			}
		}

		private function onRenderAddedUseVolume(ru : RenderUnit3D) : void
		{
			ru.removeAddedCallBack(onRenderAddedUseVolume);
			if (_renderSet && _renderSet.volumeRender)
			{
				volumeBounds = _renderSet.volumeBounds;
			}
		}

		/**
		 * 获取伪装者集合
		 */
		public function getImposters() : Vector.<BaseEntity>
		{
			return _imposters;
		}

		/**
		 * 获取伪装实体
		 */
		public function getCamouflageEntity() : BaseEntity
		{
			if (_camouflageEntity)
			{
				if (_camouflageEntity.usable)
				{
					return _camouflageEntity;
				}
				else
				{
					_camouflageEntity = null;
					if (_graphicDis)
					{
						_graphicDis.visible = true;
					}
					return null;
				}
			}
			return null;
		}

		/**
		 * 设置伪装实体
		 */
		public function setCamouflageEntity(entity : BaseEntity) : void
		{
			if (_camouflageEntity == entity)
			{
				return;
			}
			var index : int;
			if (_camouflageEntity && _camouflageEntity.usable)
			{
				_camouflageEntity.removeDisposeCallback(onCamouflageEntityDispose);
				_camouflageEntity.removeSyncInfo(this);
				this.removeSyncInfo(_camouflageEntity);

				if (_camouflageEntity._imposters)
				{
					index = _camouflageEntity._imposters.indexOf(this);
					if (index > -1)
					{
						_camouflageEntity._imposters.splice(index, 1);
					}
				}
				onRemoveCamouflageEntity();
			}
			_camouflageEntity = entity;
			if (_camouflageEntity)
			{
				var syncInfo : BaseObjSyncInfo = new BaseObjSyncInfo(this, true, true);
				_camouflageEntity.addSyncInfo(syncInfo);
				syncInfo = new BaseObjSyncInfo(_camouflageEntity, true, true);
				this.addSyncInfo(syncInfo);
				_camouflageEntity.addDisposeCallback(onCamouflageEntityDispose);

				if (!_camouflageEntity._imposters)
				{
					_camouflageEntity._imposters = new Vector.<BaseEntity>();
				}
				index = _camouflageEntity._imposters.indexOf(this);
				if (index < 0)
				{
					_camouflageEntity._imposters.push(this);
				}
				onAddCamouflageEntity();
			}
			_graphicDis.visible = (_camouflageEntity == null);
		}

		private function onCamouflageEntityDispose(obj : BaseObj3D) : void
		{
			_camouflageEntity = null;
			if (_graphicDis)
			{
				_graphicDis.visible = true;
			}
			onRemoveCamouflageEntity();
		}

		protected function onAddCamouflageEntity() : void
		{
		}

		protected function onRemoveCamouflageEntity() : void
		{
		}

		override public function dispose() : void
		{
			//标识正在释放中
			_disposing = true;
			_mouseEnable = true;
			if (_camouflageEntity)
			{
				if (_camouflageEntity.usable)
				{
					_camouflageEntity.removeDisposeCallback(onCamouflageEntityDispose);
					_camouflageEntity.removeSyncInfo(this);
					this.removeSyncInfo(_camouflageEntity);
				}
				_camouflageEntity = null;
			}
			if (_imposters)
			{
				_imposters.length = 0;
				_imposters = null;
			}

			for each (var childData : BaseObjChild in _baseObjList)
			{
				if (childData.renderUnit.usable)
				{
					childData.renderUnit.removeAddedCallBack(doUnitChildAdded);
					childData.renderUnit.removeRemovedCallBack(doUnitChildRemoved);
				}
				childData.baseObj.destroy();
				childData.destroy();
			}
			_baseObjList.length = 0;
			_waitAddObjList.length = 0;

			if (_renderSet)
			{
				_renderSet.destroy();
				_renderSet = null;
			}
			super.dispose();
		}
	}
}
