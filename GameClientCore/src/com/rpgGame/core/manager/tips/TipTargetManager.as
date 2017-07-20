package com.rpgGame.core.manager.tips
{
	import com.rpgGame.core.view.ui.tip.implement.IBaseTipsInfo;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import away3d.events.Event;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * <font color=#FF0000><b>tips鼠标交互管理器</b></font></br>
	 * <font color=#FF0000><b>TipTargetManager的作用是决定tips能不能产生</b></font></br>
	 * <font color=#FF0000><b>此管理器根据玩家的操作判断显示对象上面tips的添加、移除以及tips鼠标跟随的操作</b></font></br>
	 * @author Wing
	 */
	public class TipTargetManager
	{
		/****************************统一管理的时间节点*********************************************/
		private static var _tipDatas : HashMap = new HashMap();
		private static var _currentMouseTarget : DisplayObject;

		/**记录光标当前所在的位置*/
		public static var stagePoint : Point = new Point();

		private static var isMouseOut : Boolean = true;

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////                                         public
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 * 开启tips显示
		 */
		public static function setup() : void
		{
			Starling.current.nativeStage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveEventHandler);
			Starling.current.nativeStage.addEventListener(MouseEvent.CLICK, onMouseClickEventHandler);
		}

		/**
		 * 关闭tips显示
		 */
		public static function stop() : void
		{
			Starling.current.nativeStage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveEventHandler);
		}

		/**
		 * 为指定UI添加TIPS
		 * @param target		要添加TIPS的Ui组件
		 * @param info			tips所用数据，里面包括了，tips类型，数据，位置等 ——————这个数据可以在 TargetTipsMaker 类里构造得到
		 */
		public static function show(target : DisplayObject, info : IBaseTipsInfo) : void
		{
//			return;
			if (target != null)
			{
				if (_tipDatas.getValue(target) == info)
				{
					return;
				}
				else if (_tipDatas.getValue(target) != null)
				{
					trace(target, "====================》为什么给这东西又添加了一次TIPS，会覆盖掉次一次的");
				}
				else
				{
					target.addEventListener(TouchEvent.TOUCH, onTouch);
					target.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
				}
				_tipDatas.add(target, info);
			}
		}

		/**
		 * 移除显示对象的tips功能
		 * @param target
		 */
		public static function remove(target : DisplayObject) : void
		{
			if (null == target)
				return;

			if (_currentMouseTarget == target)
			{
				_currentMouseTarget = null;
				TipManager.remove();
			}

			target.removeEventListener(TouchEvent.TOUCH, onTouch);
			target.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			_tipDatas.remove(target);
		}

		public static function hasTipsEventListener(target : DisplayObject) : Boolean
		{
			return _tipDatas.containsKey(target);
		}
		
		public static function getTiipsByTarget(target:DisplayObject):*
		{
			if(_tipDatas.containsKey(target))
				return IBaseTipsInfo(_tipDatas.getValue(target)).getData();
			else
				return null;
		}

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////                                         private
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static function onMouseMoveEventHandler(event : MouseEvent) : void
		{
			stagePoint.x = int(Starling.current.nativeStage.mouseX);
			stagePoint.y = int(Starling.current.nativeStage.mouseY);

			if (_currentMouseTarget == null)
				return;

			if (_currentMouseTarget.hitTest(_currentMouseTarget.globalToLocal(stagePoint)))
			{
				onMouseMove(_currentMouseTarget);
				return;
			}

			isMouseOut = true;
			onMouseOut(_currentMouseTarget);
		}

		private static function onMouseClickEventHandler(event : MouseEvent) : void
		{
			if (_currentMouseTarget)
			{
				TipManager.remove();
				_currentMouseTarget = null;
			}
		}

		private static function onTouch(e : TouchEvent) : void
		{
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				onMouseOut(target);
				return;
			}

			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				onMouseOver(target);
			}
		}

		private static function onMouseOver(target : DisplayObject) : void
		{
			if (null == target)
				return;

			_currentMouseTarget = target;
			var info : IBaseTipsInfo = _tipDatas.getValue(target);
			TipManager.show(info.tipsType, info.getData(), stagePoint);
		}

		private static function onMouseOut(target : DisplayObject) : void
		{
			if (target)
			{
				TipManager.remove();
				_currentMouseTarget = null;
			}
		}

		private static function onMouseMove(target : DisplayObject) : void
		{
			_currentMouseTarget = target;
			var info : IBaseTipsInfo = _tipDatas.getValue(target);
			TipManager.show(info.tipsType, info.getData(), stagePoint);
		}

		private static function onRemoveFromStage(e : Event) : void
		{
			var target : DisplayObject = e.currentTarget as DisplayObject;
			if (target != null && target == _currentMouseTarget)
			{
				TipManager.remove();
				_currentMouseTarget = null;
			}
		}
	}
}
