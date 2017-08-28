package com.rpgGame.appModule.huanying
{
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.TaskType;
	
	import org.mokylin.skin.app.huanying.HuanYing_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *欢迎界面 
	 * @author dik
	 * 
	 */
	public class WelcomePanel extends SkinUIPanel
	{
		private var _skin:HuanYing_Skin;
		private var eft:InterObject3D;
		public function WelcomePanel()
		{
			_skin=new HuanYing_Skin();
			super(_skin);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.startBtn){
				TaskAutoManager.getInstance().startTaskAuto(TaskType.MAINTYPE_MAINTASK);
				this.hide();
			}
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			eft=this.playInter3DAt(ClientConfig.getEffect("ui_kaishiyouxi"),this.x,this.y,1,playCom);
		}
		
		private function playCom(target:InterObject3D):void
		{
			TaskAutoManager.getInstance().startTaskAuto(TaskType.MAINTYPE_MAINTASK);
			this.hide();
		}
		
		override public function hide():void
		{
			super.hide();
			eft.stop();
			eft.dispose();
			eft=null;
		}
	}
}