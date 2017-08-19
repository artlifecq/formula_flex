package com.rpgGame.appModule.die
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_die;
	
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	
	import org.mokylin.skin.app.siwangfuhuo.tuijianItems_Skin;
	
	import starling.display.DisplayObject;
	
	public class DieToItem extends SkinUI
	{
		private var _skin:tuijianItems_Skin;
		private var _item:Q_die;
		
		public function DieToItem()
		{
			_skin=new tuijianItems_Skin();
			super(_skin);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(target==_skin.btn&&_item.q_panel>0){
				FunctionOpenManager.openAppPaneById(_item.q_panel.toString());
			}
		}
		
		public  function update(item:Q_die):void
		{
			_item=item;
			if(item){
				_skin.uiName.styleName="ui/app/siwangfuhuo/name/"+item.q_icon+".png";
				_skin.ui_ico.styleName="ui/app/siwangfuhuo/icon/"+item.q_icon+".png";
			}
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
		
		public function clear():void
		{
			_skin.ui_ico.styleName="";
			_skin.uiName.styleName="";
		}
	}
}