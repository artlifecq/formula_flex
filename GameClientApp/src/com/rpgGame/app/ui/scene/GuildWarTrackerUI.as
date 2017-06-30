package com.rpgGame.app.ui.scene
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.DungeonSender;
	
	import org.mokylin.skin.app.banghui.huangcheng.HuangCheng_ZhuiZong;
	
	import starling.display.DisplayObject;
	
	/**
	 *帮会战追踪 
	 * @author dik
	 * 
	 */
	public class GuildWarTrackerUI extends SceneTrackerUI
	{
		private var _skin:HuangCheng_ZhuiZong;
		
		public function GuildWarTrackerUI()
		{
			_skin=new HuangCheng_ZhuiZong();
			super(_skin);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_Exit:
					DungeonSender.reqQuitDungeon();
					(MainRoleManager.actor.headFace as HeadFace).updateGuildWarInfoBar(null);
					break;
			}
		}
		
		override protected function onShow() : void
		{
			super.onShow();
			initEvent();
		}
		
		private function initEvent():void
		{
			
		}
		
		override protected function onHide():void
		{
			super.onHide();
		}
	}
}