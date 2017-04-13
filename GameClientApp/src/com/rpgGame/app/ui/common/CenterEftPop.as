package com.rpgGame.app.ui.common
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	/**
	 *屏幕中心特效 
	 * @author dik
	 * 
	 */
	public class CenterEftPop extends PopSkinUI
	{
		private var eft:Inter3DContainer;
		private var _url:String;
		
		public function CenterEftPop(data:*)
		{
			super(data);
			_url=data;
			eft=new Inter3DContainer();
			this.addChild(eft);
		}
		
		override  protected function onShow() : void
		{
			eft.playInter3DAt(ClientConfig.getEffect(_url),0,0,1,playComplete,addEft);
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

