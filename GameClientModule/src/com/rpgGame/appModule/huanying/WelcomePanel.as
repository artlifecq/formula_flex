package com.rpgGame.appModule.huanying
{
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.WelcomeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.statistics.Statistics;
	
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
			eft=this.playInter3DAt(ClientConfig.getEffect("ui_kaishiyouxi"),455,287,1,playCom);
			super.show(data,openTable,parentContiner);
		}
		
		private function playCom(target:InterObject3D):void
		{
			TaskAutoManager.getInstance().startTaskAuto(TaskType.MAINTYPE_MAINTASK);
			this.hide();
		}
		override  protected function onStageResize(sw : int, sh : int) : void
		{
			super.onStageResize(sw,sh);
		}
		override protected function onHide():void
		{
			super.onHide();
			if (MainRoleManager.actorInfo.totalStat.level==1) 
			{
				Statistics.intance.pushNode(Statistics.STEP_CLICK_START,"首次点击开始游戏");
			}
		}
		override public function hide():void
		{
			super.hide();
			if(eft){
				eft.stop();
				eft.dispose();
				eft=null;
			}
			WelcomeManager.desoryWelcome();
		}
	}
}