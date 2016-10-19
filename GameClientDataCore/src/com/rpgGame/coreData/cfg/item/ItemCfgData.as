package com.rpgGame.coreData.cfg.item
{
	import com.game.mainCore.core.utils.TextFormatUtil;
	import com.netease.protobuf.Message;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	
	import flash.utils.Dictionary;
	
	import app.message.DuanGuDanGoodsDataProto;
	import app.message.EquipmentDataProto;
	import app.message.FeedGoodsDataProto;
	import app.message.GoodsConfig;
	import app.message.GoodsDataProto;
	import app.message.GoodsType;
	import app.message.MaterialDataProto;
	import app.message.MountExpGoodsDataProto;
	import app.message.MountSpellBookGoodsDataProto;
	import app.message.NormalUsableDataProto;
	import app.message.RefinedStatGoodsDataProto;
	import app.message.SpellBookGoodsDataProto;
	import app.message.SpriteStatProto;
	import app.message.TransportationDataProto;
	import app.message.UsableGoodsDataProto;
	import app.message.NormalUsableDataProto.NormalEfficacy;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 物品的静态配置属性 
	 * @author fly.liuyang
	 * 
	 */	
	public class ItemCfgData
	{
		/**获取购买一组物品的上限*/
		private static const MAX_BUY_ITEM_COUNT:int = 99;
		/**
		 * 每种物品对应的解析类 
		 */		
		private static var DECODE_CLASS_DIC:Dictionary = new Dictionary();
//		DECODE_CLASS_DIC[GoodsType.PANEL] = PanelGoodsDataProto;
		DECODE_CLASS_DIC[GoodsType.EQUIPMENT] = EquipmentDataProto;
		DECODE_CLASS_DIC[GoodsType.TRANSPORTATION] = TransportationDataProto;
		DECODE_CLASS_DIC[GoodsType.PACKAGE] = GoodsDataProto;
		DECODE_CLASS_DIC[GoodsType.NORMAL] = GoodsDataProto;
		DECODE_CLASS_DIC[GoodsType.TASK_BOOK] = GoodsDataProto;
		DECODE_CLASS_DIC[GoodsType.SPELL_BOOK] = SpellBookGoodsDataProto;
		DECODE_CLASS_DIC[GoodsType.DUAN_GU_DAN] = DuanGuDanGoodsDataProto;
		DECODE_CLASS_DIC[GoodsType.FEED] = FeedGoodsDataProto;
		DECODE_CLASS_DIC[GoodsType.MOUNT_EXP] = MountExpGoodsDataProto;
		DECODE_CLASS_DIC[GoodsType.MOUNT_SPELL_BOOK] = MountSpellBookGoodsDataProto;
		
		/** 物品名称缓存, 不要每次都BytesUtil.bytes2UTF*/
		private static var _MAP_ITEMNAME_STR_CACHE:HashMap = new HashMap();
		/** 物品描述缓存, 不要每次都BytesUtil.bytes2UTF*/
		private static var _MAP_ITEM_DESC_STR_CACHE:HashMap = new HashMap();
		
		private static var _itemMap:HashMap = new HashMap();
		
		public static function setAllCfgData(allGoods:GoodsConfig):void
		{
			var arr:Array = allGoods.data;
			for each (var goods:GoodsDataProto in arr) 
			{
				addCfgData(goods);
				setupStaticItem(goods);
			}
		}
		
		private static function setupStaticItem(goods:GoodsDataProto):void
		{
			if(!goods)
				return;
			if(goods.usableGoods && goods.usableGoods.normal)
			{
				if(goods.usableGoods.normal.efficacy == NormalEfficacy.OPEN_DEPOT_GRID)
					StaticItem.UNLOCK_BACKPACK = goods.id;
			}
		}
		
		public static function addCfgData(goods:GoodsDataProto):int
		{
				var cfgId:int;
				if(goods is GoodsDataProto)
				{
					cfgId  = (goods as GoodsDataProto).id;
				}else
				{
					
					if(goods.hasOwnProperty("baseData"))
					{
						var gdp:GoodsDataProto = goods["baseData"] as GoodsDataProto;
						if(!gdp)
						{
							trace("Error? staticGoodsBytes have not proprety:baseData" );
							return 0;
						}
						cfgId  = gdp.id;
					}
				}
				_itemMap.add(cfgId,goods);
				return cfgId;
		}
		
		public static function addCfgMessage(cfgId:int,goodType:int,message:Message):void
		{
			_itemMap.add(cfgId,message);
		}
		
		//-----------------------------   所有物品静态属性或许 begin------------------------------------
		
		public static function getBaseStat(cfgId:int):SpriteStatProto
		{
			var message:Message = _itemMap.getValue(cfgId);
			if(message && message.hasOwnProperty("baseStat"))
			{
				var spriteStatProto:SpriteStatProto　= message["baseStat"]
			}
			return spriteStatProto;
		}
		
		
		public static function hasItemCfg(cfgId:int):Boolean
		{
			var message:Message = _itemMap.getValue(cfgId);
			return message != null;
		}
		
		/** 物品的类型  对应 EnumItemType 里的枚举*/
		public static function getItemType(cfgId:int):int
		{
			var goods : GoodsDataProto = _itemMap.getValue(cfgId);
			return goods?goods.goodsType:0;
		}
		
		/** 名字  */	
		public static function getItemName(cfgId:int):String
		{
			var nameStr:String = _MAP_ITEMNAME_STR_CACHE.getValue(cfgId)
			if(nameStr == null)
			{
				nameStr = "";
				var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
				if(goodsDataProto)
				{
					nameStr = goodsDataProto.name;
					_MAP_ITEMNAME_STR_CACHE.add(cfgId,nameStr);
				}
			}
			return nameStr;
		}
		
		/** 名字  */	
		public static function getItemNameWithQualityColor(cfgId:int):String
		{
			var cloor:uint = getItemQualityColor(cfgId);
			var itemName:String = getItemName(cfgId);
			return TextFormatUtil.getColorSizeText(itemName,cloor,12);
		}
		
		/** 物品描述 */
		public static function getItemDesc(cfgId:int) : String
		{
			var str:String = _MAP_ITEM_DESC_STR_CACHE.getValue(cfgId)
			if(str == null)
			{
				str = "";
				var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
				if(goodsDataProto)
				{
					str = goodsDataProto.desc;
					_MAP_ITEM_DESC_STR_CACHE.add(cfgId,str);
				}
			}
			return str;
		}
		/**获取普通物品的使用效果**/
		public static function getNormalUsableType(cfgId:int):int
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto && goodsDataProto.usableGoods && goodsDataProto.usableGoods.normal)
			{
				return goodsDataProto.usableGoods.normal.efficacy;
			}
			return 0;
		}
		
		/** 物品出售价格 */
		public static function getItemSellPrice(cfgId:int) : int
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto)
			{
				return goodsDataProto.sellPrice;
			}
			return 0;
		}
		
		/** 物品最大堆叠数 */
		public static function getItemMaxCount(cfgId:int) : int
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto)
			{
				return goodsDataProto.maxCount;
			}
			return 0;
		}
		
		/** 物品品质 */
		public static function getItemQuality(cfgId:int) : int
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto)
			{
				return goodsDataProto.quality;
			}
			return -1;
		}
		
		/** 物品品质颜色 */
		public static function getItemQualityColor(cfgId:int) : int
		{
			var quality:int = getItemQuality(cfgId);
			return ItemQualityType.getColorValue(quality);
		}
		
		/** 物品等级需求 */
		public static function getItemRequireLevel(cfgId:int) : int
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto)
			{
				return goodsDataProto.requireLevel;
			}
			return 0;
		}
		
		/** 是否可以丢弃，true为可以丢弃 */
		public static function getItemDropable(cfgId:int) : Boolean
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto)
			{
				return goodsDataProto.dropable;
			}
			return false;
		}
		
		/** 出售物品是否需要二次确认，true为需要  */
		public static function getItemVerifySell(cfgId:int) : Boolean
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto)
			{
				return goodsDataProto.verifySell;
			}
			return false;
		}
		
		/** 丢弃物品是否需要二次确认，true为需要  */
		public static function getItemVerifyDrop(cfgId:int) : Boolean
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto)
			{
				return goodsDataProto.verifyDrop;
			}
			return false;
		}
		
		/** 物品图标编号 */
		public static function getItemIcon(cfgId:int) : String
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto)
			{
				return goodsDataProto.icon;
			}
			return "";
		}
		
		/** 物品公共冷却层级 */
		public static function getItemCdType(cfgId:int) : int
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto&&goodsDataProto.usableGoods)
			{
				return goodsDataProto.usableGoods.cdType;
			}
			return 0;
		}
		
		/** 物品冷却cd time 毫秒 */
		public static function getItemCdTime(cfgId:int):int
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto&&goodsDataProto.usableGoods)
			{
				return goodsDataProto.usableGoods.cd;
			}
			return 0;
		}
		
		/** 物品能否使用 */
		public static function getItemUseable(cfgId:int) : Boolean
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto&&goodsDataProto.usableGoods)
			{
				return goodsDataProto.usableGoods.isSuggestion;
			}
			return false;
		}
		
		/** 物品能否批量使用 */
		public static function getItemBulkUseable(cfgId:int) : Boolean
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto&&goodsDataProto.usableGoods)
			{
				return goodsDataProto.usableGoods.bulkUseable;
			}
			return false;
		}
		
		/** 能否放到快捷键中，true表示可以 */
		public static function getItemCanSetShortCut(cfgId:int) : Boolean
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto&&goodsDataProto.usableGoods)
			{
				return goodsDataProto.usableGoods.canSetShortcut;
			}
			return false;
		}
		
		/** 是否提示使用（如双倍经验丹），true表示提示使用 */
		public static function getItemIsSuggestion(cfgId:int) : Boolean
		{
			var goodsDataProto:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goodsDataProto&&goodsDataProto.usableGoods)
			{
				return goodsDataProto.usableGoods.isSuggestion;
			}
			return false;
		}
		
//		/** 获取打开面板类型的物品，打开的面板id */
//		public static function getPanelId(cfgId:int) : int
//		{
//			var type:int = getItemType(cfgId);
//			if(type == GoodsType.PANEL)
//			{
//				var message:Message =  _itemMap.getValue(cfgId);
//				if(message)
//				{
//					var panelGoodsDataProto:PanelGoodsDataProto = message as PanelGoodsDataProto;
//					if(panelGoodsDataProto)
//					{
//						return panelGoodsDataProto.panel;
//					}
//				}
//				return -1;
//			}
//			return -1;
//		}
		
		//-----------------------------   所有物品静态属性或许 end ------------------------------------
		
		//////////////////////////////坐骑部分///////////////////////////////////
		/**
		 * 获取坐骑经验丹加的经验 
		 * @param cfg
		 * @return 
		 * 
		 */		
		public static function getMountExpGoodsAddExp(cfg:uint):Number
		{
			var goods : GoodsDataProto = _itemMap.getValue(cfg);
			if(goods && goods.mountExp)
				return goods.mountExp.addExp.toNumber();
			return 0;
		}
		/**
		 * 获取饲料添加的饥饿度 
		 * @param cfg
		 * @return 
		 * 
		 */		
		public static function getMountFeedGoodsAddHunger(cfg:uint):int
		{
			var goods : GoodsDataProto = _itemMap.getValue(cfg);
			if(goods && goods.feedGoods)
				return goods.feedGoods.reduceHungerDegree;
			return 0;
		}
		/**
		 * 获取锻骨丹增加的根骨经验 
		 * @param cfg
		 * @return 
		 * 
		 */		
		public static function getMountDuanGuDanAddVitalityExp(cfg:uint):int
		{
			var goods : GoodsDataProto = _itemMap.getValue(cfg);
			if(goods && goods.duanGuDan)
				return goods.duanGuDan.addVitalityExp;
			return 0;
		}
		
		/**
		 * 坐骑技能书分组 
		 * @param cfg
		 * @return 
		 * 
		 */		
		public static function getMountSpellBookGroup(cfg:uint):int
		{
			var goods : GoodsDataProto = _itemMap.getValue(cfg);
			if(goods && goods.mountSpellBooks)
				return goods.mountSpellBooks.spellGroup;
			return 0;
		}
		
		/**
		 * 坐骑技能书分组名 
		 * @param cfg
		 * @return 
		 * 
		 */		
		public static function getMountSpellBookGroupName(cfg:uint):String
		{
			var goods : GoodsDataProto = _itemMap.getValue(cfg);
			if(goods && goods.mountSpellBooks)
				return goods.mountSpellBooks.spellGroupName;
			return "";
		}
		
		/**
		 * 坐骑技能书等级
		 * @param cfg
		 * @return 
		 * 
		 */		
		public static function getMountSpellBookLevel(cfg:uint):int
		{
			var goods : GoodsDataProto = _itemMap.getValue(cfg);
			if(goods && goods.mountSpellBooks)
				return goods.mountSpellBooks.spellLevel;
			return 0;
		}
		
		//////////////////////////////坐骑部分///////////////////////////////////
		
		/**
		 * 获得药品的作用效果 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getMedicEfficacy(cfgId:uint):int
		{
			var goods:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goods && goods.hasUsableGoods && UsableGoodsDataProto(goods.usableGoods).hasNormal)
			{
				return NormalUsableDataProto(goods.usableGoods.normal).efficacy;
			}
			return 0;
		}
		
		/**
		 * 获取令牌类型  
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getSummonTokenType(cfgId:uint):int
		{
			var goods:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goods && goods.hasUsableGoods && UsableGoodsDataProto(goods.usableGoods).summonToken)
			{
				return UsableGoodsDataProto(goods.usableGoods).summonToken.tokenType;
			}
			return 0;
		}
		
		/**
		 * 判断某个物品是否是可使用 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function isNormalUsable(cfgId:uint):Boolean
		{
			var goods:GoodsDataProto = getGoodsDataProto(cfgId);
			if(goods && goods.hasUsableGoods)
			{
				return true;
			}
			return false;
		}
		
		/**
		 * 获取物品的静态数据对象 
		 * 
		 * 如果一定要公开此方法，请三思后再公开，
		 */		
		private static function getGoodsDataProto(cfgId:int):GoodsDataProto
		{
			var message:Message = _itemMap.getValue(cfgId);
			if(message)
			{
				if(message is GoodsDataProto)
				{
					return message as GoodsDataProto;
				}else
				{
					return message["baseData"]
				}
			}
			return null;
		}
		
		/**
		 * 获取材料等级 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getMaterialDataProtoLevel(cfgId:int):int
		{
			var message:Message = _itemMap.getValue(cfgId);
			var g:GoodsDataProto = message is GoodsDataProto ? message as GoodsDataProto : null;
			if(!g || g.goodsType != GoodsType.MATERIAL || g.materials == null)return 0;
			return g.materials.level;
		}
		/**
		 * 获取分组ID 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getMaterialDataGroup(cfgId:int):int
		{
			var message:Message = _itemMap.getValue(cfgId);
			var g:GoodsDataProto = message is GoodsDataProto ? message as GoodsDataProto : null;
			if(!g || g.goodsType != GoodsType.MATERIAL || g.materials == null)return 0;
			return MaterialDataProto(g.materials).group;
		}
		
		/**
		 * 获取分组名 
		 * @param group
		 * @return 
		 * 
		 */		
		public static function getMaterialDataGroupName(group:int):String
		{
			var message:Message ;
			var g:GoodsDataProto;
			var array : Array = _itemMap.getValues();
			for each(message in array)
			{
				g = message is GoodsDataProto ? message as GoodsDataProto : null;
				if(!g || !g.hasMaterials)
					continue;
				if(g.materials.group == group)
					return g.materials.groupName;
			}
			return "";
		}
		
		
		public static function getRefinedType(cfgId:int):int
		{
			var message:Message = _itemMap.getValue(cfgId);
			if(message && message is RefinedStatGoodsDataProto)
			{
				return RefinedStatGoodsDataProto(message).refinedType;
			}
			return 0;
		}
		
		public static function getSpellBookType(cfgId:int):int
		{
			var message:Message = _itemMap.getValue(cfgId);
			var g:GoodsDataProto = message is GoodsDataProto ? message as GoodsDataProto : null;
			if(!g || g.goodsType != GoodsType.SPELL_BOOK || g.spellBooks == null)return 0;
			return SpellBookGoodsDataProto(g.spellBooks).spellType;
		}
		
		public static function getEquipmentDataProto(cfgId:int):EquipmentDataProto
		{
			var message:Message = _itemMap.getValue(cfgId);
			var g:GoodsDataProto = message is GoodsDataProto ? message as GoodsDataProto : null;
			if(!g || g.goodsType != GoodsType.EQUIPMENT || g.equipment == null)return null;
			return EquipmentDataProto(g.equipment);
		}
		
		/**
		 * 装备等阶 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getEquipmentLevlStage(cfgId:int):int
		{
			var d:EquipmentDataProto = getEquipmentDataProto(cfgId);
			return d?d.levelStage:-1;
		}
		
		/**
		 * 装备类型
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getEquipmentType(cfgId:int):int
		{
			var d:EquipmentDataProto = getEquipmentDataProto(cfgId);
			return d ? d.equipType : -1;
		}
		
		/**
		 * 装备性别 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getEquipmentSex(cfgId:int):int
		{
			var d:EquipmentDataProto = getEquipmentDataProto(cfgId);
			return d ? d.sex : 0;
		}
		
		/**
		 * 装备属性 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getEquipmentRace(cfgId:int):int
		{
			var d:EquipmentDataProto = getEquipmentDataProto(cfgId);
			return d ? d.race : -1;
		}
		
		/** 判断当前物品是否为加血药水 */		
		public static function isAddHpItem(cfgId:int):Boolean
		{
			if (getItemType(cfgId) == GoodsType.MEDICINE && getMedicEfficacy(cfgId) == NormalEfficacy.LIFE)
			{
				return true;
			}
			return false;
		}
		
		/** 判断当前物品是否为加蓝药水 */		
		public static function isAddMpItem(cfgId:int):Boolean
		{
			if (getItemType(cfgId) == GoodsType.MEDICINE && getMedicEfficacy(cfgId) == NormalEfficacy.MANA)
			{
				return true;
			}
			return false;
		}
		
		/**
		 * 根据部位，得到相应的古剑状态 
		 * @param pos			古剑的位置
		 * @return 		
		 * 
		 */		
		public static function getJianLingPosName(pos:int):String
		{
			var name:String = "";
			switch(pos)
			{
				case 0:
					name = "附体中";
					break;
				case 1:
					name = "佩戴中";
					break;
				case 2:
					name = "佩戴中";
					break;
				case 3:
					name = "佩戴中";
					break;
				case 4:
					name = "出战中";
					break;
			}
			return name;
		}
		
		
		/**
		 * 获取装备的基础属性 
		 * @param cfgId
		 */		
		public static function getEquipBaseSpriteStat(cfgId:int):SpriteStatProto
		{
			var message:Message = _itemMap.getValue(cfgId);
//			if(message && message is GujianEquipGoodsDataProto)
//			{
//				var gujianEquipGoodsDataProto:GujianEquipGoodsDataProto = message as GujianEquipGoodsDataProto;
//				return gujianEquipGoodsDataProto.stat;
//			}
			return null;
		}
		
		/**
		 * 获取装备附魔添加的属性 
		 * @param cfgId
		 */		
		public static function getEquipFuMoSpriteStat(cfgId:int):SpriteStatProto
		{
			var message:Message = _itemMap.getValue(cfgId);
//			if(message && message is GujianEquipGoodsDataProto)
//			{
//				var gujianEquipGoodsDataProto:GujianEquipGoodsDataProto = message as GujianEquipGoodsDataProto;
//				return gujianEquipGoodsDataProto.fumoStat;
//			}
			return null;
		}
		
		/**
		 * 判断装备是否可合成 
		 * @param cfgId
		 */		
		public static function isCanCompound(cfgId:int):Boolean
		{
//			var gujianEquipGoodsDataProto:GujianEquipGoodsDataProto = getGuJianEquipDataProto(cfgId);
//			if(gujianEquipGoodsDataProto)
//			{
//				return gujianEquipGoodsDataProto.materialIds.length > 0;
//			}
			return false;
		}
		
		/**
		 * 获取装备的合成材料列表 
		 * @param cfgId
		 */		
		public static function getMaterialIdArr(cfgId:int):Array
		{
//			var gujianEquipGoodsDataProto:GujianEquipGoodsDataProto = getGuJianEquipDataProto(cfgId);
//			if(gujianEquipGoodsDataProto)
//			{
//				return gujianEquipGoodsDataProto.materialIds;
//			}
			return [];
		}
		
		/**
		 * 获取装备的合成材料列表里，每个材料的需要的数量
		 * @param cfgId
		 */		
		public static function getMaterialCountsArr(cfgId:int):Array
		{
//			var gujianEquipGoodsDataProto:GujianEquipGoodsDataProto = getGuJianEquipDataProto(cfgId);
//			if(gujianEquipGoodsDataProto)
//			{
//				return gujianEquipGoodsDataProto.materialCounts;
//			}
			return [];
		}
		
		/** 是否是装备合成碎片 */		
		public static function isFragment(cfgId:int):Boolean
		{
			var gujianEquipGoodsDataProto:int = getGuJianEquipType(cfgId);
			return gujianEquipGoodsDataProto == 1;
		}
		
		/** 是否是附魔材料 */		
		public static function isFuMoMet(cfgId:int):Boolean
		{
			var gujianEquipGoodsDataProto:int = getGuJianEquipType(cfgId);
			return gujianEquipGoodsDataProto == 2;
		}
		
		
		/**
		 * 0或不填，表示装备，1：碎片，2，附魔材料 
		 * @param cfgId
		 * @return 
		 */		
		public static function getGuJianEquipType(cfgId:int):int
		{
//			var gujianEquipGoodsDataProto:GujianEquipGoodsDataProto = getGuJianEquipDataProto(cfgId);
//			if(gujianEquipGoodsDataProto)
//			{
//				return gujianEquipGoodsDataProto.type;
//			}
			return 0;
		}
		
		/**
		 * 获取古剑装备的配置信息 
		 * @param cfgId
		 */		
//		private static function getGuJianEquipDataProto(cfgId:int):GujianEquipGoodsDataProto
//		{
//			var message:Message = _itemMap.getValue(cfgId);
//			if(message && message is GujianEquipGoodsDataProto)
//			{
//				return message as GujianEquipGoodsDataProto;
//			}
//			return null;
//		}
		
		/**
		 * 获取古古剑魂石的配置信息 
		 * @param cfgId
		 */		
//		private static function getGuJianSoulDataProto(cfgId:int):SoulStoneGoodsDataProto
//		{
//			var message:Message = _itemMap.getValue(cfgId);
//			if(message && message is SoulStoneGoodsDataProto)
//			{
//				return message as SoulStoneGoodsDataProto;
//			}
//			return null;
//		}
		
		/**
		 * 获取一种类型的物品 
		 * 会遍历所有的物品，并且拿到物品的原始数据，慎用。
		 * @param type
		 * @return 
		 * 
		 */		
		public static function getItemsByType(type:int):Array
		{
			var result :Array= [];
			for each(var goods : GoodsDataProto in _itemMap.getValues())
			{
				if(goods.goodsType == type)
					result.push(goods);
			}
			return result;
		}
		
		/**
		 * 获取购买一组物品的上限
		 * 现在先统一返回99,如果有需要每个不同的物品限制的数量不一样,就转到配置表里 
		 * @param cfgId
		 */		
		public static function getItemBuyMaxCount(cfgId:int):int
		{
			return MAX_BUY_ITEM_COUNT;
		}
		
		public static function getAllItems():Array
		{
			return _itemMap.getValues();
		}
	}
}