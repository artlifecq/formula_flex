package com.rpgGame.appModule.mail.render
{
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class MailItemSelectCellRender extends BaseDefaultListItemRenderer
	{
		public function MailItemSelectCellRender()
		{
			super();
		}
		
		public function setData(data:*):void
		{
//			cell.SetData(num);
		}
		
		override protected function commitData():void
		{
//			if(this._data && this._owner)
//			{
//				cell.SetData(this._data);
//			}
//			else
//			{
//				cell.ClearData();
//			}
		}
		
		override public function dispose():void
		{
			super.dispose();
//			cell.ClearData();
//			MCUtil.removeSelf(cell);
//			cell=null;
		}
	}
}