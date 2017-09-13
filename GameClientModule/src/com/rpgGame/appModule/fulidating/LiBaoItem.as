package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.utils.FilterUtil;
	
	import flash.events.MouseEvent;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.fulidating.Item_Libao;
	
	import starling.display.DisplayObject;
	
	public class LiBaoItem extends SkinUI
	{
		private var _skin:Item_Libao;
		private var _lv:int;
		private var _groupList:RewardGroup;
		public function LiBaoItem()
		{
			_skin=new Item_Libao();
			super(_skin);
			_groupList=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1,RewardGroup.ALIN_LEFT,6,6,0,true,6,false,false);
		}
		
		public function setDate(data:*):void
		{
			_lv=data as int;
			_skin.uiName.styleName="ui/app/fulidating/word/"+_lv+"ji.png";
			
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnLingqu:
					reqReceiveReward();
					break;
			}
		}
		
		public function setBtnState(bool:Boolean):void
		{
			if(!bool&&MainRoleManager.actorInfo.totalStat.level>=_lv)
			{
				if(bool)
					GrayFilter.gray(_skin.btnLingqu);
				else
					_skin.btnLingqu.filter=null;
			}
			else if(!bool&&MainRoleManager.actorInfo.totalStat.level<_lv)
			{
				if(bool)
					_skin.btnLingqu.filter=null;
				else
					GrayFilter.gray(_skin.btnLingqu);
			}
			_skin.uiLingqu.visible=bool;
		}
		
		public function get level():int
		{
			return _lv;
		}
		
		private function reqReceiveReward():void
		{
			if(_skin.btnLingqu!=null) return;
			FuliDaTingSender.reqGotGrownGiftMessage(_lv);
		}
	}
}