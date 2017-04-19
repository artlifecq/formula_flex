package com.rpgGame.appModule.jingmai
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.appModule.jingmai.sub.MeridianMap;
	import com.rpgGame.appModule.jingmai.sub.TweenScaleScrollUitlExt;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Skin;
	import org.mokylin.skin.app.beibao.jingmai.Renmai_Skin;
	
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;

	public class MeridianView
	{
		private var tweenScroll:TweenScaleScrollUitlExt;
		private var _skin:Jingmai_Skin;
		private var _maps:Array;
		public function MeridianView(skin:Jingmai_Skin)
		{
			//tweenScroll=new TweenScaleScrollUitlExt(con,
			this._skin=skin;
			
			initData();
		}
		private function initData():void
		{
			//选取等级为1的数据
			var hash:HashMap=MeridianCfg.getInitCfg();
			var keys:Array=hash.keys();
			var content:Sprite=new Sprite();
			_skin.imgBg.addChild(content);
			var len:int=keys.length;
			_maps=[];
			var tmp:MeridianMap;
			var startX:int=_skin.imgBg.width/2+5;
			for (var i:int = 0; i < 5; i++) 
			{
				tmp=new MeridianMap(getSkinn(keys[0]),keys[0],hash.getValue(keys[0]));
				content.addChild(tmp);
				tmp.x=startX*(i+1);
				tmp.y=185;
				_maps.push(tmp);
			}
			tweenScroll=new TweenScaleScrollUitlExt(content,_maps,_skin.btn_prev,_skin.btn_next,0.5,_skin.imgBg.width,_skin.imgBg.height,startX);
			tweenScroll.setCallBack(tweenCompleteCallBack);
		}
		
		private function tweenCompleteCallBack(map:*):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function getSkinn(meridianType:int):StateSkin
		{
			if (meridianType==1) 
			{
				return new Renmai_Skin();
			}
			return null;
		}
		public function onShow():void
		{
			
		}
		public function onHide():void
		{
			
		}
	}
}