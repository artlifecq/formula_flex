package com.rpgGame.app.ui.scene
{
	import com.rpgGame.app.ui.scene.dungeon.DungeonTrackerUI;
	
	import org.mokylin.skin.app.activety.zonghe.qinlinmibao.Act_MiBao_ZhuiZong;
	
	/**
	 * 秦陵秘宝追踪
	 * @author YT
	 * 
	 */	
	public class MibaoTrackerUI extends SceneTrackerUI
	{
		private var _skin:Act_MiBao_ZhuiZong;
		public function MibaoTrackerUI()
		{
			_skin=new Act_MiBao_ZhuiZong();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			
		}
	}
}