package com.rpgGame.appModule.zhangong
{
	import com.rpgGame.app.manager.ZhanGongManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.zhangong.MapItem_Skin;
	import org.mokylin.skin.app.beibao.zhangong.button.ButtonMazeiyingzhai;
	import org.mokylin.skin.app.beibao.zhangong.button.ButtonWujiabaomuchang;
	
	import starling.display.DisplayObject;
	
	public class MapItem extends SkinUI
	{
		private var _skin:MapItem_Skin;
		private var _lv:int=0;
		public function MapItem()
		{
			_skin=new MapItem_Skin();
			super(_skin);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			updatePanel();
			EventManager.addEvent(ZhanGongEvent.BOSSITEM_CHANGE,bossItemChange);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,resChange);
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,updateBtnState);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(ZhanGongEvent.BOSSITEM_CHANGE,bossItemChange);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,resChange);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,updateBtnState);
		}
		
		public function SetData(data:*):void
		{
			ClearData();
			_lv=data as int;
			updateBtnState(CharAttributeType.LV);
			setDxml(_lv);
			updatePanel();
		}
		
		private function setDxml(lv:int):void
		{
			switch(lv)
			{
				case 1:
				{
					_skin.btnBG.styleClass=org.mokylin.skin.app.beibao.zhangong.button.ButtonWujiabaomuchang;
					break;
				}		
				case 5:
				{
					_skin.btnBG.styleClass=org.mokylin.skin.app.beibao.zhangong.button.ButtonMazeiyingzhai;
					break;
				}
			}
		}
		
		public function ClearData():void
		{
			_lv=0;
			_skin.lbMsg.text="0%";
			_skin.grp_dengji.visible=false;
		}
		
		private function updateBtnState(type:int=0):void
		{
			if (CharAttributeType.LV==type)
			{
				if(_lv>MainRoleManager.actorInfo.totalStat.level){
					_skin.btnBG.isEnabled=false;
					GrayFilter.gray(_skin.btnBG);
				}
				else{
					_skin.btnBG.isEnabled=true;
					_skin.btnBG.filter=null;
				}
				updatePanel();
			}
		}
		
		public function setBtnState():void
		{
			onTouchTarget(_skin.btnBG);
		}
		
		public function get level():int
		{
			return _lv;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			EventManager.dispatchEvent(ZhanGongEvent.MAPITEM_SELECT,this);
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
				_skin.lbMsg.text="等级不足";
				_skin.lbMsg.color=0xd02525;
			}
			else
			{
				_skin.lbMsg.text=ZhanGongManager.getProgressByLv(_lv);
				_skin.lbMsg.color=0x5cb006;
			}
			var num:int=ZhanGongManager.getCanUpNumByLv(_lv);
			if(num<=0) _skin.grp_dengji.visible=false;
			else
			{
				_skin.numDengji.label=num.toString();
				_skin.grp_dengji.visible=true;
			}
		}
	}
}