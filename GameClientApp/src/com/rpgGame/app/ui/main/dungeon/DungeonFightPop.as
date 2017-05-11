package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
	import gs.TweenLite;
	import gs.easing.Cubic;
	
	import org.mokylin.skin.app.fuben.FuBen_TiaoZhanKaiShi;
	
	/**
	 *副本挑战开始的统一提示
	 *@author dik
	 *2017-5-11下午8:14:35
	 */
	public class DungeonFightPop extends PopSkinUI
	{
		public function DungeonFightPop(data:*)
		{
			_skin=new FuBen_TiaoZhanKaiShi();
			super(data);
		}
		
		private function get skin():FuBen_TiaoZhanKaiShi
		{
			return _skin as FuBen_TiaoZhanKaiShi;
		}
		
		override  protected function onShow() : void
		{
			tweenMis();
		}
		
		private function tweenMis():void
		{
			var endy:int=this._skin.container.y-100;
			TweenLite.to(this._skin.container,2,{y:endy,alpha:0,onComplete:popComplete,ease:Cubic.easeOut});		
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=(sw-this._skin.width)/2;
			this._skin.container.y=(sh-this._skin.height)/2;
		}
	}
}