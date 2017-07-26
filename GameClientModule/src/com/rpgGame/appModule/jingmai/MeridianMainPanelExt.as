package com.rpgGame.appModule.jingmai
{
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.TouchEvent;

	/**
	 * 经脉面板
	 * @author yfl
	 * 
	 */	
	public class MeridianMainPanelExt extends ViewUI 
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
		//	TipTargetManager.show(this,TargetTipsMaker.makeTips(TipType.MERIDIAN_TIP,"sssss"));
			//this.addEventListener(TouchEvent.TOUCH,onTouchMain);
			_view=new MeridianView();
			addNode(RTNodeID.JM,RTNodeID.JM_RENM,_skin.rdo_renmai,52,_view.checkRenM,false);
			addNode(RTNodeID.JM,RTNodeID.JM_DUM,_skin.rdo_dumai,52,_view.checkDuM,false);
			addNode(RTNodeID.JM,RTNodeID.JM_CHONGM,_skin.rdo_chongmai,52,_view.checkChongM,false);
			addNode(RTNodeID.JM,RTNodeID.JM_DAIM,_skin.rdo_daimai,52,_view.checkDaiM,false);
			addNode(RTNodeID.JM,RTNodeID.JM_YINGM,_skin.rdo_yinqiaomai,52,_view.checkYinM,false);
			addNode(RTNodeID.JM,RTNodeID.JM_YANGM,_skin.rdo_yangqiaomai,52,_view.checkYangM,false);
			_view.setUi(_skin as Jingmai_Skin,this);
		}
		
		private function onTouchMain(eve:TouchEvent):void
		{
			// TODO Auto Generated method stub
			trace("touch main");
			
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			
		}
		override public function hide():void
		{
			super.hide();
			if (_view) 
			{
				_view.onHide();
			}
		}
		override public function show(data:Object=null):void
		{
			if (_view) 
			{
				_view.onShow();
			}
		}
		
		
	}
}