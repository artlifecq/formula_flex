package com.rpgGame.coreData.info.guild
{
	import app.message.FamilyOfficeProto;
	import app.message.FamilyOfficeProto.FamilyPosOfficersProto;
	
	import org.game.netCore.net.ByteBuffer;

	public class GuildFamilyData
	{
		public function GuildFamilyData()
		{
		}
		
		private var familyOffice : FamilyOfficeProto;
		public var items:Array;
		/**
		 * 返回帮派成员数据
		 * <p>
		 * 已经压缩,先解压
		 * <p>
		 * varint32 后面官员数据的长度
		 * <p>
		 * bytes FamilyOfficeProto
		 * <p>
		 * while(buffer.readable()){
		 *      varint64 玩家id
		 *      utf 玩家名字
		 *      varint64 帮派贡献
		 *      varint32 等级
		 *      varint64 战斗力
		 * }
		 */
		public function setup(bytes:ByteBuffer):void
		{
			items = [];
			familyOffice = new FamilyOfficeProto();
			var bytebuffer : ByteBuffer = new ByteBuffer();
			bytes.readBytes(bytebuffer);
			bytebuffer.uncompress();
			
			var office:ByteBuffer = new ByteBuffer();
			var len:int = bytebuffer.readVarint32();
			bytebuffer.readBytes(office,0,len);
			
			familyOffice = new FamilyOfficeProto();
			familyOffice.mergeFrom(office);
			
			var item : GuildFamilyItemData;
			while(bytebuffer.bytesAvailable)
			{
				item = new GuildFamilyItemData();
				item.setup(bytebuffer);
				item.familyPos = getFamilyPos(item.id);
				items.push(item);
			}
		}
		
		private function getFamilyPos(id:Number):int
		{
			var result : int = int.MAX_VALUE;
			for each(var pos : FamilyPosOfficersProto in familyOffice.officers)
			{
				if(!pos || !pos.leaderId)
					continue;
				for each(var leader : Number in pos.leaderId)
				{
					if(leader == id)
						return pos.pos;
				}
			}
			return result;
		}
	}
}