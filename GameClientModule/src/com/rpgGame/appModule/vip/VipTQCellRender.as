package com.rpgGame.appModule.vip
{
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	import org.mokylin.skin.app.vip.VipsMiaoshu;
	
	public class VipTQCellRender extends BaseDefaultListItemRenderer
	{
		private var _skin:VipsMiaoshu;
		public function VipTQCellRender()
		{
			super();
			_skin=new VipsMiaoshu();
			_skin.toSprite(this);
		}
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				this._skin.lbDec.text=String(this.data)
			}
		}
		override public function dispose():void
		{
			super.dispose();
		}
	}
}