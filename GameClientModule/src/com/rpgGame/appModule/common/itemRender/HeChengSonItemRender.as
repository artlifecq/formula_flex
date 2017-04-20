package com.rpgGame.appModule.common.itemRender
{
	import feathers.controls.Button;
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Erji_Item;
	
	public class HeChengSonItemRender extends BaseDefaultListItemRenderer
	{
		public function HeChengSonItemRender()
		{
			super();
		}
		
		private var _skin:Cont_Erji_Item;
		override protected function initialize():void
		{
			super.initialize();
//			_skin=new Cont_Erji_Item();
//			this.addChild(_skin);
		}
	}
}