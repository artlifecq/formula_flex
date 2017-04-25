package com.rpgGame.appModule.jingmai.render
{
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class StoneSelectCellRender extends BaseDefaultListItemRenderer
	{
		private var cell:StoneSelectCellExt;
		public function StoneSelectCellRender()
		{
			super();
			cell=new StoneSelectCellExt();
			this.addChild(cell);
			this.height=cell.height;
			this.width=cell.width;
		}
		
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				cell.setData(this._data);
			}
			else
			{
				cell.clearData();
			}
		}
		override public function dispose():void
		{
			super.dispose();
			cell.clearData();
			MCUtil.removeSelf(cell);
			cell=null;
		}
	}
}