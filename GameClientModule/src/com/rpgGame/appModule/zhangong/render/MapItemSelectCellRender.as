package com.rpgGame.appModule.zhangong.render
{
	import com.rpgGame.appModule.zhangong.MapItem;
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class MapItemSelectCellRender extends BaseDefaultListItemRenderer
	{
		private var cell:MapItem;
		public function MapItemSelectCellRender()
		{
			super();
			cell=new MapItem();
			this.addChild(cell);
			this.height=cell.height;
			this.width=cell.width+5;
		}
		
		public function setData(num:int):void
		{
			cell.SetData(num);
		}
		
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				cell.SetData(this._data);
			}
			else
			{
				cell.ClearData();
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			cell.ClearData();
			MCUtil.removeSelf(cell);
			cell=null;
		}
		
		public function get mapItem():MapItem
		{
			return cell;
		}
	}
}