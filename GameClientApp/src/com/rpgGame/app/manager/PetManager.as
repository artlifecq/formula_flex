package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.events.PetEvent;
	import com.rpgGame.netData.pet.bean.PetInfo;
	import com.rpgGame.netData.pet.message.ResPetChangeMessage;
	import com.rpgGame.netData.pet.message.ResPetListMessage;
	import com.rpgGame.netData.pet.message.ResPetUpResultMessage;
	
	import org.client.mainCore.manager.EventManager;

	public class PetManager
	{
		public static var ins:PetManager=new PetManager();
		private var _petHash:HashMap;
		private var _curPetId:int;
		public function PetManager()
		{
			_petHash=new HashMap();
		}
		public function getPet(pet:int):PetInfo
		{
			return _petHash.getValue(pet) as PetInfo;
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
			EventManager.dispatchEvent(PetEvent.GET_PETS_DATA);
		}	

		public function get curPetId():int
		{
			return _curPetId;
		}

	}
}