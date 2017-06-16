package com.game.engine3D.scene.render
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.core.poolObject.PoolContainer3D;
	import com.game.engine3D.core.poolObject.PoolEntityContainer3D;
	import com.game.engine3D.scene.render.vo.MethodData;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.scene.render.vo.RenderUnitChild;
	import com.game.engine3D.scene.render.vo.RenderUnitSyncInfo;
	import com.game.engine3D.utils.CallBackUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.CallBackData;
	
	import flash.geom.Matrix3D;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.core.math.Matrix3DUtils;
	import away3d.events.MouseEvent3D;
	import away3d.materials.lightpickers.LightPickerBase;

	/**
	 *
	 * 3D单元渲染集合
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午1:26:38
	 *
	 */
	public class RenderSet3D extends BaseObj3D
	{
		//---------------------------对象池---------------------------
		private static var _cnt : int = 0;

		private static var _pool : InstancePool = new InstancePool("RenderSet3D", 1000);

		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create(type : String, id : Number,is25D:Boolean=false) : RenderSet3D
		{
			_cnt++;
			//利用池生成
			return _pool.createObj(RenderSet3D, type, id,is25D) as RenderSet3D;
		}

		public static function recycle(rs : RenderSet3D) : void
		{
			if (!rs || rs.isInPool)
				return;
			_cnt--;
			//利用池回收
			_pool.recycleObj(rs);
		}

		public static function get cnt() : int
		{
			return _cnt;
		}

		//------------------------------------------------------------

		/**
		 * 换装部件集合
		 */
		private var _renderUnitMap : Dictionary;
		private var _renderUnitRef : Dictionary;
		/** 灯光 **/
		private var _lightPicker : LightPickerBase;
		private var _useLight : Boolean;
		private var _shareMaterials : Boolean;
		private var _syncInfos : Dictionary;
		private var _volumeRender : RenderUnit3D;
		
		private var _secondStatusRender : RenderUnit3D;
		private var _secondStatusGetter : Function = null;

		private var _mouseUpCallBackList : Vector.<CallBackData>;
		private var _mouseDownCallBackList : Vector.<CallBackData>;
		private var _mouseOverCallBackList : Vector.<CallBackData>;
		private var _mouseOutCallBackList : Vector.<CallBackData>;
		private var _mouseRightUpCallBackList : Vector.<CallBackData>;
		private var _mouseRightDownCallBackList : Vector.<CallBackData>;
		private var _methodDatas : Vector.<MethodData>;
		
		private var _is25D:Boolean=false;

		public function RenderSet3D(type : String, id : Number,is25D:Boolean=false)
		{
			super([type, id,is25D]);
			_syncInfos = new Dictionary();
			_renderUnitMap = new Dictionary();
			_renderUnitRef = new Dictionary();
			_methodDatas = new Vector.<MethodData>();
		}
		
		public function addMethod(methodData : MethodData) : void
		{
			if (_methodDatas)
			{
				if (_methodDatas.indexOf(methodData) == -1)
				{
					_methodDatas.push(methodData);
				}
				for(var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.addMethod(methodData);
				}
			}
		}
		
		public function removeMethod(methodData : MethodData) : void
		{
			if (_methodDatas)
			{
				if (_methodDatas.length > 0)
				{
					var index : int = _methodDatas.indexOf(methodData);
					if (index != -1)
					{
						_methodDatas.splice(index, 1);
					}
				}
				for(var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.removeMethod(methodData);
				}
			}
		}
		
		public function removeAllMethods() : void
		{
			if (_methodDatas)
			{
				for each (var methodData : MethodData in _methodDatas)
				{
					for (var ru : RenderUnit3D in _renderUnitMap)
					{
						ru.removeMethod(methodData);
					}
				}
				_methodDatas.length = 0;
			}
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

		//加载、添加、删除-------------------------------------------------------------------------------------------------------------------
		/**
		 * 添加指定的显示对象到对应的合成配件上
		 * @param value
		 * @param obj
		 * @return
		 *
		 */
		public function addRenderUnitToComposite(renderUnitType : String, id : int, rpd : RenderParamData3D, compositeIndex : int = 0, boneName : String = null) : RenderUnit3D
		{
			//清空同种类型换装
			if (rpd.clearSameType)
			{
				removeRenderUnitsByType(rpd.type); //注意后面的参数
			}
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (ru)
			{
				var childRu : RenderUnit3D = createRenderUnit(rpd);
				ru.addUnitAtComposite(childRu, compositeIndex, boneName);
				return childRu;
			}
			return null;
		}

		/**
		 * 添加指定的显示对象到对应的挂接点上
		 * @param value
		 * @param obj
		 * @return
		 *
		 */
		public function addRenderUnitToJoint(renderUnitType : String, id : int, childName : String, rpd : RenderParamData3D, compositeIndex : int = 0) : RenderUnit3D
		{
			//清空同种类型换装
			if (rpd.clearSameType)
			{
				removeRenderUnitsByType(rpd.type); //注意后面的参数
			}
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (ru)
			{
				var childRu : RenderUnit3D = createRenderUnit(rpd);
				ru.addUnitAtJoint(childRu, childName, compositeIndex);
				return childRu;
			}
			return null;
			/*if (childName)
			{
				var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
				if (ru)
				{
					var childRu : RenderUnit3D = createRenderUnit(rpd, _graphicDis);
					ru.addUnitAtJoint(childRu, childName, compositeIndex);
					return childRu;
				}
			}
			else
			{
				//清除同ID
				removeRenderUnitByID(rpd.type, rpd.id);
			}*/
			return null;
		}

		/**
		 * 添加指定的显示对象到对应的骨胳上
		 * @param value
		 * @param obj
		 * @return
		 *
		 */
		public function addRenderUnitToBone(renderUnitType : String, id : int, boneName : String, rpd : RenderParamData3D) : RenderUnit3D
		{
			//清空同种类型换装
			if (rpd.clearSameType)
			{
				removeRenderUnitsByType(rpd.type); //注意后面的参数
			}
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (ru)
			{
				var childRu : RenderUnit3D = createRenderUnit(rpd);
				ru.addUnitAtBone(childRu, boneName);
				return childRu;
			}
			return null;
		}

		/**
		 * 添加指定的显示对象到对应的虚拟挂节点上
		 * @param value
		 * @param obj
		 * @return
		 *
		 */
		public function addRenderUnitToChild(renderUnitType : String, id : int, childName : String, rpd : RenderParamData3D, meshIndex : int = -1) : RenderUnit3D
		{
			//清空同种类型换装
			if (rpd.clearSameType)
			{
				removeRenderUnitsByType(rpd.type); //注意后面的参数
			}
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (ru)
			{
				var childRu : RenderUnit3D = createRenderUnit(rpd);
				ru.addUnitAtChild(childRu, childName, meshIndex);
				return childRu;
			}
			return null;
		}

		/**
		 * 添加指定的显示对象到对应的单元上
		 * @param value
		 * @param obj
		 * @return
		 *
		 */
		public function addRenderUnitToUnit(renderUnitType : String, renderUnitId : int, rpd : RenderParamData3D) : RenderUnit3D
		{
			//清空同种类型换装
			if (rpd.clearSameType)
			{
				removeRenderUnitsByType(rpd.type); //注意后面的参数
			}
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, renderUnitId);
			if (ru)
			{
				var childRu : RenderUnit3D = createRenderUnit(rpd);
				ru.addUnitChild(childRu);
				return childRu;
			}
			return null;
		}
		
		public function addUnitChildData(renderUnitType : String, renderUnitId : int, childData : RenderUnitChild) : RenderUnit3D
		{
			var childRu : RenderUnit3D = childData.renderUnit;
			var compositeIndex : int = childData.compositeIndex;
			var boneName : String = childData.boneName;
			var childName : String = childData.childName;
			var meshIndex : int = childData.meshIndex;
			var renderUnit : RenderUnit3D = childData.renderUnit;

			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, renderUnitId);
			if (ru)
			{
				if (compositeIndex > -1)
				{
					ru.addUnitAtJoint(renderUnit, boneName, compositeIndex);
				}
				else if (boneName)
				{
					ru.addUnitAtBone(renderUnit, boneName);
				}
				else if (meshIndex > -1)
				{
					ru.addUnitAtChild(renderUnit, childName, meshIndex);
				}
				else if (childName)
				{
					ru.addUnitAtChild(renderUnit, childName);
				}
				else
				{
					ru.addUnitChild(renderUnit);
				}
				return childRu;
			}
			return null;
		}
		
		public function getUnitChildDatasByName(renderUnitType : String, renderUnitId : int, childName : String) : Vector.<RenderUnitChild>
		{
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, renderUnitId);
			if (ru && ru.usable)
			{
				var datas : Vector.<RenderUnitChild> = new Vector.<RenderUnitChild>();
				var childUnitList : Vector.<RenderUnitChild> = ru.getUnitChildDatas();
				for each (var unitChild : RenderUnitChild in childUnitList)
				{
					if (unitChild.childName == childName || unitChild.boneName == childName)
					{
						datas.push(unitChild);
					}
				}
				return datas;
			}
			return null;
		}

		private function createRenderUnit(rpd : RenderParamData3D) : RenderUnit3D
		{
			var ru : RenderUnit3D = getRenderUnitByID(rpd.type, rpd.id, false);
			if (!ru)
			{
				ru = RenderUnit3D.create(rpd,false); //创建一个新的
				ru.staticGraphicDis = this._staticGraphicDis;
			}
			ru.setRenderParamData(rpd);
			ru.shareMaterials = _shareMaterials;
			ru.lightPicker = _lightPicker;
			ru.useLight = _useLight;
			ru.isInViewDistance = _isInViewDistance;
			ru.mouseEnable = rpd.mouseEnable && _mouseEnable;
			ru.blendMode = _blendMode;
			ru.alpha = _alpha;
			ru.zOffset = _zOffset;
			ru.planarRenderLayer = _planarRenderLayer;
			ru.needRun = false;
			for each (var methodData : MethodData in _methodDatas)
			{
				ru.addMethod(methodData);
			}
			ru.setMouseUpCallBack(handleMouseUp);
			ru.setMouseDownCallBack(handleMouseDown);
			ru.setMouseOverCallBack(handlerMouseOver);
			ru.setMouseOutCallBack(handlerMouseOut);
			ru.setMouseRightUpCallBack(handleMouseRightUp);
			ru.setMouseRightDownCallBack(handleMouseRightDown);
			ru.setRemovedCallBack(doRenderUnitRemoved);
			if (_isRendering)
			{
				ru.startRender();
			}
			if (rpd.useSecondStatus)//使用二套动作的单元
			{
				ru.secondStatusGetter = null;
				_secondStatusRender = ru;
				for (var otherRu : RenderUnit3D in _renderUnitMap)
				{
					if (otherRu == _secondStatusRender)
					{
						continue;
					}
					if (_secondStatusRender.resReady)
					{
						otherRu.secondStatusGetter = _secondStatusGetter;
					}
				}
			}
			else if (_secondStatusRender) //其他单元
			{
				if (ru == _secondStatusRender)
				{
					ru.secondStatusGetter = null;
				}
				else
				{
					if (_secondStatusRender.resReady)
					{
						ru.secondStatusGetter = _secondStatusGetter;
					}
				}
			}
			if (_secondStatusRender && !_secondStatusRender.resReady)
			{
				_secondStatusRender.setAddedCallBack(doSetsecondStatusGetter);
			}
			//添加进表
			var obj:Object = _renderUnitRef[rpd.type] ||= new Object();
			obj[rpd.id] = ru;
			_renderUnitMap[ru] = true;
			return ru;
		}
		
		private function getRenderUnitRef(type:String, id:int) : RenderUnit3D
		{
			var obj:Object = _renderUnitRef[type];
			if (obj)
			{
				return obj[id] as RenderUnit3D;
			}
			return null;
		}
		
		private function deleteRenderUnit(ru:RenderUnit3D) : void
		{
			var obj:Object = _renderUnitRef[ru.type];
			var rId:String = String(ru.id);
			if (rId in obj)
			{
				delete obj[rId];
				delete _renderUnitMap[ru];
			}
		}
		
		private function doSetsecondStatusGetter(ru : RenderUnit3D) : void
		{
			if (ru != _secondStatusRender)
			{
				return;
			}
			for (var otherRu : RenderUnit3D in _renderUnitMap)
			{
				if (otherRu == _secondStatusRender)
				{
					continue;
				}
				otherRu.secondStatusGetter = _secondStatusGetter;
			}
		}

		private function doRenderUnitRemoved(ru : RenderUnit3D) : void
		{
		}

		private function recycleRenderUnit(ru : RenderUnit3D, recycle : Boolean = true) : void
		{
			deleteRenderUnit(ru);
			ru.restoreAllChildUnits();
			ru.removeMouseUpCallBack(handleMouseUp);
			ru.removeMouseDownCallBack(handleMouseDown);
			ru.removeMouseOverCallBack(handlerMouseOver);
			ru.removeMouseOutCallBack(handlerMouseOut);
			ru.removeMouseRightUpCallBack(handleMouseRightUp);
			ru.removeMouseRightDownCallBack(handleMouseRightDown);
			ru.removeRemovedCallBack(doRenderUnitRemoved);
			ru.parent = null;
			ru.stopRender();
			if (_volumeRender == ru)
			{
				_volumeRender = null;
			}
			if (_secondStatusRender == ru)
			{
				_secondStatusRender.removeAddedCallBack(doSetsecondStatusGetter);
				_secondStatusRender = null;
				for (var otherRu : RenderUnit3D in _renderUnitMap)
				{
					otherRu.secondStatusGetter = null;
				}
			}
			//执行remove回调,回收renderUnit
			if (recycle)
			{
				ru.destroy();
			}
		}

		/**
		 * 鼠标弹起
		 * @param ru
		 *
		 */
		private function handleMouseUp(e : MouseEvent3D, ru : RenderUnit3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseUpCallBackList, e, ru);
		}

		/**
		 * 鼠标按下
		 * @param ru
		 *
		 */
		private function handleMouseDown(e : MouseEvent3D, ru : RenderUnit3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseDownCallBackList, e, ru);
		}

		/**
		 * 鼠标滑过
		 * @param ru
		 *
		 */
		private function handlerMouseOver(e : MouseEvent3D, ru : RenderUnit3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseOverCallBackList, e, ru);
		}

		/**
		 * 鼠标移出
		 * @param ru
		 *
		 */
		private function handlerMouseOut(e : MouseEvent3D, ru : RenderUnit3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseOutCallBackList, e, ru);
		}

		/**
		 * 鼠标右键弹起
		 * @param ru
		 *
		 */
		private function handleMouseRightUp(e : MouseEvent3D, ru : RenderUnit3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseRightUpCallBackList, e, ru);
		}

		/**
		 * 鼠标右键按下
		 * @param ru
		 *
		 */
		private function handleMouseRightDown(e : MouseEvent3D, ru : RenderUnit3D) : void
		{
			CallBackUtil.exceteCallBackData(this, _mouseRightDownCallBackList, e, ru);
		}

		/**
		 * 添加一项RenderUnit
		 *  @param apd 换装数据 如果apd==null，则创建一个空RenderParamData
		 */
		public function addRenderUnit(rpd : RenderParamData3D) : RenderUnit3D
		{
			//清空同种类型换装
			if (rpd.clearSameType)
			{
				removeRenderUnitsByType(rpd.type); //注意后面的参数
			}
			var ru : RenderUnit3D = createRenderUnit(rpd);
			ru.parent = _graphicDis;
			return ru;
		}

		/**
		 * 移除一项RenderUnit(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param renderUnit
		 * @param clearSameType 是否清空同种类型的换装
		 */
		public function removeRenderUnit(renderUnit : RenderUnit3D, clearSameType : Boolean = false, recycle : Boolean = true) : void
		{
			//清空同种状态换装
			if (clearSameType)
			{
				removeRenderUnitsByType(renderUnit.type, recycle);
			}
			else
			{
				recycleRenderUnit(renderUnit, recycle);
				renderUnit = null;
			}
		}

		/**
		 * 移除指定ID的RenderUnit(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param $renderUnitID 换装类型
		 */
		public function removeRenderUnitByID(renderUnitType : String, renderUnitID : int) : void
		{
			if (renderUnitType == null || renderUnitType == "")
				return; //注意这个判断
			
			//检查换装内
			var ru : RenderUnit3D = getRenderUnitRef(renderUnitType, renderUnitID);
			if (ru)
			{
				recycleRenderUnit(ru);
				ru = null;
			}
		}

		/**
		 * 移除指定类型的RenderUnit(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param renderUnitType 换装类型
		 */
		public function removeRenderUnitsByType(renderUnitType : String, recycle : Boolean = true) : void
		{
			if (renderUnitType == null || renderUnitType == "")
				return; //注意这个判断
			
			//检查换装内
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				if (ru.type == renderUnitType)
				{
					recycleRenderUnit(ru, recycle);
				}
				ru = null;
			}
		}

		/**
		 * 移除所有RenderUnit((此函数执行后,不会检查主体换装是否存在)
		 */
		public function removeAllRenderUnits(recycle : Boolean = true) : void
		{
			//检查换装内
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				recycleRenderUnit(ru, recycle);
				ru = null;
			}
			_volumeRender = null;
			if (_secondStatusRender)
			{
				_secondStatusRender.removeAddedCallBack(doSetsecondStatusGetter);
				_secondStatusRender = null;
			}
		}

		/**
		 * 是否有指定ID的换装
		 * @param id 换装ID
		 */
		public function hasIDRenderUnit(type : String, id : int, checkResReady : Boolean = false) : Boolean
		{
			var ru : RenderUnit3D = getRenderUnitRef(type,id);
			if (ru && ((!checkResReady) || ru.resReady))
			{
				return true;
			}
			return false;
		}

		/**
		 * 是否有指定类型的换装
		 * @param type 换装类型
		 */
		public function hasTypeRenderUnits(type : String, checkResReady : Boolean = false) : Boolean
		{
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				if (ru.type == type && ((!checkResReady) || ru.resReady))
				{
					return true;
				}
			}
			return false;
		}

		/**
		 * 是否有相同的（主要指ID和样式）换装
		 * @param rpd 换装RPD
		 * 注意：不检测回调
		 */
		public function hasSameRenderUnit(rpd : RenderParamData3D, checkResReady : Boolean = false) : Boolean
		{
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				var apd : RenderParamData3D = ru.renderParamData;
				if (apd && apd.equals(rpd) && ((!checkResReady) || ru.resReady))
				{
					return true;
				}
			}
			return false;
		}

		/**
		 * 是否有某个换装
		 * @param ru 换装RU
		 * 注意：不检测回调
		 */
		public function hasRenderUnit(ru : RenderUnit3D, checkResReady : Boolean = false) : Boolean
		{
			var currRu : RenderUnit3D = getRenderUnitRef(ru.type, ru.id);
			if (currRu)
			{
				if (checkResReady)
					return ru.resReady;
				return true;
			}
			return false;
		}

		/**
		 * 查找指定ID的RenderUnit
		 * @param id 换装ID
		 */
		public function getRenderUnitByID(renderUnitType : String, id : int, checkResReady : Boolean = false) : RenderUnit3D
		{
			var ru : RenderUnit3D = getRenderUnitRef(renderUnitType, id);
			if (ru && ((!checkResReady) || ru.resReady))
			{
				return ru;
			}
			return null;
		}

		/**
		 * 获取指定类型的RenderUnit数组
		 * @param renderUnitType 换装类型
		 */
		public function getRenderUnitsByType(renderUnitType : String, checkResReady : Boolean = false) : Array
		{
			var arr : Array = [];
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				if (ru.type == renderUnitType && ((!checkResReady) || ru.resReady))
				{
					arr.push(ru);
				}
			}
			return arr;
		}

		/**
		 * 获取所有RenderUnit数组
		 */
		public function getAllRenderUnits(checkResReady : Boolean = false) : Array
		{
			var arr : Array = [];
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				if ((!checkResReady) || ru.resReady)
				{
					arr.push(ru);
				}
			}
			return arr;
		}

		//运行相关
		//-----------------------------------------------------------------------------------------------------------
		/**
		 * 对整个换装的每一项执行函数
		 * @param func 第一个参数是参数sceneCharacter, 第二个参数是RenderUnit
		 *
		 */
		public function forEachRenderUnit(func : Function, args : Array = null) : void
		{
//			var len : uint = 0;
//			var funcArgs : Array = args;
//			if (funcArgs)
//				len = args.length;
//			
//			//检查换装内
//			for (var ru : RenderUnit3D in _renderUnitMap)
//			{
//				if (len > 0)
//					funcArgs[len] = ru;
//				else
//					funcArgs = [ru];
//				
//				func.apply(func, funcArgs);
//			}
			var funcArgs : Array = args;
			var index:int = 0;
			if (funcArgs)
			{
				index = funcArgs.length;
			}
			else{
				funcArgs = [];
				index = 0;
			}
			//检查换装内
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				funcArgs[index] = ru;
				func.apply(func, funcArgs);
			}
		}

		/**
		 * 运行逻辑
		 * @parma frame 帧 为0则走渲染计时计算的帧，否则选择此参数指定的帧
		 */
		override final public function run(gapTm : uint) : void
		{
			super.run(gapTm);
			//运行逻辑
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				if (ru.usable)
				{
					if (ru.visible)
					{
						//运行逻辑
						ru.run(gapTm);
					}
				}
				else
				{
					removeRenderUnit(ru);
				}
			}
		}

		/**
		 * 是否在可视范围内
		 * @param value
		 */
		override public function set isInViewDistance(value : Boolean) : void
		{
			if (_isInViewDistance != value)
			{
				super.isInViewDistance = value;
				for (var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.isInViewDistance = value;
				}
			}
		}

		override final public function startRender() : void
		{
			super.startRender();
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				ru.startRender();
			}
		}

		override final public function stopRender() : void
		{
			super.stopRender();
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				ru.stopRender();
			}
		}

		override final public function set needInViewDist(value : Boolean) : void
		{
			if (_needInViewDist != value)
			{
				super.needInViewDist = value;
				for (var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.needInViewDist = value;
				}
			}
		}

		override final public function set renderLimitable(value : Boolean) : void
		{
			if (_renderLimitable != value)
			{
				super.renderLimitable = value;
				for (var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.renderLimitable = value;
				}
			}
		}

		public function set lightPicker(value : LightPickerBase) : void
		{
			if (_lightPicker != value)
			{
				_lightPicker = value;
				for (var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.lightPicker = value;
				}
			}
		}

		public function set useLight(value : Boolean) : void
		{
			if (_useLight != value)
			{
				_useLight = value;
				for (var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.useLight = value;
				}
			}
		}

		public function set shareMaterials(value : Boolean) : void
		{
			if (_shareMaterials != value)
			{
				_shareMaterials = value;
				for (var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.shareMaterials = value;
				}
			}
		}

		override public function set mouseEnable(value : Boolean) : void
		{
			if (_mouseEnable != value)
			{
				_mouseEnable = value;
				for (var ru : RenderUnit3D in _renderUnitMap)
				{
					ru.mouseEnable = ru.renderParamData.mouseEnable && _mouseEnable;
				}
			}
		}
		
		public function get secondStatusGetter() : Function
		{
			return _secondStatusGetter;
		}
		
		public function set secondStatusGetter(value : Function) : void
		{
			_secondStatusGetter = value;
		}

		/**
		 * 获取换装RenderUnit数量
		 */
		/*public function get length() : int
		{
			return _renderUnitList.length;
		}*/

		public function getChildScenePositionByName(renderUnitType : String, id : int, name : String) : Vector3D
		{
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
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
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (!ru)
				return null;
			var result : Matrix3D = ru.getBoneSceneTransformByName(name);
			if (result)
			{
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

		public function getChildRelativePositionByName(renderUnitType : String, id : int, name : String) : Vector3D
		{
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (!ru)
				return null;
			var result : Matrix3D = ru.getChildSceneTransformByName(name);
			if (result)
			{
				result.append(transform);
				return result.position;
			}
			return null;
		}

		public function getBoneRelativePositionByName(renderUnitType : String, id : int, name : String) : Vector3D
		{
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (!ru)
				return null;
			var result : Matrix3D = ru.getBoneSceneTransformByName(name);
			if (result)
			{
				result.append(transform);
				return result.position;
			}
			return null;
		}

		public function setRenderUseVolume(renderUnitType : String, id : int, useVolume : Boolean) : void
		{
			if (_volumeRender)
			{
				_volumeRender.useVolume = false;
				_volumeRender = null;
				volumeBounds = null;
			}
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (ru)
			{
				_volumeRender = ru;
				_volumeRender.useVolume = useVolume;
				volumeBounds = _volumeRender.volumeBounds;
			}
		}

		public function get volumeRender() : RenderUnit3D
		{
			return _volumeRender;
		}

		public function setRenderAddedCallBack(renderUnitType : String, id : int, value : Function, ... args) : void
		{
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (ru)
			{
				ru.setAddedCallBack.apply(null, [value].concat(args));
			}
		}

		public function removeRenderAddedCallBack(renderUnitType : String, id : int, value : Function) : void
		{
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (ru)
			{
				ru.removeAddedCallBack(value);
			}
		}

		/**
		 * 创建某个渲染单元的快照 
		 * @param renderUnitType
		 * @param id
		 * 
		 */		
		public function buildSyncInfo(renderUnitType : String, id : int) : void
		{
			var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
			if (!ru)
				return;
			var info : RenderUnitSyncInfo = ru.buildSyncInfo();
			if (info)
			{
				var obj:Object = _syncInfos[renderUnitType] ||= new Object();
				obj[id] = info;
			}
		}

		/**
		 * 执行某个渲染单元的快照 
		 * @param renderUnitType
		 * @param id
		 * 
		 */		
		public function applySyncInfo(renderUnitType : String, id : int) : void
		{
			var obj:Object = _syncInfos[renderUnitType];
			if (!obj)return;
			
			var info : RenderUnitSyncInfo = obj[id] as RenderUnitSyncInfo;
			if (info)
			{
				obj[id] = null;
				delete obj[id];
				var ru : RenderUnit3D = getRenderUnitByID(renderUnitType, id);
				if (!ru)
					return;
				ru.applySyncInfo(info);
				info.destroy();
			}
		}
		
		override public function set alpha(value:Number):void
		{
			super.alpha = value;
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				ru.alpha = value;
			}
		}
		
		override public function set blendMode(value:String):void
		{
			super.blendMode = value;
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				ru.blendMode = value;
			}
		}
		
		override public function set zOffset(value : int) : void
		{
			super.zOffset = value;
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				ru.zOffset = value;
			}
		}
		
		override public function set depth(value : int) : void
		{
			super.depth = value;
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				ru.depth = value;
			}
		}
		
		public function set castsShadows(value : Boolean) : void
		{
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				ru.castsShadows = value;
			}
		}
		
		override public function set planarRenderLayer(value : uint) : void
		{
			super.planarRenderLayer = value;
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				ru.planarRenderLayer = value;
			}
		}
		
		public function hasEntity(entity : ObjectContainer3D) : Boolean
		{
			for (var ru : RenderUnit3D in _renderUnitMap)
			{
				if (ru.graphicDis.contains(entity))
					return true;
			}
			return false;
		}
		
		override public function reSet($parameters : Array) : void
		{
			super.reSet(null);
			//
			type = $parameters[0];
			id = $parameters[1];
			_is25D = $parameters[2];
			if (!_graphicDis)
			{
                if (_is25D) {
				    _graphicDis = PoolEntityContainer3D.create();
                } else {
				    _graphicDis = PoolContainer3D.create();
                }
			}
			_shareMaterials = true;
			_lightPicker = null;
			_useLight = false;
			_volumeRender = null;
			_secondStatusRender = null;
			_secondStatusGetter = null;
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
			_lightPicker = null;
			_useLight = false;
			_shareMaterials = false;
			var key : String;
			if (_syncInfos)
			{
				for (key in _syncInfos)
				{
					var obj:Object = _syncInfos[key];
					if (!obj)return;
					
					var info : RenderUnitSyncInfo = obj[id] as RenderUnitSyncInfo;
//					var info : RenderUnitSyncInfo = _syncInfos[key];
					if (info)
					{
						_syncInfos[key] = null;
						delete _syncInfos[key];
						info.destroy();
					}
				}
			}
			_volumeRender = null;
			_secondStatusRender = null;
			_secondStatusGetter = null;
			
			if (_methodDatas)
			{
				_methodDatas.length = 0;
			}
			//回收所有换装
			removeAllRenderUnits();

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
			super.dispose();
		}
	}
}
