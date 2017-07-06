package com.rpgGame.coreData.role
{
	import com.rpgGame.netData.map.bean.PetInfo;
	
	import org.game.netCore.data.LongIdMap;

	public class GirlPetData extends RoleData
	{
		private var _modelId:int;
		private var _ownerName:String;
		public function GirlPetData( priority:int=100)
		{
			super(RoleType.GIRL_PET, priority);
		}
		public function setServerData(info:PetInfo):void
		{
			this.serverID=info.petId;
			this.id=LongIdMap.ToGID(serverID);
			this._modelId=info.petModelId;
			this.ownerId=info.ownerId.ToGID();
			this._ownerName=info.ownerName;
			this.name="xxxxx";
			this.x=info.x;
			this.y=info.y;
			this.direction=info.dir;
			this.avatarInfo.setBodyResID("monster/pt_shiwei_006/pt_shiwei_006",null);
		}
	}
}