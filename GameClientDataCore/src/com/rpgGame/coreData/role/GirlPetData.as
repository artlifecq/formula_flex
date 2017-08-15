package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.netData.map.bean.PetInfo;
	
	import org.game.netCore.data.LongIdMap;
	import org.game.netCore.data.long;
	
	public class GirlPetData extends RoleData
	{
		private var _modelId:int;
		private var _ownerName:String;
		private var _ownerId:long;
		private var _speakWords:Array;
		public function GirlPetData( priority:int=100)
		{
			super(RoleType.GIRL_PET, priority);
		}
		public function setServerData(info:PetInfo):void
		{
			this.serverID=info.petId;
			this.id=LongIdMap.ToGID(serverID);
			this._modelId=info.petModelId;
			this._ownerId=info.ownerId;
			this.ownerId=info.ownerId.ToGID();
			this._ownerName=info.ownerName;
			this.name=PetCfg.getPet(info.petModelId).q_name;
			this.x=info.x;
			this.y=-info.y;
			this.direction=info.dir;
			trace("美人ID："+info.petId.ToString());
			//			this.avatarInfo.setBodyResID("monster/pt_shiwei_006/pt_shiwei_006",null);
			var q_pet:Q_girl_advance=PetAdvanceCfg.getPet(info.petModelId,info.rank);
			this.avatarInfo.setBodyResID(q_pet.q_skinResID,null);
			this.totalStat.moveSpeed=info.speed;
			var qPet:Q_girl_pet=PetCfg.getPet(info.petModelId);
			if (qPet.q_talkwords) 
			{
				_speakWords=qPet.q_talkwords.split(";");
			}
		}
		
		public function get modId():int
		{
			return _modelId;
		}
		
		public function get ownerName():String
		{
			return _ownerName;
		}
		
		public function get ownerLongId():long
		{
			return _ownerId;
		}

		public function get speakWords():Array
		{
			return _speakWords;
		}

	}
}