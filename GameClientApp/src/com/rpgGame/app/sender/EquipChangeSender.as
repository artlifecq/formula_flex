package com.rpgGame.app.sender
{
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import app.cmd.EquipmentModuleMessages;
	import app.message.MaterialDataProto;

	public class EquipChangeSender extends BaseSender
	{
		public function EquipChangeSender()
		{
			super();
		}
		/**
		 * 装备打造 
		 * @param equipId
		 * @param items
		 * @param useBand
		 * 
		 */		
		public static function MakeEquip(equipId:int,items:Array,useBand:Boolean):void
		{
			var len : uint = items.length;
			var i : uint = 0;
			var item : ClientItemInfo;
			var materialData : MaterialDataProto;
			_bytes.writeVarint32(equipId);
			_bytes.writeVarint32(len);
			for(;i<len;i++)
			{
				item = items[i];
//				_bytes.writeVarint32(ItemCfgData.getMaterialDataProtoLevel(item.cfgId));
			}
			_bytes.writeBoolean(useBand);
			i = 0;
			for(;i<len;i++)
			{
				item = items[i];
				_bytes.writeVarint32(item.index);
				_bytes.writeVarint32(item.count);
			}
			send(EquipmentModuleMessages.C2S_BUILD_EQUIPMENT,_bytes);
		}
		
	}
}