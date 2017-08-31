package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.goods.StorageManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.beibao.GridOpenTiShiSkin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GridOpenTiShiPanel extends SkinUIPanel
	{
		private var _skin:GridOpenTiShiSkin;
		
		private var _itemContainerID:int;
		private var _index:int;	
		private var _type:int;
		
		private var _buyNum:int;
		private var _buyPice:int;
		
		public function GridOpenTiShiPanel()
		{
			_skin=new GridOpenTiShiSkin();
			super(_skin);
//			this.model=true;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show();
			var arr:Array=data as Array;
			_itemContainerID=arr[0];
			_index=arr[1];
			initPanel();
		}
		
		private function initPanel():void
		{
			switch(_itemContainerID)
			{
				case ItemContainerID.BackPack:
					_buyNum=_index-BackPackManager.instance.hasOpenCount;
					_type=1;
					break;
				case ItemContainerID.Storage:
					_buyNum=_index-StorageManager.instance.hasOpenCount;
					_type=2;
					break;
			}
			_buyPice=GoodsContainerMamager.getOpenGridMoney(_itemContainerID,_index);
			_skin.lb_num.text=_buyNum.toString()+"格";
			_skin.lb_pice.text=_buyPice.toString()+"元宝";
			if(_buyPice>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD)){
				_skin.lb_pice.color=StaticValue.RED_TEXT;
			}else{
				_skin.lb_pice.color=StaticValue.GREEN_TEXT;
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnOk:
					onToBuy();
					onQuXiao();
					break;
				case _skin.btnCancel:
					onQuXiao();
					break;
			}			
		}
		
		private function onToBuy():void
		{
			if(_index==GoodsContainerMamager.getMrg(_itemContainerID).curUnlockIndex&&GoodsContainerMamager.getMrg(_itemContainerID).isMianFei)
			{
				if(_buyPice>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD))
				{
					NoticeManager.showNotifyById(2008);
					return;
				}
				ItemSender.reqOpenTimeCellMessage(_type);
			}
			else{
				if(_buyPice>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD))
				{
					NoticeManager.showNotifyById(2008);
					return;
				}
				ItemSender.reqOpenCellMessage(_type,_index);
			}
		}
		
		private function onQuXiao():void
		{
			this.hide();
		}
		
		override public function hide():void
		{
			super.hide();
			_itemContainerID=0;
			_index=0;
			_type=0;
			_buyNum=0;
			_buyPice=0;
		}
	}
}