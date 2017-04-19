package com.rpgGame.appModule.common.itemRender
{
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	/**
	 *基于皮肤的list渲染项目
	 *@author dik
	 *2017-4-10下午7:44:45
	 */
	public class SkinItemRender extends BaseDefaultListItemRenderer
	{
		private var _skin:SkinItem;
		public function SkinItemRender(skin:SkinItem)
		{
			super();
			_skin=skin;
			this.addChild(_skin);
			this.height=_skin.height;
			this.width=_skin.width;
		}
		
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				_skin.text=String(this._data);
			}
			else
			{
				_skin.clear();
			}
		}
	}
}