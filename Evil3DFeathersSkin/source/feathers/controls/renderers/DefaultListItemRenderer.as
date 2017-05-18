package feathers.controls.renderers
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import feathers.controls.ButtonState;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * 默认的列表渲染项 
	 * 已实现单击onTouchTarget/鼠标悬停onTouchOver/鼠标离开onTouchOut等响应处理
	 * 已实现双击doubleClickFunction回调
	 * @author wewell@163.com
	 * 
	 */	
	public class DefaultListItemRenderer extends BaseDefaultListItemRenderer
	{
		private static var HELP_POINT:Point =  new Point(0,0);
		
		public function DefaultListItemRenderer()
		{
			super();
			_isToggle = false;//此类已经实现了isSelected功能，所以不再需要TapToSelect类来管理
		}
		
		override public function get height():Number
		{
			if(super.height <= 0)
			{
				//throw new Error("you  must override the function 'get height()' and return a correct height value");
				trace("DefaultListItemRenderer：you  must override the function 'get height()' and return a correct height value");
			}
			return super.height;
		}
		
		protected function onTouch(e : TouchEvent):void
		{
			//trace("onTouch(DefaultListItemRenderer)");
		}
		
		override protected function initialize():void
		{

		}
		
		/**
		 *本渲染器鼠标响应
		 */		
		override protected function basicButton_touchHandler(e:TouchEvent):void
		{
			onTouch( e );
			
			var t:Touch = e.getTouch(this, TouchPhase.ENDED);
			if(t != null && t.target != null && this.stage != null)
			{
				t.getLocation(this.stage, HELP_POINT);
				var isInBounds:Boolean = true;
				isInBounds = DisplayObjectContainer(this).contains(this.stage.hitTest(HELP_POINT));
				
				if(isInBounds)
				{
					onTouchItem(t.target);
				}
				return;
			}
			
			t = e.getTouch(this, TouchPhase.HOVER);
			if (t) 
			{
				onTouchOver(t.target);
			}
			else if(!e.getTouch(this))
			{
				onTouchOut();
			}
			
			super.basicButton_touchHandler(e);
		}
		
		private function onTouchItem(target:DisplayObject):void
		{
			onTouchTarget(target);
			
			//已被移除
			if(!this.owner)
			{
				return;
			}
				
			
			//上次选中项
			var clickedItemRender:DefaultListItemRenderer = this.owner.customSelectedItemRender as DefaultListItemRenderer;
			
			//单击了上一次选中的项
			if(!owner.allowMultipleSelection && clickedItemRender != null && clickedItemRender == this && owner.selectedItem == this._data)
			{
					owner.customSelectedItemRender = this ;
					owner.selectedIndex = index;
			}
			else
			{
				if(owner.allowMultipleSelection)
				{
					if(isSelected)
					{
						isSelected = false;
					}else
					{
						isSelected = true;
					}
					owner.dispatchEventWith(Event.SELECT);
				}else
				{
					if(clickedItemRender)
					{
						clickedItemRender.isSelected = false;
					}
					
					isSelected = true;
					
					//设置选中数据项，List会发送Event.Change事件
					owner.selectedItem = this._data;
					
					//保存当前被选中的ItemRender,会发送Event.Select事件
					owner.customSelectedItemRender = this;
					owner.selectedIndex = index;
				}
				
				this.dispatchEventWith(Event.CHANGE);
//				this.invalidate(INVALIDATION_FLAG_ALL);
			}
		}
		
		private function _onDoubleClick( e:MouseEvent ):void
		{
			if( !checkClick() )
				return;
			
			if( _doubleClickFun != null )
				_doubleClickFun( this );
		}
		
		private var _doubleClickFun:Function;
		public function set doubleClickFunction(value:Function):void
		{
			_doubleClickFun = value;
		}
		
		public function get doubleClickFunction():Function
		{
			return _doubleClickFun;
		}
		
		private function checkClick():Boolean
		{
			HELP_POINT.x = Starling.current.nativeStage.mouseX;
			HELP_POINT.y = Starling.current.nativeStage.mouseY;
			var mousePoint : Point = this.globalToLocal(HELP_POINT);
			var target:DisplayObject =  hitTest(mousePoint);		
			return  isEnabled && target != null && target == Starling.current.stage.hitTest(HELP_POINT);
		}
		
		/**
		 *当子对象被点击后的处理。默认已实现关闭按钮被点击后的处理，关闭按钮名称为"btnClose"或"closeBtn"时生效
		 *子类可以覆盖此方法以实现特定目标被点击后的处理
		 */		
		protected function onTouchTarget(target:DisplayObject):void{};
		
		private var mouseIn:Boolean;
		protected function onTouchOver(target:DisplayObject):void
		{
			if(!mouseIn)
			{
				mouseIn = true;
				changeState(ButtonState.HOVER);
				if(_doubleClickFun != null)
				{
					Starling.current.nativeStage.addEventListener( MouseEvent.DOUBLE_CLICK, _onDoubleClick);
				}
			}
		};
		
		protected function onTouchOut():void
		{	
			mouseIn = false;
			changeState(ButtonState.UP);
			if(_doubleClickFun != null)
			{
				Starling.current.nativeStage.removeEventListener( MouseEvent.DOUBLE_CLICK, _onDoubleClick);
			}
		};
		
		/**
		 * @private
		 */
		override protected function trigger():void
		{
			//此逻辑以改用onTouch方法以实现子对象的点击判定， 因此不再执行tirgger方法
		}
		
		override public function dispose():void
		{
			_doubleClickFun = null;
			Starling.current.nativeStage.removeEventListener( MouseEvent.DOUBLE_CLICK, _onDoubleClick);
			super.dispose();
		}
	}
}


