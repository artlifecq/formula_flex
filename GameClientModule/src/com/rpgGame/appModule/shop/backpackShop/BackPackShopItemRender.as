package com.rpgGame.appModule.shop.backpackShop
{
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	public class BackPackShopItemRender extends DefaultListItemRenderer
	{
		private var cell:BackPackShopItemExt;
		public function BackPackShopItemRender(type:int)
		{
			super();
			cell=new BackPackShopItemExt(type);
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
		override public function set x(value:Number):void
		{
			super.x=value;
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