package  com.rpgGame.app.ui.main.team
{
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.utils.FilterUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class TeamBarListItemRender extends BaseDefaultListItemRenderer
	{
		private var cell:TeamBarListItemExt;
		public function TeamBarListItemRender()
		{
			super();
			cell=new TeamBarListItemExt();
			this.addChild(cell);
			this.height=cell.height;
			this.width=cell.width;
			//this.filter=FilterUtil.getGrayFilter();
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