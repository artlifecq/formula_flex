package com.rpgGame.app.ui.main.openActivity
{
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import feathers.controls.List;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.controls.StateSkin;
	import feathers.data.ListCollection;

	/**
	 *活动子面板 右侧有list的 
	 * @author yfl
	 * 
	 */	
	public class BaseCampSubWithListPanel extends BaseCampSubPanel
	{
		private var _list:List;
		private var _class:Class;
		public function BaseCampSubWithListPanel(skin:StateSkin,list:List,renderClass:Class)
		{
			super(skin);
			this._list=list;
			this._class=renderClass;
			_list.itemRendererFactory =renderClassItem;
			list.clipContent = true;
			list.scrollBarDisplayMode =  ScrollBarDisplayMode.ALWAYS_VISIBLE;
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=1;
			list.dataProvider=new ListCollection();
		}
		private function renderClassItem():BaseActivityItemRender
		{
			return new BaseActivityItemRender(_class);
		}
		override public function setData(infos:Vector.<ActivityVo>):void
		{
			super.setData(infos);
			if (_list) 
			{
				var oldPos:Number=_list.verticalScrollPosition;
				_list.dataProvider.removeAll();
				_list.dataProvider=new ListCollection(infos);
				_list.scrollToPosition(_list.horizontalScrollPosition,oldPos,0.01);
			}
		}
		override protected function onHide():void
		{
			if (_list) 
			{
				_list.dataProvider.removeAll();
			}
		}
		override public function dispose():void
		{
			super.dispose();
			this._list=null;
			this._class=null;
		}
		override public function clearData():void
		{
			
		}
	}
}