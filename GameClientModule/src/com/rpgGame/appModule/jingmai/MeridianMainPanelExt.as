package com.rpgGame.appModule.jingmai
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.role.interfaces.ISubPanel;
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Skin;
	
	import starling.display.DisplayObjectContainer;

	/**
	 * 经脉面板
	 * @author yfl
	 * 
	 */	
	public class MeridianMainPanelExt extends SkinUI implements ISubPanel
	{
		private var _skin:Jingmai_Skin;
		private var _view:MeridianView;
		public function MeridianMainPanelExt()
		{
			_skin=new Jingmai_Skin();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			_view=new MeridianView(_skin as Jingmai_Skin);
//			var content:Sprite=new Sprite();
//			content.x=15;
//			content.y=72;
//			content.graphics.drawRect(0,0,920,500);
//			this._skin.bg.parent.addChildAt(content,3);
//			var tx:int=460;
//			var len:int=10;
//			var dataArr:Array=[];
//			for (var i:int = 0; i < len; i++) 
//			{
//				var sp:Sprite=new Sprite();
//				sp.graphics.beginFill(0xff0000);
//				sp.graphics.drawCircle(0,0,200);
//				sp.graphics.endFill();
//				dataArr[i]=sp;
//				sp.x=tx*(i+1);
//				sp.y=content.height/2;
//				content.addChild(sp);
//			}
//			var tween:TweenScaleScrollUitlExt=new TweenScaleScrollUitlExt(content,dataArr,_skin.btn_prev,_skin.btn_next,0.5,920,500,tx);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			if (_view) 
			{
				_view.onHide();
			}
		}
		override protected function onShow():void
		{
			super.onShow();
			if (_view) 
			{
				_view.onShow();
			}
		}
		
		public function onSubShow():void
		{
			onShow();
		}
		public function onSubHide():void
		{
			onHide();
		}
	}
}