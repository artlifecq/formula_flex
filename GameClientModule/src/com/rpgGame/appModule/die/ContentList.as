package com.rpgGame.appModule.die
{
	import com.rpgGame.coreData.cfg.DieCfgData;
	
	import feathers.controls.Button;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	
	import org.mokylin.skin.app.siwangfuhuo.ContentListSkin;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class ContentList extends Sprite
	{
		private var _skin:ContentListSkin;
		private var _w:Number;
		private var _h:Number;
		public function ContentList(w:Number,h:Number):void
		{
			super();
			_w = w;
			_h = h;
			init();
		}
		protected function init():void
		{
			_skin = new ContentListSkin();
			_skin.width = _w;
			_skin.height = _h;
			_skin.toSprite(this);
			_skin.ContList.itemRendererType =DieToitemCell;
			_skin.ContList.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.ContList.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.ContList.snapToPages = true;
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 55;
			_skin.ContList.layout = layout;
			_skin.ContList.dataProvider = new ListCollection(DieCfgData.allOpenList);
			
			_skin.btn_prev.addEventListener(Event.TRIGGERED,triggeredHandler);
			_skin.btn_next.addEventListener(Event.TRIGGERED,triggeredHandler);
			refeashList(0);
		}
		private function triggeredHandler(e:Event):void
		{
			var target:Button = e.target as Button;
			switch(target)
			{
				case _skin.btn_next:
					refeashList(_skin.ContList.horizontalPageIndex+1);
					break;
				case _skin.btn_prev:
					refeashList(_skin.ContList.horizontalPageIndex-1);
					break;
			}
		}
		
		private function refeashList(index:int):void
		{
			_skin.btn_next.visible = (index <1);
			_skin.btn_prev.visible = (index >0);
			_skin.ContList.scrollToPageIndex(index,0);
		}
	}
}