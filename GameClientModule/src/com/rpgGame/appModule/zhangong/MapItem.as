package com.rpgGame.appModule.zhangong
{
	import com.rpgGame.app.manager.ZhanGongManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.zhangong.MapItem_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MapItem extends SkinUI
	{
		private var _skin:MapItem_Skin;
		private var _lv:int=0;
		private static var id:int=0;
		public function MapItem()
		{
			_skin=new MapItem_Skin();
			super(_skin);
			_skin.uiOver.visible=false;
			_skin.uiSelect.visible=false;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			updatePanel();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.addEvent(ZhanGongEvent.BOSSITEM_CHANGE,bossItemChange);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,resChange);
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,updateBtnState);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.removeEvent(ZhanGongEvent.BOSSITEM_CHANGE,bossItemChange);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,resChange);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,updateBtnState);
		}
		
		public function SetData(data:*):void
		{
			ClearData();
			_lv=data as int;
			updateBtnState(CharAttributeType.LV);
			_skin.bg.styleName = "ui/zhangongmapname/"+_lv+".png";
			updatePanel();
		}
		
		public function ClearData():void
		{
			_lv=0;
			_skin.lbMsg.text="0.000%";
			_skin.grp_dengji.visible=false;
		}
		
		private function updateBtnState(type:int=0):void
		{
			if(_lv>MainRoleManager.actorInfo.totalStat.level){
				GrayFilter.gray(this._skin.bg);
			}
			else{
				this._skin.bg.filter=null;
			}
			updatePanel();
		}
		
		public function setBtnState(bool:Boolean):void
		{
			_skin.uiOver.visible=bool;
		}
		
		public function get level():int
		{
			return _lv;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.uiSelect:
					if(_lv>MainRoleManager.actorInfo.totalStat.level) return;
					EventManager.dispatchEvent(ZhanGongEvent.MAPITEM_SELECT,this);
					break;
			}			
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
		
		private function bossItemChange(msg:SCMeritoriousUpgradeResultMessage):void
		{
			updatePanel();
		}
		
		private function resChange(type:int=1):void
		{
			updatePanel();
		}
		
		private function updatePanel():void
		{
			if(_lv>MainRoleManager.actorInfo.totalStat.level)
			{
				_skin.lbMsg.visible=false;
				_skin.lbBuzu.visible=true;
			}
			else
			{
				_skin.lbMsg.text=ZhanGongManager.getProgressByLv(_lv);
				_skin.lbMsg.color=StaticValue.GREEN_TEXT;
				_skin.lbMsg.visible=true;
				_skin.lbBuzu.visible=false;
			}
			var num:int=ZhanGongManager.getCanUpNumByLv(_lv);
			if(num<=0)
			{
				_skin.grp_dengji.visible=false;
				notifyUpdate(RTNodeID.ZG);
			}
			else
			{
				_skin.lbNum.text=num.toString();
				_skin.grp_dengji.visible=true;
				setRTNState(RTNodeID.ZG,true);
			}		
		}
	}
}