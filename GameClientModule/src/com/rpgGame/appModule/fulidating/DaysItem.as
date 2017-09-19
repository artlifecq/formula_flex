package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.type.TipType;
	
	import org.mokylin.skin.app.fulidating.Item_Qiandao;
	
	import starling.display.DisplayObject;
	
	public class DaysItem extends SkinUI
	{
		private var _skin:Item_Qiandao;
		private var _day:int=0;
		public function DaysItem()
		{
			_skin=new Item_Qiandao();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.uiJin.visible=false;
			_skin.uiTiqian.visible=false;
			_skin.uiBuqian.visible=false;
			_skin.uiOK.visible=false;
			_skin.bg2.visible=false;
			_skin.lbDate.text="1";
		}
		
		public function setDate(day:int):void
		{
			_day=day;
			_skin.lbDate.text=_day.toString();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.bg1:
				case _skin.bg2:	
					onSignHandler();
					break;
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
			
		}
		
		override protected function onHide():void
		{
			super.onHide();
			
		}
		
		public function set sign(value:Boolean):void
		{
			_skin.uiOK.visible=value;
			TipTargetManager.remove( this );
			if(!value&&SystemTimeManager.sysDateTime.fullYear==Mgr.signMgr.signVO.openServerTime.fullYear&&
				SystemTimeManager.sysDateTime.month==Mgr.signMgr.signVO.openServerTime.month&&
				_day<Mgr.signMgr.signVO.openServerTime.date)
			{
				_skin.bg1.visible=true;
				_skin.bg2.visible=false;
				_skin.uiBuqian.visible=false;
				_skin.uiTiqian.visible=false;		
			}
			else if(!value&&_day<SystemTimeManager.sysDateTime.date)
			{
				_skin.bg1.visible=true;
				_skin.bg2.visible=false;
				_skin.uiBuqian.visible=true;
				_skin.uiTiqian.visible=false;	
				TipTargetManager.show( this, TargetTipsMaker.makeTips( TipType.SIGN_BUQIAN_TIP, 1 ) );
			}
			else if(!value&&_day==SystemTimeManager.sysDateTime.date+1){
				_skin.bg1.visible=true;
				_skin.bg2.visible=false;
				_skin.uiBuqian.visible=false;
				_skin.uiTiqian.visible=true;	
				TipTargetManager.show( this, TargetTipsMaker.makeTips( TipType.SIGN_TIQIAN_TIP, 1 ) );
			}
			else if(!value&&_day>SystemTimeManager.sysDateTime.date+1){
				_skin.bg1.visible=true;
				_skin.bg2.visible=false;
				_skin.uiBuqian.visible=false;
				_skin.uiTiqian.visible=false;	
			}
			else if(!value&&_day==SystemTimeManager.sysDateTime.date)
			{
				_skin.bg1.visible=false;
				_skin.bg2.visible=true;
				_skin.uiBuqian.visible=false;
				_skin.uiTiqian.visible=false;
			}
			else if(value)
			{
				_skin.bg1.visible=true;
				_skin.bg2.visible=false;
				_skin.uiBuqian.visible=false;
				_skin.uiTiqian.visible=false;
			}
		}
		
		public function set currentDate(value:Boolean):void
		{
			_skin.uiJin.visible = value;
		}
		
		private function onSignHandler():void
		{
			if(this.filter!=null) return;
			if(SystemTimeManager.sysDateTime.fullYear==Mgr.signMgr.signVO.openServerTime.fullYear&&
				SystemTimeManager.sysDateTime.month==Mgr.signMgr.signVO.openServerTime.month&&
				_day<Mgr.signMgr.signVO.openServerTime.date)
			{
				return;
			}
			else if(_day<SystemTimeManager.sysDateTime.date)
			{
				if(Mgr.signMgr.isCanSign(_day)){
					FuliDaTingSender.reqSignAddToGameMessage(_day);
				}
			}
			else if(_day>SystemTimeManager.sysDateTime.date){
				if(Mgr.signMgr.isCanSign(_day)){
					FuliDaTingSender.reqSignStrikeMessage(_day,SystemTimeManager.sysDateTime.month+1);
				}		
			}
			else if(_day==SystemTimeManager.sysDateTime.date)
			{
				if(Mgr.signMgr.isCanSign(_day)){
					FuliDaTingSender.reqSignToGameMessage(_day);
				}
			}
		}
	}
}