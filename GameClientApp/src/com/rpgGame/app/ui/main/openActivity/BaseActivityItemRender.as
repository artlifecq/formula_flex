package com.rpgGame.app.ui.main.openActivity
{
	import com.rpgGame.app.ui.main.openActivity.comps.IActivityInter;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	public class BaseActivityItemRender extends DefaultListItemRenderer
	{
		private var cell:IActivityInter;
		public function BaseActivityItemRender(cellClass:Class)
		{
			super();
			cell=new cellClass();
			this.addChild(cell.dis);
			this.height=cell.height;
			this.width=cell.width;
		}
		
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				if (cell.dis.parent!=this) 
				{
					this.addChild(cell.dis);
				}
				cell.setData(this._data as ActivityVo);
			}
			else
			{
				cell.clearData();
			}
		}
		override public function dispose():void
		{
			super.dispose();
			MCUtil.removeSelf(cell.dis);
			cell=null;
		}
	}
}