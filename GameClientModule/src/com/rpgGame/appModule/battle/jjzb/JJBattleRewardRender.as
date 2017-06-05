package com.rpgGame.appModule.battle.jjzb
{
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	public class JJBattleRewardRender extends DefaultListItemRenderer
	{
	
		private var cell:JJBattleRewardCellExt;
		public function JJBattleRewardRender()
		{
			super();
			cell=new JJBattleRewardCellExt();
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