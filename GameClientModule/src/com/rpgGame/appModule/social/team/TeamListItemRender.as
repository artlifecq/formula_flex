package com.rpgGame.appModule.social.team
{
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class TeamListItemRender extends BaseDefaultListItemRenderer
	{
		private var cell:TeamListItemExt;
		public function TeamListItemRender()
		{
			super();
			cell=new TeamListItemExt();
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
		}
		override public function dispose():void
		{
			super.dispose();
			cell.dispose();
			MCUtil.removeSelf(cell);
			cell=null;
		}
	}
}