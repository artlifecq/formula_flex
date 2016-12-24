package com.editor.manager
{
	import com.editor.data.FuncTagInfo;
	import com.editor.data.RenderUnitType;
	import com.editor.display.ShapeArea3D;
	import com.editor.enum.FeaturesType;
	import com.editor.operate.DecorateEditOperate;
	import com.editor.scene.SceneRole;
	import com.editor.ui.MapMouseInfoView;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.SoftOutlineData;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.events.MouseEvent3D;
	import away3d.filters.OutlineGlowFilter3D;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 鼠标管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-23 上午11:03:17
	 *
	 */
	public class MouseManager
	{
		private static var _instance : MouseManager;

		public static function getInstance() : MouseManager
		{
			if (!_instance)
			{
				_instance = new MouseManager();
			}
			return _instance;
		}
		private static var _outlineData : SoftOutlineData = new SoftOutlineData(0xFFFF00, 0.8, 0.005, 5);
		private static var _previewOutlineDatas : Array = [];
		private static var _previewOutlineIndex : int = 0;

		public static function setOutlineData(size : Number = 4, strength : Number = 1, quality : int = 3, enemyColor : uint = 0xFF0000, friendColor : uint = 0x00FF00, neutralColor : uint = 0xFFFF00) : void
		{
			var outlineGlowFilter : OutlineGlowFilter3D = new OutlineGlowFilter3D(size, strength, quality);
			SceneManager.getInstance().mainScene.setOutlineGlowFilter(outlineGlowFilter);
			_previewOutlineIndex = 0;
			_previewOutlineDatas.length = 0;
			_previewOutlineDatas.push(new SoftOutlineData(enemyColor));
			_previewOutlineDatas.push(new SoftOutlineData(friendColor));
			_previewOutlineDatas.push(new SoftOutlineData(neutralColor));
		}

		/**
		 * @private
		 * 鼠标在上面的角色
		 */
		private var _mouseOverRole : SceneRole;
		private var _measureShapeArea3D : ShapeArea3D;
		private var _measureStartPos : Point = null;

		public function MouseManager()
		{
		}

		public function setup(stage : Stage) : void
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, onStageMouseUp);
			//注册场景交互事件
			EventManager.addEvent(SceneEvent.INTERACTIVE, onSceneInteractive);
		}

		private function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			position = position.clone();
			position.x = int(position.x);
			position.y = int(position.y);
			position.z = int(position.z);
			switch (action)
			{
				case SceneEventAction3D.SCENE_MAP_MOUSE_UP: //点击场景
					sceneMapUp(position);
					break;
				case SceneEventAction3D.SCENE_MAP_MOUSE_DOWN: //点击场景
					sceneMapDown(position);
					break;
				case SceneEventAction3D.SCENE_MAP_MOUSE_MOVE: //点击场景
					sceneMapMove(position);
					break;
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_DOWN: //点击实体
					sceneEntityClick(position, currTarget, target);
					break;
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_OVER: //滑过实体
					sceneEntityOver(position, currTarget, target);
					break;
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_OUT: //移出实体
					sceneEntityOut(position, currTarget, target);
					break;
			}
		}

		private function sceneMapUp(position : Vector3D) : void
		{
			_measureStartPos = null;
			if (_measureShapeArea3D)
			{
				_measureShapeArea3D.dispose();
				_measureShapeArea3D = null;
			}
		}

		private function onStageMouseUp(e : MouseEvent) : void
		{
			sceneMapUp(null);
		}

		private function sceneMapDown(position : Vector3D) : void
		{
			AppManager.getInstance().appRoot.stage.focus = null;
			if (MapMouseInfoView.window)
				MapMouseInfoView.window.setMousePosition(position);

			var currTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedFuncTag;
			if (currTag && currTag.featureType != FeaturesType.STORY_TYPE)
			{
                var p : Vector3D = position.clone();
                p.z = position.y;
                p.y = 0;
				var isOperated : Boolean = DecorateEditOperate.sceneMapClick(p);
				if (!isOperated)
				{
					SceneRoleManager.getInstance().targetPos = p;
				}
			}

			if (SceneManager.getInstance().cameraOpen)
			{
				_measureStartPos = new Point(position.x, position.y);
			}
		}

		private function sceneMapMove(position : Vector3D) : void
		{
			if (SceneManager.getInstance().cameraOpen)
			{
				if (SceneManager.getInstance().cameraOpen)
				{
					if (_measureShapeArea3D)
					{
						_measureShapeArea3D.dispose();
						_measureShapeArea3D = null;
					}
					if (_measureStartPos)
					{
						var dist : Number = MathUtil.getDistance(_measureStartPos.x, _measureStartPos.y, position.x, position.y);
						var angle : Number = MathUtil.getAngle(_measureStartPos.x, _measureStartPos.y, position.x, position.y);
						_measureShapeArea3D = new ShapeArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer);
						_measureShapeArea3D.updateFill(_measureStartPos.x, 0, _measureStartPos.y, 0xff0000, 1, dist, 100, 1, 0, 0, angle, 1);

						if (MapMouseInfoView.window)
							MapMouseInfoView.window.setMeasureSize(dist);
					}
				}
			}
			else
			{
				if (_measureShapeArea3D)
				{
					_measureShapeArea3D.dispose();
					_measureShapeArea3D = null;
				}
			}
		}

		private function sceneEntityClick(position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			var isOperated : Boolean = DecorateEditOperate.sceneEntityClick(currTarget as SceneRole);
		}

		private function sceneEntityOver(position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			if (!currTarget.usable)
				return;
			if (_mouseOverRole == currTarget)
				return;
			if (currTarget is SceneRole)
			{
				if (_mouseOverRole && _mouseOverRole.usable)
					_mouseOverRole.forEachRenderUnit(setRoleMouseOut);
				_mouseOverRole = currTarget as SceneRole;
				if (_mouseOverRole && _mouseOverRole.usable)
					_mouseOverRole.forEachRenderUnit(setRoleMouseOver);
				else
					_mouseOverRole = null;
			}
		}

		private function sceneEntityOut(position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			if (currTarget == _mouseOverRole)
			{
				if (_mouseOverRole && _mouseOverRole.usable)
					_mouseOverRole.forEachRenderUnit(setRoleMouseOut);
				_mouseOverRole = null;
			}
		}

		/**设置鼠标滑进*/
		private function setRoleMouseOver(role : SceneRole, ru : RenderUnit3D) : void
		{
			switch (ru.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.MOUNT:
					if (role == SceneRoleManager.getInstance().unitTestEntity)
					{
						if (_previewOutlineIndex >= _previewOutlineDatas.length)
							_previewOutlineIndex = 0;
						ru.setSoftOutline(_previewOutlineDatas[_previewOutlineIndex]);
						_previewOutlineIndex++;
					}
					else
					{
						ru.setSoftOutline(_outlineData);
					}
					break;
			}
		}

		/**设置鼠标划出*/
		private function setRoleMouseOut(role : SceneRole, ru : RenderUnit3D) : void
		{
			switch (ru.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.MOUNT:
					ru.setSoftOutline(null);
					break;
			}
		}
	}
}
