package com.rpgGame.appModule.mail.render
{
	import com.rpgGame.appModule.mail.MailItem;
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class MailItemSelectCellRender extends BaseDefaultListItemRenderer
	{
		private var cell:MailItem;
		public function MailItemSelectCellRender()
		{
			super();
			cell=new MailItem();
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
		
		public function get mailitem():MailItem
		{
			return cell;
		}
	}
}