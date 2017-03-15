package com.rpgGame.appModule.die
{
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	
	import org.mokylin.skin.app.siwangfuhuo.tuijianItems_Skin;
	
	public class DieToItem extends SkinUI
	{
		private var _skin:tuijianItems_Skin;
		private var _icon:UIAsset;
		
		public function DieToItem()
		{
			_skin=new tuijianItems_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_icon=new UIAsset();
			_icon.touchable=false;
			this.addChild(_icon);
		}
		
		public  function update():void
		{
			starNum(3);
		}
		
		private function starNum(num:int):void
		{
			if(num>5){
				num=5
			}
			for(var i:int=1;i<6;i++){
				var mc:UIMovieClip=_skin["mc_star"+i] as UIMovieClip;
				if(i<=num){
					mc.gotoAndStop("xx2");
				}else{
					mc.gotoAndStop("xx1");
				}
			}
		}
	}
}