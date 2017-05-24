package com.rpgGame.appModule.die
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.siwangfuhuo.TiaoZhanShiBai_Skin;
	
	import starling.display.DisplayObject;
	
	public class ZoneDiePanel extends SkinUIPanel
	{
		private var _skin:TiaoZhanShiBai_Skin;
		private var _listContent:ContentList;
		public function ZoneDiePanel():void
		{
			_skin = new TiaoZhanShiBai_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_listContent = new ContentList(600,205);
			this.addChild(_listContent);
			_listContent.x = 50;
			_listContent.y = 175;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btn_ok)
			{
				this.hide();
			}
		}
	}
}