package com.rpgGame.appModule.die
{
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_die;
	
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.siwangfuhuo.tuijianItems_Skin;
	
	import starling.events.Event;
	
	public class DieToitemCell extends DefaultListItemRenderer
	{
		public function DieToitemCell():void
		{
			super();
		}
		private var _skin:tuijianItems_Skin;
		private var _icon:UIAsset;
		private var _item:Q_die;
		override protected function initialize():void
		{
			super.initialize();
			_skin=new tuijianItems_Skin();
			_skin.toSprite(this);
			_icon=new UIAsset();
			_icon.touchable=false;
			_icon.x=20;
			_icon.y=48;
			this.addChild(_icon);
			_skin.btn.addEventListener(Event.TRIGGERED,triggeeredHandler);
		}
		private function triggeeredHandler():void
		{
			if(_item.q_panel.length!=0){
				AppManager.showApp(_item.q_panel);
			}
		}
		
		override protected function commitData():void
		{
			_item= this.data as Q_die;
			if(_item){
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
		
		override public function get width():Number
		{
			return _skin.width;
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}