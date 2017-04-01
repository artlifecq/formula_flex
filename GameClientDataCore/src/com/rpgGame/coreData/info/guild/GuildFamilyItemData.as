package com.rpgGame.coreData.info.guild
{
	import app.message.FamilyOfficerPos;
	
	import org.game.netCore.net_protobuff.ByteBuffer;

	public class GuildFamilyItemData
	{
		public function GuildFamilyItemData()
		{
		}
		
		public var id : Number;
		public var name:String;
		public var gongxian:Number;
		public var fightAmount:Number;
		public var familyPos:int;
		public var level : int;
		/**
		 		varint64 玩家id
		 *      utf 玩家名字
		 *      varint64 帮派贡献
		 *      varint32 等级
		 *      varint64 战斗力
		 */		
		public function setup(byte:ByteBuffer):void
		{
			id = byte.readVarint64();
			name = byte.readUTF();
			gongxian = byte.readVarint64();
			level = byte.readVarint32();
			fightAmount = byte.readVarint64();
		}
		
		public function getFightAmount():String
		{
			if(fightAmount>10000)
				return int(fightAmount/10000)+"W";
			return fightAmount+"";
		}
		
		public function getFamilyPosName():String
		{
			switch(familyPos)
			{
				case FamilyOfficerPos.LEADER:
					return "族长"
					break;
				case FamilyOfficerPos.VICE_LEADER:
					return "副族长"
					break;
			}
			return "--";
		}
	}
}