package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.common.PageContainerUI;
	
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBaBaoMing;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸申请面板 
	 * @author dik
	 * 
	 */
	public class WczbWarApplyPanel extends SkinUIPanel
	{
		private var _skin:ZhengBaBaoMing;
		private var pageContainer:PageContainerUI;
		
		public function WczbWarApplyPanel()
		{
			_skin=new ZhengBaBaoMing();
			super(_skin);
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=(this.parent.width-this.width)/2;
			this.y=(this.parent.height-this.height)/2;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnClose1:
					this.hide();
					break;
			}
		}
	}
}