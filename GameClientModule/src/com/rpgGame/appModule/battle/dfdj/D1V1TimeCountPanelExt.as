package com.rpgGame.appModule.battle.dfdj
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	
	
	
	public class D1V1TimeCountPanelExt extends SkinUIPanel
	{
		private var _effect3D:Inter3DContainer;
		public function D1V1TimeCountPanelExt()
		{
			super(null);
			_effect3D=new Inter3DContainer();
			this.addChild(_effect3D);
		}
		override protected function onShow():void
		{
			super.onShow();
			_effect3D.playInter3DAt(ClientConfig.getEffect(EffectUrl.EFFECT_TIME_10),0,0,1,onPlayComplete)
		}
		
		private function onPlayComplete(effect:InterObject3D):void
		{
			// TODO Auto Generated method stub
			effect.dispose();
			hide();
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=sw/2;
			this.y=sh/2;
		}
	}
}