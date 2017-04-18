package com.rpgGame.app.ui.main.Task
{
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.ui.SkinUI;
	
	import gs.TweenMax;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	
	import starling.display.DisplayObject;

	public class TaskBar extends SkinUI
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var leadCont:TaskLeadCont;
		private var loopCont:TaskLoopCont;
		private var barTweenMax:TweenMax;
		private var initX:Number;
		public function TaskBar()
		{
			_skin=new RenWuZhuiZong_Skin();
			super(_skin);
			init();
			addEvent();
			
		}
		
		
		private function init():void
		{
			initX=_skin.task_box.x;
			leadCont=new TaskLeadCont(_skin);
			loopCont=new TaskLoopCont(_skin);
			/*leadCont.show(false);
			loopCont.show(true);
			leadCont.show(true);
			loopCont.show(false);*/
		}
		private function addEvent():void
		{
			EventManager.addEvent(TaskEvent.TASK_INFOR_MATION,inforMation);
		}
		
		private function inforMation():void
		{
			if(TaskMissionManager.haveDailyTask||TaskMissionManager.haveTreasuerTask)
			{
				leadCont.show(false);
				loopCont.show(true);
				loopCont.loopTaskView();
			}
			else
			{
				leadCont.show(true);
				loopCont.show(false);
				leadCont.leadTaskView();
			}
		}
		
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			CONFIG::netDebug {
				NetDebug.LOG("[MainUI] [onTouchTarget]:" + target.name);
			}
				switch (target) {
					case this._skin.btn_open:
						// 打开
						setState(true);
						break;
					case this._skin.btn_close:
						// 关闭
						setState(false);
						break;
					case Renwu_Item(_skin.pri_killbut.skin).btn_send:
						//L.l("btn_sendbtn_sendbtn_sendbtn_send");
						break;
					case Renwu_Item(_skin.pri_killbut.skin).labelDisplay:
						//L.l("labelDisplaylabelDisplay");
						TaskUtil.replyNpcTask(1);
						break;
					case Renwu_Item(_skin.sec_killbut1.skin).btn_send:
						//L.l("sec_killbut1");
						break;
					case Renwu_Item(_skin.sec_killbut1.skin).labelDisplay:
						
						break;
					case Renwu_Item(_skin.sec_killbut2.skin).btn_send:
						//L.l("sec_killbut2");
						break;
					case Renwu_Item(_skin.sec_killbut2.skin).labelDisplay:
						
						break;
					case _skin.sec_navi1:
						AppManager.showApp(AppConstant.TASK_LEAD_PANEL);
						break;
					case _skin.sec_navi3:
						AppManager.showApp(AppConstant.TASK_LOOP_PANEL);
						break;
				}
		}
		
		
		
		private function setState(isOpen : Boolean) : void {
			if (barTweenMax) {
				barTweenMax.kill();
			}
			var targetX : int;
			_skin.task_box.visible=true;
			if(isOpen)
			{
				targetX=initX;
				_skin.but_openBg.visible=false;
				barTweenMax=TweenMax.to(_skin.task_box,0.5,{x:targetX});
			}
			else
			{
				targetX=initX+_skin.task_box.width;
				barTweenMax=TweenMax.to(_skin.task_box,0.5,{x:targetX,onComplete :onCompFun});
			}
			
			
			_skin.btn_close.visible = isOpen;
			_skin.btn_open.visible = !isOpen;
		}
		private function onCompFun() : void 
		{
			_skin.but_openBg.visible=true;
			_skin.task_box.visible=false;
		}
		public function resize(w : int, h : int) : void {
			this.x = w - this._skin.width;
			this.y = (h - this._skin.height)>>1;
			CONFIG::netDebug{
				NetDebug.LOG("[TaskBar] [resize] x:" + this.x + ", y:" + this.y + ", w:" + this._skin.width + ", h:" + this._skin.height);
			}
		}
	}
}