package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.banghui.wangcheng.ZhanBaoInfo;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸战战报信息 
	 * @author dik
	 * 
	 */
	public class WczbWarHistoryPanel extends SkinUIPanel
	{
		private var _skin:ZhanBaoInfo;
		
		public function WczbWarHistoryPanel()
		{
			_skin=new ZhanBaoInfo();
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