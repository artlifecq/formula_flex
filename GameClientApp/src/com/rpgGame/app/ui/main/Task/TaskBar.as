package com.rpgGame.app.ui.main.Task
{
	import com.rpgGame.core.ui.SkinUI;
	
	import gs.TweenMax;
	
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	
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
		}
		
		private function init():void
		{
			initX=_skin.task_box.x;
			leadCont=new TaskLeadCont(_skin);
			loopCont=new TaskLoopCont(_skin);
			leadCont.show(true);
			loopCont.show(false);
			
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