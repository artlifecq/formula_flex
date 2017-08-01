package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.app.sender.PetSender;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import org.mokylin.skin.app.meiren.MeiRen_Head;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class PetHeadItem extends SkinUI
	{
		public static var clickMe:Function;
		private var _skin:MeiRen_Head;
		
		private var _info:PetInfo;
		public function PetHeadItem()
		{
			_skin=new MeiRen_Head();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			MCUtil.removeSelf(_skin.uiZhan);
			_skin.uiSelect.visible=false;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
		}
		
		public function onTouchItem(e:TouchEvent):void
		{
			var t:Touch=e.getTouch(this);
			if(!t){
				_skin.uiSelect.visible=false;
				return;
			}
			t=e.getTouch(this,TouchPhase.HOVER);
			if(t){
				_skin.uiSelect.visible=true;
			}
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			switch (target) {
				case this._skin.icon:
				case this._skin.uiName:
				case this._skin.uiSelect:
					PetSender.reqPetDebut(_info.modelId);
					break;
			}
		}
		
		public function setData(info:PetInfo):void
		{
			_info=info;
			_skin.icon.styleName = "ui/app/meiren/head_icon/head"+_info.modelId+"s.png";
			_skin.uiName.styleName =  "ui/app/meiren/head_icon/name"+_info.modelId+"s.png";
			TipTargetManager.show(this, TargetTipsMaker.makeTips( TipType.MEIREN_TIP, _info ,true) );
		}
	}
}