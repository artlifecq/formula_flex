package com.rpgGame.core.ui
{

	import com.game.engine3D.display.Inter3DContainer;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.controller.MouseCursorController;
	import com.rpgGame.core.ui.tip.RewardTipNode;
	import com.rpgGame.core.ui.tip.RewardTipTree;
	import com.rpgGame.core.utils.AudioPlayUtil;
	
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import away3d.events.Event;
	
	import feathers.controls.StateSkin;
	import feathers.core.FeathersControl;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * stateSkin对应的显示容器基类
	 * @author wewell
	 */
	public class SkinUI extends Inter3DContainer
	{
		/**
		 * @private
		 */
		private static const HELPER_POINT : Point = new Point();

		protected var _stage : Stage;
		protected var _stateSkin : StateSkin;
		protected var _parentContainer : DisplayObjectContainer;
		private var _hitArea : Rectangle;
		
		public function SkinUI(skin : StateSkin = null)
		{
			if (skin != null)
			{
				skin.toSprite(this);
				if (skin.width && skin.height)
				{
					_hitArea = new Rectangle();
					_hitArea.width = skin.width;
					_hitArea.height = skin.height;
				}
			}
			_stateSkin = skin;
			_stage = Starling.current.nativeStage;
			this.addEventListener(Event.ADDED_TO_STAGE, __onAddedToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, __onRemoveFromStage);

		}

		private function __onStageResize(e : *) : void
		{
			if (_stage != null)
				onStageResize(_stage.stageWidth, _stage.stageHeight);
		}

		private function __onAddedToStage(e : Event = null) : void
		{
			onStageResize(_stage.stageWidth, _stage.stageHeight);
			_stage.addEventListener(Event.RESIZE, __onStageResize);
			startRender3D();
			onShow();
			refresh();
			updateFadeAlphaRectPos();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}

		private function __onRemoveFromStage(e : Event = null) : void
		{
			stopRender3D();
			_stage.removeEventListener(Event.RESIZE, __onStageResize);
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			onHide();
		}

		protected function onStageResize(sw : int, sh : int) : void
		{

		}

		/**
		 *当面板被点击时
		 */
		protected function onTouch(e : TouchEvent) : void
		{
			AudioPlayUtil.touchPlay(e, this);
			MouseCursorController.showNormal();
			var t : Touch = e.getTouch(this, TouchPhase.ENDED);
			if (t != null && t.target != null && this.stage != null)
			{
				t.getLocation(this.stage, HELPER_POINT);
				var isInBounds : Boolean = true;
				if (t.target is DisplayObjectContainer)
				{
					isInBounds = DisplayObjectContainer(t.target).contains(this.stage.hitTest(HELPER_POINT));
				}
				var isEnabled : Boolean = true;
				if (t.target is FeathersControl)
				{
					isEnabled = FeathersControl(t.target).isEnabled;
				}
				if (isInBounds && isEnabled)
					onTouchTarget(t.target);
			}
		}

		/**
		 *当子对象被点击后的处理。默认已实现关闭按钮被点击后的处理，关闭按钮名称为"btnClose"或"closeBtn"时生效
		 *子类可以覆盖此方法以实现特定目标被点击后的处理
		 */
		protected function onTouchTarget(target : DisplayObject) : void
		{
			var name : String = target.name;
			switch (name)
			{
				case "btnClose":
				case "closeBtn":
					this.removeFromParent();
					break;
			}
		}

		/**
		 * 被动方法，当SkinUI子类实例被添加到显示列表后会被调用
		 *
		 */
		protected function onShow() : void
		{
			//增加事件监听
			//启动计时器
			//..
		}

		/**
		 *
		 * 被动方法,当SkinUI子类实例从显示列表移除后会被调用
		 */
		protected function onHide() : void
		{
			//移除事件监听
			//停止计时器
			//..
		}

		override public function getBounds(targetSpace : DisplayObject, resultRect : Rectangle = null) : Rectangle
		{
			return _hitArea ? _hitArea : super.getBounds(targetSpace, resultRect);
		}

		/**
		 * 当外部设置visible属性时
		 * visible=true,播放3D动画,监听鼠标事件，执行onShow
		 * visible=false,则停止3D动画,删除鼠标监听，执行onHide
		 * @param value
		 *
		 */
		override public function set visible(value : Boolean) : void
		{
			if (super.visible == value)
				return;
			super.visible = value;
			if (value)
			{
				if (stage != null)
					__onAddedToStage();
			}
			else
			{
				__onRemoveFromStage();
			}
		}

		//刷新显示
		public function refresh() : void
		{

		}

		override public function dispose() : void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			this.removeEventListener(Event.ADDED_TO_STAGE, __onAddedToStage);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, __onRemoveFromStage);
			while (this.numChildren)
				this.removeChildAt(0);
			if (_stage)
			{
				_stage.removeEventListener(Event.RESIZE, __onStageResize);
				_stage = null;
			}
			super.dispose();
		}
		private static var _tree:RewardTipTree=new RewardTipTree();
		public static function addNode(parentKey:String,key:String,dis:DisplayObjectContainer,dw:int,check:Function,isGray:Boolean=false,param:Object=null):void
		{
			_tree.addNode(parentKey,key,dis,dw,check,isGray,param);
		}
		public static function notifyUpdate(key:String):void
		{
			_tree.updateNode(key);
		}
		public static function removeNode(key:String):void
		{
			_tree.removeNode(key);
		}
	}
}
