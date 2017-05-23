package feathers.controls
{
	import away3d.events.Event;
	
	/**
	 * 可换肤面板
	 * @author wewell
	 * 
	 */	
	public class SkinnablePanel extends SkinnableContainer
	{
		public function SkinnablePanel()
		{
		}
		
		override public function set skin(value:StateSkin):void
		{
			super.skin = value;
			
			initSkinChildren();
		}
		
		protected function initSkinChildren():void
		{
			if(!skin)return;
			
			if(skin.hasOwnProperty("titleDisplay"))
			{
				titleDisplay = skin["titleDisplay"];
				if(_title)titleDisplay.text = _title;
			}
			
			if(skin.hasOwnProperty("closeBtn"))
			{
				closeBtn = skin["closeBtn"];
				if(closeBtn)closeBtn.addEventListener(Event.TRIGGERED, onCloseBtnTrigge);
			}
		}
		
		private var _title:String;
		
		/**
		 * [SkinPart]实体滑块组件
		 */		
		private var closeBtn:Button;
		/**
		 * [SkinPart]标题显示对象 
		 */
		private var titleDisplay:Label;
		/**
		 * 标题文本内容
		 */		
		public function get title():String 
		{
			return _title;
		}
		
		public function set title(value:String):void 
		{
			_title = value;
			
			if (titleDisplay)
				titleDisplay.text = _title ? _title : "";
		}
		
		protected function onCloseBtnTrigge(event:Event):void
		{
			dispatchEventWith(away3d.events.Event.CLOSE);
		}
		
		override public function dispose():void
		{
			super.dispose();
			if(closeBtn != null)closeBtn.removeEventListener(Event.TRIGGERED, onCloseBtnTrigge);
			_title = null;
			closeBtn = null;
			titleDisplay = null;
		}
	}
}

