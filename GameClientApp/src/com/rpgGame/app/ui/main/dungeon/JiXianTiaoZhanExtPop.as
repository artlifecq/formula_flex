package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.TiaoZhan_Exit;
	
	import utils.TimerServer;
	
	public class JiXianTiaoZhanExtPop extends PopSkinUI
	{
		private var _skin:TiaoZhan_Exit;
		private var _remainTime:int=0;
		public function JiXianTiaoZhanExtPop(data:*)
		{
			_skin=new TiaoZhan_Exit();
			super(data);
		}
		
		private function get skin():TiaoZhan_Exit
		{
			return _skin as TiaoZhan_Exit;
		}
		
		override  protected function onShow() : void
		{
			tweenTo();
		}
		
		private function tweenTo():void
		{
			var endy:int=this._skin.container.y+100;	
			TweenMax.to(skin.container,0.3,{y:endy,scale:1,alpha:1,ease:Expo.easeOut,onComplete:initTime});
		}
		
		private function initTime():void
		{
			_remainTime=5;
			_skin.num.label=_remainTime.toString();
			TimerServer.addLoop(updateTime,1000);
		}
		
		private function updateTime():void
		{
			_remainTime--;
			_skin.num.label=_remainTime.toString();
			if(_remainTime==0){
				TimerServer.remove(updateTime);
				popComplete();
			}
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=(sw-this._skin.width)/2;
			this._skin.container.y=(sh-this._skin.height)/2;
		}
		override protected function onHide():void
		{
			this.dispose();
			TimerServer.remove(updateTime);
		}
	}
}