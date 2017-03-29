package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.wuxue.jineng.Jineng_UpSkin;
	
	/**
	 *升级成功提示 
	 * @author dik
	 * 
	 */
	public class SkillOkPop extends PopSkinUI
	{
		private var _lv:int;
		
		public function SkillOkPop(data:*)
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
			TweenLite.to(this._skin.container,1,{y:this._skin.container.y-20,alpha:0,onComplete:popComplete});			
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=(sw-this._skin.width)/2;
			this._skin.container.y=(sh-this._skin.height)/2;
		}
	}
}