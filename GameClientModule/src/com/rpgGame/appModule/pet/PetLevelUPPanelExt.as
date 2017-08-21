package com.rpgGame.appModule.pet
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.sender.PetSender;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.appModule.shop.ItemGetAdvisePanelExt;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.PetEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.meiren.MeiRen_JinJie;
	
	import starling.display.DisplayObject;
	
	public class PetLevelUPPanelExt extends SkinUI
	{
		private var _skin:MeiRen_JinJie;
		private var _data:PetInfo;
		private var _needItem:int;
		private var _needItemNum:int;
		private var _qPet:Q_girl_pet;
		private var _petAdvConfig:Q_girl_advance;
		private var _isAutoState:Boolean;
		
		private var _modContaner:Inter3DContainer;
		private var _avatar : InterAvatar3D;
		private var _avatarData : RoleData;
		
		private var autoReq:TweenLite;
		
		public function PetLevelUPPanelExt()
		{
			_skin=new MeiRen_JinJie();
			super(_skin);
			initPanel();
		}
		
		private function initPanel():void
		{
			_modContaner=new Inter3DContainer();
			this._skin.container.addChildAt(_modContaner,3);
			_avatar=new InterAvatar3D();
			_avatar.x = 158;
			_avatar.y =430;
			_modContaner.addChild3D(_avatar);
			_avatarData=new RoleData(0);
		}
		
		public function setData(data:PetInfo):void
		{
			this._data=data;
			initModEff();
			if(data.rank>=_qPet.q_max_grade) return;
			_skin.uiLevel.styleName="ui/app/meiren/jieshu/"+data.rank+".png";
			updateNeedItems();
			updateBlessData();
			setAutoState(false);		
		}
		
		private function initModEff():void
		{
			_qPet=PetCfg.getPet(_data.modelId);
			this._avatarData.avatarInfo.setBodyResID(_qPet.q_panel_show_id, null);
			this._avatar.setRoleData(this._avatarData);
			this._avatar.curRole.setScale(2.3);	
			this._avatar.curRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
		}
		
		private function updateNeedItems():void
		{
			_petAdvConfig=PetAdvanceCfg.getPet(_data.modelId,_data.rank);
			if (_petAdvConfig) 
			{
				var obj:Object=JSONUtil.decode(_petAdvConfig.q_need_items);
				if (obj) 
				{
					_needItem=obj[0].mod;
					_needItemNum=obj[0].num;
				}
			}
			_skin.barJindu.maximum=_petAdvConfig.q_blessnum_limit;
		}
		private function updateBlessData():void
		{
			_skin.barJindu.maximum=_petAdvConfig.q_blessnum_limit;
			_skin.lbJindu.text=_data.rankExp+"/"+_petAdvConfig.q_blessnum_limit;
			_skin.barJindu.value=_data.rankExp;
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
						if(iscanUp())
						{
							showBuyPanel();
						}
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
			var itemName:String=ItemConfig.getItemName(_needItem);
			if (_skin.cboxTip.isSelected==false&&itemNum<_needItemNum)
			{
				//				FloatingText.showUp("材料不足");
				NoticeManager.showNotifyById(9002,itemName);
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
			if(this._avatar)
				this._avatar.dispose();
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
				//成功了停止自动进阶
				if (isSuccess==1) 
				{
					UIPopManager.showAlonePopUI(CenterEftPop,"ui_jichengchenggong");
					if (_isAutoState) 
					{
						setAutoState(false);
					}
					_data=Mgr.petMgr.getPet(_data.modelId);
					setData(_data);
				}
				else
				{
					autoReq=TweenLite.delayedCall(0.25,auToing,[exp]);
				}
			}
		}
		
		private function auToing(...arg):void
		{
			//自动进阶
			var exp:int=arg[0];
			if (_isAutoState&&exp<_petAdvConfig.q_blessnum_limit) 
			{
				if (!reqBlessOnce()) 
				{
					if(iscanUp())
					{
						showBuyPanel();
					}
					setAutoState(false);
				}
				else
				{
					setAutoState(true);
				}
			}
		}
		
		private function iscanUp():Boolean
		{
			if(_data)
			{
				if(_data.rank>=_qPet.q_max_grade)
					return false;
			}
			return true;
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
		
		public function getwidth():int
		{
			return _skin.bg.width;
		}
	}
}