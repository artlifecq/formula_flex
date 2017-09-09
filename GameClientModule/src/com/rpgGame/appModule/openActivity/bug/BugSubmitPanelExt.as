package com.rpgGame.appModule.openActivity.bug
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.manager.platform.PlatformUtil;
	import com.rpgGame.app.ui.main.openActivity.BaseActivityMainPanel;
	import com.rpgGame.coreData.info.openActivity.EnumCampPanelType;
	
	import org.mokylin.skin.app.youjiang.Youjiang_Skin;
	
	import starling.display.DisplayObject;
	
	public class BugSubmitPanelExt extends BaseActivityMainPanel
	{
		private var _skin:Youjiang_Skin;
		public function BugSubmitPanelExt()
		{
			_skin=new Youjiang_Skin();
			super(EnumCampPanelType.M_BUG, _skin);
		}
		override protected function setData(hash:HashMap):void
		{
			
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnOK:
				{
					if (_skin.txtInput.text=="") 
					{
						FloatingText.showUp("请输入文字");
						return;
					}
					break;
				}
				case _skin.lbEnter:
				{
					PlatformUtil.platform.goBBS();
				}
				default:
				{
					break;
				}
			}
		}
	}
}