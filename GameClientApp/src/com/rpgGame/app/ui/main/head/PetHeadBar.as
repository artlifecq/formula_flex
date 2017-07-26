package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.app.utils.MenuUtil;
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
		
		override protected function onShow():void
		{
			EventManager.addEvent(PetEvent.PET_CHANGE,updatePetChange);
			super.onShow();
			toTweenMax();
			updateShow();
		}
		
		override protected function onHide():void
		{		
			super.onHide();
			EventManager.removeEvent(PetEvent.PET_CHANGE,updatePetChange);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.icon:
					AppManager.showAppNoHide(AppConstant.PET_TIAOZHAN_PANLE);
					break;
				case _skin.btnSelect:
					if(!_petHeadPanel.visible)
					{
						getPetListAndShow();
					}
					_petHeadPanel.visible=!_petHeadPanel.visible;
					break;
			}
		}
		
		private function getPetListAndShow():void
		{
			var list:Vector.<PetInfo>=Mgr.petMgr.petListByJiHuo;
			if(list.length==0)
			{
				NoticeManager.showNotifyById(1);
				return;
			}			
			_petHeadPanel.SetData(list);
		}
		
		public function resize(w : int, h : int) : void {
			this.x = 0;
			this.y = 384;
		}
		
		private function toTweenMax():void
		{
			if(tween)
			{
				onTween();
			}
			this.x=380;
			this.alpha=0;
			tween = TweenLite.to(this, 0.5, {x:0,alpha:1, ease:Bounce.easeOut,onComplete:onTween});
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
			_skin.uiName.styleName = "ui/app/meiren/head_icon/name"+Mgr.petMgr.curPetId+".png";
			_skin.icon.styleName = "ui/app/meiren/head_icon/head"+Mgr.petMgr.curPetId+".png";	
		}
	}
}