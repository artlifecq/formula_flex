package com.rpgGame.appModule.common
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import feathers.controls.StateSkin;
	
	import org.game.netCore.data.long;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 具有退场景功能的面板
	 * @author dik
	 * 
	 */
	public class ExitScenePanel extends SkinUIPanel
	{
		/**
		 *打开面板时的场景唯一id
		 */
		protected var sceneId:long;
		
		public function ExitScenePanel(skin:StateSkin)
		{
			super(skin);
			this.changeMapClose=false;
			this.alwaysTop=true;
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			sceneId=MainRoleManager.actorInfo.verityMapId;
		}
		
		override protected function onHide():void
		{
			super.onHide();
			sceneId=null;
		}
	}
}