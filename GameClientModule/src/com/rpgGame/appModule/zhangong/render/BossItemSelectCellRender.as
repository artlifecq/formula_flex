package com.rpgGame.appModule.zhangong.render
{
	import com.rpgGame.appModule.zhangong.BossItem;
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class BossItemSelectCellRender extends BaseDefaultListItemRenderer
	{
		private var cell:BossItem;
		public function BossItemSelectCellRender()
		{
			super();
			cell=new BossItem();
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