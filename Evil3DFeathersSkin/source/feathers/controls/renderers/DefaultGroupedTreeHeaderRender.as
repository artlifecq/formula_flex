package feathers.controls.renderers
{
	import flash.geom.Point;
	
	import feathers.controls.GroupedTree;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * GroupedTree的头项目渲染器
	 * @author wewell@163.com
	 * 
	 */	
	public class DefaultGroupedTreeHeaderRender extends LayoutGroupGroupedListHeaderOrFooterRenderer
	{
		private static var HELP_POINT:Point =  new Point(0,0);
		
		public function DefaultGroupedTreeHeaderRender()
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}
		
		/**
		 *当headerRender被点击时
		 */		
		protected function onTouch(e:TouchEvent):void
		{
			var t:Touch = e.getTouch(this, TouchPhase.ENDED);
			if(t != null && t.target != null && this.stage != null)
			{
				t.getLocation(this.stage, HELP_POINT);
				var isInBounds:Boolean = true;
				isInBounds = DisplayObjectContainer(this).contains(this.stage.hitTest(HELP_POINT));
				
				if(isInBounds)
				{
					tree.switchExpandOrFold(groupIndex);
					onTouchTarget(t.target);
				}
			}
		}
		
		/**
		 *当子对象被点击后的处理
		 */		
		protected function onTouchTarget(target:DisplayObject):void
		{
			
		}
		
		protected function get tree():GroupedTree
		{
			return _owner as GroupedTree;
		}
		
		override public function dispose():void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			super.dispose();
		}
	}
}


