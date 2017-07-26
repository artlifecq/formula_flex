package com.rpgGame.appModule.pet
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.sender.PetSender;
	import com.rpgGame.appModule.shop.ItemGetAdvisePanelExt;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.PetEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.meiren.MeiRen_JinJie;
	
	import starling.display.DisplayObject;
	
	public class PetLevelUPPanelExt extends SkinUI
	{
		private static var _ins:PetLevelUPPanelExt;
		private var _skin:MeiRen_JinJie;
		private var _data:PetInfo;
		private var _needItem:int;
		private var _needItemNum:int;
		private var _petAdvConfig:Q_girl_advance;
		private var _isAutoState:Boolean;
		public function PetLevelUPPanelExt()
		{
			_skin=new MeiRen_JinJie();
			super(_skin);
		}
		
		public function setData(data:PetInfo):void
		{
			this._data=data;
			_skin.uiLevel.styleName="ui/app/meiren/jieshu/"+data.rank+".png";
			updateNeedItems();
			updateBlessData();
			setAutoState(false);
		}
		private function updateNeedItems():void
		{
			_petAdvConfig=PetAdvanceCfg.getPet(_data.modelId,_data.rank);
			if (_petAdvConfig) 
			{
				var obj:Object=JSONUtil.decode(_petAdvConfig.q_need_items);
				if (obj) 
				{
					_needItem=obj.mod;
					_needItemNum=obj.num;
				}
			}
			_skin.barJindu.maximum=_petAdvConfig.q_blessnum_limit;
		}
		private function updateBlessData():void
		{
			_skin.lbJindu.text=_data.rankExp+"/"+_petAdvConfig.q_blessnum_limit;
			_skin.barJindu.value=_data.rank;
			updateItem();
		}
		private function updateItem():void
		{
			var itemNum:int=BackPackManager.instance.getItemCount(_needItem);
			if (itemNum<_needItemNum) 
			{
				_skin.lbCailiao.color=GameColorUtil.COLOR_RED;
			}
			else
			{
				_skin.lbCailiao.color=GameColorUtil.COLOR_GREEN;
			}
			_skin.lbCailiao.text=ItemConfig.getItemName(_needItem)+"*"+_needItemNum+"("+itemNum+")";
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnJinjie:
				{
					reqBlessOnce();
					break;
				}
				case _skin.btnZidong:
				{
					if(reqBlessOnce())
					{
						setAutoState(true);
					}
					else
					{
						setAutoState(false);
					}
					break;
				}
				case _skin.btnStop:
				{
					setAutoState(false);
					break;
				}
				case _skin.lbCailiao:
				{
					showBuyPanel();
					break;
				}
				default:
				{
					break;
				}
			}
		}
		
		private function reqBlessOnce():Boolean
		{
			// TODO Auto Generated method stub
			var itemNum:int=BackPackManager.instance.getItemCount(_needItem);
			if (_skin.cboxTip.isSelected==false&&itemNum<_needItemNum)
			{
//				FloatingText.showUp("材料不足");
				NoticeManager.showNotifyById(1);
				return false;
			}
			PetSender.reqPetLevelUp(_data.modelId,1,_skin.cboxTip.isSelected?1:0);
			return true;
		}
		private function showBuyPanel():void
		{
			var retw:int=ItemGetAdvisePanelExt.showBuyItem(_needItem,this);
			if (retw!=0) 
			{
				if (this.parent) 
				{
					(this.parent as PetMainPanelExt).updatePos();
				}
			}
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			
		}
		override protected function onHide():void
		{
			super.onHide();	
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onItemChange);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onItemChange);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onItemChange);
			_data=null;
			setAutoState(false);
			if(this.parent)
				(this.parent as PetMainPanelExt).updatePos();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(ItemEvent.ITEM_ADD,onItemChange);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onItemChange);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onItemChange);
			EventManager.addEvent(PetEvent.PET_UP_RESULT,onUpdateExp);
		}
		
		private function onUpdateExp(...arg):void
		{
			// TODO Auto Generated method stub
			var petId:int=arg[0];
			var exp:int=arg[1];
			var isSuccess:int=arg[2];
			if (petId==_data.modelId) 
			{
				updateBlessData();
				//失败了
				if (isSuccess==0) 
				{
					if (_isAutoState) 
					{
						setAutoState(false);
					}
				}
				else
				{
					//自动进阶
					if (_isAutoState&&exp<_petAdvConfig.q_blessnum_limit) 
					{
						if (!reqBlessOnce()) 
						{
							setAutoState(false);
						}
						else
						{
							setAutoState(true);
						}
					}
				}
			}
		}
		
		private function onItemChange(itemInfo : ClientItemInfo):void
		{
			// TODO Auto Generated method stub
			if (itemInfo&&itemInfo.qItem.q_id==_needItem) 
			{
				updateItem();
			}
		}
		private function setAutoState(bool:Boolean):void
		{
			_isAutoState=bool;
			_skin.btnJinjie.visible=!bool;
			_skin.btnZidong.visible=!bool;
			_skin.btnStop.visible=bool;
		}
	}
}