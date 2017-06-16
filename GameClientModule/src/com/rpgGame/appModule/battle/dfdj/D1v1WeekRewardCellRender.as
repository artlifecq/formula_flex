package  com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	public class D1v1WeekRewardCellRender extends DefaultListItemRenderer
	{
	
		private var cell:D1v1WeekRewardCellExt;
		public function D1v1WeekRewardCellRender()
		{
			super();
			cell=new D1v1WeekRewardCellExt();
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