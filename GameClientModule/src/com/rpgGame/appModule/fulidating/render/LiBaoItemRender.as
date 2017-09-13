package com.rpgGame.appModule.fulidating.render
{
	import com.rpgGame.appModule.fulidating.LiBaoItem;
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class LiBaoItemRender extends BaseDefaultListItemRenderer
	{
		private var cell:LiBaoItem;
		public function LiBaoItemRender()
		{
			super();
			cell=new LiBaoItem();
			this.addChild(cell);
			this.height=cell.height+2;
			this.width=cell.width;
		}
		
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				cell.setDate(this._data);
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			MCUtil.removeSelf(cell);
			cell=null;
		}
	}
}