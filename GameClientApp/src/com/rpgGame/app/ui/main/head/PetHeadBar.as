package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.PetEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import gs.TweenLite;
	import gs.easing.Bounce;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.meiren.MeiRen_Main;
	
	import starling.display.DisplayObject;
	
	public class PetHeadBar extends SkinUI
	{
		private var _skin:MeiRen_Main;
		private var _petMod:Q_girl_pet;
		private var tween:TweenLite;
		private var _petHeadPanel:PetHeadItemPanel;
		public function PetHeadBar()
		{
			_skin=new MeiRen_Main();
			super(_skin);
			if(_petHeadPanel==null){
				_petHeadPanel=new PetHeadItemPanel();
				this.addChild(_petHeadPanel);
				_petHeadPanel.x = 0;
				_petHeadPanel.y = 103;
				_petHeadPanel.visible=false;
			}
		}
		
		public function show():void
		{
			EventManager.addEvent(PetEvent.PET_CHANGE,updatePetChange);
			toTweenMax();
			updateShow();
		}
		
		public function hide():void
		{		
			EventManager.removeEvent(PetEvent.PET_CHANGE,updatePetChange);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.icon:
					AppManager.showAppNoHide(AppConstant.PET_PANLE);
					break;
				case _skin.btnSelect:
					if(!_petHeadPanel.visible)
					{
						if(getPetListAndShow())
							_petHeadPanel.visible=true;
					}
					else						
						_petHeadPanel.visible=false;
					break;
			}
		}
		
		private function getPetListAndShow():Boolean
		{
			var list:Vector.<PetInfo>=Mgr.petMgr.petListByJiHuo;
//			if(list.length==0)
//			{
//				NoticeManager.showNotifyById(90301);
//				return false;
//			}			
			_petHeadPanel.SetData(list);
			return true;
		}
		
		public function resize(w : int, h : int) : void {
			this.x = 270;
			this.y = 148;
		}
		
		public function toTweenMax():void
		{
			if(tween)
			{
				onTween();
			}
			this.x=380;
			this.alpha=0;
			tween = TweenLite.to(this, 0.5, {x:270,alpha:1, ease:Bounce.easeOut,onComplete:onTween});
		}
		
		private function onTween():void
		{
			tween.kill();
			tween=null;
		}
		
		private function updatePetChange():void
		{
			if(_petHeadPanel) _petHeadPanel.visible=false;
			updateShow();
		}
		
		private function updateShow():void
		{
			if(Mgr.petMgr.curPetId==0) return;
			_petMod=PetCfg.getPet(Mgr.petMgr.curPetId);
			_skin.uiName.styleName = "ui/mainui/meirenHead/head_icon/name"+Mgr.petMgr.curPetId+"s.png";
			_skin.icon.styleName = "ui/mainui/meirenHead/head_icon/head"+Mgr.petMgr.curPetId+"s.png";	
		}
	}
}