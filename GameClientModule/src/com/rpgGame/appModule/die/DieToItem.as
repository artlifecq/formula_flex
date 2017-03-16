package com.rpgGame.appModule.die
{
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
		private var _icon:UIAsset;
		private var _item:Q_die;
		
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
			_icon.x=20;
			_icon.y=48;
			this.addChild(_icon);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(target==_skin.btn&&_item.q_panel.length!=0){
				AppManager.showApp(_item.q_panel);
			}
		}
		
		public  function update(item:Q_die):void
		{
			_item=item;
			if(item){
				_skin.lbl_name.text=_item.q_name;
				_icon.styleName=ClientConfig.getPanelIcon("die/"+_item.q_icon.toString());
				starNum(_item.q_starsnum);
			}else{
				_skin.lbl_name.text="";
				_icon.styleName="";
				starNum(0);
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
	}
}