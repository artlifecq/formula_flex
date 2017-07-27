package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.PetEvent;
	import com.rpgGame.netData.pet.bean.PetInfo;
	import com.rpgGame.netData.pet.message.ResExtraBuyMessage;
	import com.rpgGame.netData.pet.message.ResPetChangeMessage;
	import com.rpgGame.netData.pet.message.ResPetDebutResultMessage;
	import com.rpgGame.netData.pet.message.ResPetListMessage;
	import com.rpgGame.netData.pet.message.ResPetUpResultMessage;
	import com.rpgGame.netData.pet.message.ResPetZoneResultMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	public class PetManager
	{
		public static var ins:PetManager=new PetManager();
		private var _petHash:HashMap;
		private var _bindGlodNum:int=0;
		private var _glodNum:int=0;
		private var _curPetId:int;
		public function PetManager()
		{
			_petHash=new HashMap();
		}
		public function getPet(pet:int):PetInfo
		{
			return _petHash.getValue(pet) as PetInfo;
		}
		
		public function get bindGlodNum():int
		{
			return _bindGlodNum;
		}
		
		public function get glodNum():int
		{
			return _glodNum;
		}
		
		public function resExtraBuyHandler(msg:ResExtraBuyMessage):void
		{
			if(_bindGlodNum!=msg.cashBuy||_glodNum!=msg.goldBuy)
			{
				_bindGlodNum=msg.cashBuy;
				_glodNum=msg.goldBuy;
				EventManager.dispatchEvent(PetEvent.PET_BUYNUM_CHANGE);
			}
		}
		
		public function ResPetUpResultHandler(msg:ResPetUpResultMessage):void
		{
			// TODO Auto Generated method stub
			var old:PetInfo=_petHash.getValue(msg.modelId);
			old.rankExp=msg.rankExp;
			EventManager.dispatchEvent(PetEvent.PET_UP_RESULT,msg.modelId,msg.rankExp,msg.isSuccess);
		}
		
		public function ResPetChangeHandler(msg:ResPetChangeMessage):void
		{
			// TODO Auto Generated method stub
			var newInfo:PetInfo=msg.pets;
			var old:PetInfo=_petHash.remove(newInfo.modelId);
			_petHash.put(newInfo.modelId,newInfo);
			if (old) 
			{
				if (old.actived!=newInfo.actived) 
				{
					EventManager.dispatchEvent(PetEvent.PET_ACTIVE,newInfo.modelId);
				}
			}
			EventManager.dispatchEvent(PetEvent.PET_DATA_CHANGE,newInfo);
		}
		
		public function ResPetListHandler(msg:ResPetListMessage):void
		{
			// TODO Auto Generated method stub
			_petHash.clear();
			for each (var pet:PetInfo in msg.pets) 
			{
				_petHash.put(pet.modelId,pet);
			}
			this._curPetId=msg.petId;
			if(this._curPetId!=0)
			{
				EventManager.dispatchEvent(PetEvent.PET_PANELSHOWORHIDE,true);
			}
			//			EventManager.dispatchEvent(PetEvent.GET_PETS_DATA);
		}	
		
		public function resPetZoneResultHandler(msg:ResPetZoneResultMessage):void
		{
			AppManager.showApp(AppConstant.PET_TIAOZHAN_PANLE,msg);
		}
		
		public function resPetDebutResultMessage(msg:ResPetDebutResultMessage):void
		{
			this._curPetId=msg.modelId;
			
			if(this._curPetId==0)
			{
				EventManager.dispatchEvent(PetEvent.PET_PANELSHOWORHIDE,false);
			}
			else
			{
				EventManager.dispatchEvent(PetEvent.PET_PANELSHOWORHIDE,true);
			}
			EventManager.dispatchEvent(PetEvent.PET_CHANGE);
		}
		
		public function get curPetId():int
		{
			return _curPetId;
		}
		
		public function get petListByJiHuo():Vector.<PetInfo>
		{
			var list:Vector.<PetInfo>=new Vector.<PetInfo>();
			for each(var info:PetInfo in _petHash.values())
			{
				if(info.actived==1&&info.modelId!=_curPetId)
				{
					list.push(info);
				}
			}		
			return list;
		}
		
	}
}