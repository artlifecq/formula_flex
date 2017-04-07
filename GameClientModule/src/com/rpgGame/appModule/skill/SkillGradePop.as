package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
	import gs.TweenLite;
	import gs.easing.Cubic;
	
	import org.mokylin.skin.app.wuxue.jineng.Jineng_UpSkin;
	
	/**
	 *升级成功提示 
	 * @author dik
	 * 
	 */
	public class SkillGradePop extends PopSkinUI
	{
		private var _lv:int;
		
		public function SkillGradePop(data:*)
		{
			_skin=new Jineng_UpSkin();
			_lv=data;
			super(data);
		}
		
		private function get skin():Jineng_UpSkin
		{
			return _skin as Jineng_UpSkin;
		}
		
		override  protected function onShow() : void
		{
			skin.num_zhandouli.label="x"+_lv;
			TweenLite.delayedCall(1,tweenMis);
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