package com.rpgGame.appModule.skill
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	
	/**
	 *技能进阶成功 
	 * @author dik
	 * 
	 */
	public class SkillRisePop extends PopSkinUI
	{
		private var eft:Inter3DContainer;
		
		public function SkillRisePop(data:*)
		{
			super(data);
			eft=new Inter3DContainer();
			this.addChild(eft);
		}
		
		override  protected function onShow() : void
		{
			eft.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JINJIE_COMPLETE),0,0,1,playComplete,addEft);
		}
		
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		private function playComplete(target:InterObject3D):void
		{
			target.removeFromParent();
			popComplete();
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=(sw-this.width)/2;
			this.y=(sh-this.height)/2;
		}
	}
}