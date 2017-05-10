package com.rpgGame.appModule.social.team
{
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class TeamPlayerListItemRender extends BaseDefaultListItemRenderer
	{
		private var cell:TeamPlayerListItemExt;
		public function TeamPlayerListItemRender()
		{
			super();
			cell=new TeamPlayerListItemExt();
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