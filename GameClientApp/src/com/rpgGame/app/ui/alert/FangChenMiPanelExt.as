package com.rpgGame.app.ui.alert
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.utils.MCUtil;
	
	import org.mokylin.skin.app.tips.Fangchenmi_Skin;
	
	import starling.display.DisplayObject;
	
	public class FangChenMiPanelExt extends SkinUIPanel
	{
		private var _skin:Fangchenmi_Skin;
		public function FangChenMiPanelExt()
		{
			_skin=new Fangchenmi_Skin();
			super(_skin);
//			this.model = true;
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case _skin.btn_ok:
				case _skin.btnClose:
					hide();
					break;
			}
		}
		
		public static function showFangChenMiUtil(text:String):FangChenMiPanelExt
		{
			var fangchenmiPanel:FangChenMiPanelExt=new FangChenMiPanelExt();
			fangchenmiPanel._skin.lb_text.text = text;
			if (fangchenmiPanel)
			{
				//移到上层
				fangchenmiPanel.show();
			}
			return fangchenmiPanel;
		}
		
		public function updateText(text:String):void
		{
			_skin.lb_text.text = text;
		}
		
		override public function hide() : void
		{
			super.hide();
			MCUtil.removeSelf(this);
		}
	}
}