package com.rpgGame.app.manager.equip
{
	import com.netease.protobuf.Message;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.sender.EquipmentSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.cfg.RaceCfgData;
	import com.rpgGame.coreData.cfg.equip.EquipMainStatCfgData;
	import com.rpgGame.coreData.cfg.equip.EquipMakeCfgData;
	import com.rpgGame.coreData.cfg.equip.EquipTypeNameCfgData;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.TreeNodeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.equip.EquipTreeNodeInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangEquip;
	import com.rpgGame.coreData.type.SexType;
	import com.rpgGame.coreData.utils.TreeUtils;
	
	import app.message.EquipType;
	import app.message.EquipmentBuildMaterialProto;
	import app.message.EquipmentDataProto;
	import app.message.GoodsDataProto;
	import app.message.RaceId;
	import app.message.EquipmentBuildMaterialProto.MaterialGroupDataWithCountProto;
	
	import feathers.data.TreeNode;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 装备打造 
	 * @author Mandragora
	 * 
	 */	
	public class EquipMakeManager extends EquipBaseManager
	{
		/**
		 * 赛选装备时的等级差 
		 */		
		public static const LEVEL_SPACE : int = 15;
		public function EquipMakeManager()
		{
			super(ItemContainerID.EQUIP_MAKE);
		}
		
		override protected function init():void
		{
			super.init();
			defaultCol = 2;
			defaultRow = 8;
			materialItemInfos = new HashMap();
		}
		
		private static var _ins:EquipMakeManager;
		public static function get instance():EquipMakeManager
		{
			if(_ins == null)
			{
				_ins = new EquipMakeManager();
			}
			return _ins;
		}
		
		private var materialLevels : Array;
		private var equipId : int;
		
		public function setEquipId(equipId : int):void
		{
			this.equipId = equipId;
		}
		/**
		 * 设置材料等级 
		 * @param levels
		 * 
		 */		
		public function setMaterialLevels(levels : Array):void
		{
			materialLevels = levels;
		}
		
		private var materialItemInfos : HashMap;
		/**
		 * 添加背包物品信息 
		 * @param index 在gridMap中的位置
		 * @param itemInfo 背包中物品的实际信息
		 * 
		 */		
		public function setMaterial(index:int,itemInfo):void
		{
			materialItemInfos.add(index,itemInfo);
		}
		
		override protected function sendMsg():void
		{
			if(equipId == 0)
			{
				NoticeManager.showNotify(LangEquip.BUILD_FAIL_2);
				return;
			}
			if(!materialLevels || materialLevels.length != 2 || materialItemInfos.length != 2)
			{
				NoticeManager.showNotify(LangEquip.BUILD_FAIL_4);
				return;
			}
			var item : ItemInfo;
			for each(item in materialItemInfos.getValues())
			{
				if(!item)
				{
					NoticeManager.showNotify(LangEquip.BUILD_FAIL_4);
					return;
				}
			}
			EquipmentSender.makeEquipment(equipId,materialLevels,costCheck.isUseSilver,materialItemInfos.getValues());
		}
		
			/**绑定状态提示,fun 检测完成后的操作**/
		override public function updateItemBind(item : ItemInfo,okfun:Function):Boolean
		{
			if(!item)
				return true;
			if(_isNotShowAlertBind)
				return true;
			var haveBindItem : Boolean = false;
			var items : Array = _gridMap.getValues();
			for each(var itemInfo : ItemInfo in items)
			{
				if(itemInfo && itemInfo.binded)
					haveBindItem = true;
			}
			
			var alertSet : AlertSetInfo = new AlertSetInfo();
			alertSet.isShowCBox = !_isNotShowAlertBind;
			if(item.binded != haveBindItem)
			{
				if(haveBindItem && !item.binded)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_NOW_MATER_BIND);
				else if(item.binded && !haveBindItem)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_MATERIAL_HAVE_BIND);
				GameAlert.showAlert(alertSet,onUpdateItemBindClick,okfun);
				return false;
			}
			if(item.binded != costCheck.isUseSilver)
			{
				if(item.binded && !costCheck.isUseSilver)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_MATERIAL_BIND);
				else if(costCheck.isUseSilver && !item.binded)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_SILVER_BIND);
				GameAlert.showAlert(alertSet,onUpdateItemBindClick,okfun);
				return false;
			}
			return true;
		}
		
		private function onUpdateItemBindClick(gameAlert:GameAlert,fun:Function):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					fun();
					break;
			}
			hideAlertBind(gameAlert.isCheckSelected);
		}
		
		override public function getAllItem():Array
		{
			if(!equipId)
				return [];
			return super.getAllItem();
//			return BackPackManager.instance.getItemsByType(GoodsType.MATERIAL);
		}
		
		public function getEquipTreeNode():TreeNode
		{
			var msg : Message;
			var goodsProto : GoodsDataProto;
			var equipment : EquipmentDataProto;
			//用来存放所有类型对应的装备数据
			var equipTypeMap : HashMap = new HashMap();
			var equipTypeChildMap : Array;
			var raceTypeMap : HashMap;
			var equipTreeNodeInfo : EquipTreeNodeInfo;
			var equips : Array;
			var tempArr : Array;
			var data:Object = {name:"装备"};
			var result : TreeNode = new TreeNode(data);
			var items : Array = ItemCfgData.getAllItems();
			var equipmake : EquipmentBuildMaterialProto;
			var materialGroup : MaterialGroupDataWithCountProto;
			var minMakeCount : int;
			var minMakeCountTemp : int;
			var equipDatas : Array = [];
			var sexMap : HashMap;
			var sexArray : Array;
			for each(msg in items)
			{
				goodsProto = msg as GoodsDataProto;
				if(!goodsProto || !goodsProto.hasEquipment)
					continue;
				equipment = goodsProto.equipment;
				if(!equipment )
					continue;
				equipDatas.push(goodsProto);
			}
			equipDatas.sort(equipSort);
			for each(goodsProto in equipDatas)
			{			
				equipment = goodsProto.equipment;
				if(!equipment )
					continue;
				if(equipment.equipType == EquipType.SECOND_WEAPON)
					continue;//过滤掉副手
				if(!EquipMakeCfgData.getMakeEquipMaterial(goodsProto.id))//过滤掉不能打造的物品
					continue;
				//通过装备
				tempArr = equipTypeMap.getValue(equipment.equipType);
				if(!tempArr)
				{
					//这里放一个作为根节点,初始化一个大类型
					equipTreeNodeInfo = new EquipTreeNodeInfo();
					equipTreeNodeInfo.type = TreeNodeEnum.TREE_NODE_ROOT;
					equipTreeNodeInfo.name = EquipTypeNameCfgData.getTypeNameUrlByKey(equipment.equipType);
					raceTypeMap = new HashMap();
					tempArr = [equipTreeNodeInfo,raceTypeMap];
					equipTypeMap.add(equipment.equipType,tempArr);
				}else
				{
					raceTypeMap = tempArr[1];
				}
				//下面这部分等具体配置出来了再做
				if(equipment.equipType == EquipType.WEAPON)
				{
					if(equipment.race == RaceId.ZHONG_JIAN || equipment.race == RaceId.YIN_QIANG || equipment.race == RaceId.KUANG_FU )
						continue;//暂时过滤掉这几个职业
					//如果是武器，就要区分职业
					equips = raceTypeMap.getValue(equipment.race);
					if(!equips)
					{
						equipTreeNodeInfo = new EquipTreeNodeInfo();//根据职业,霸刀之类的
						equipTreeNodeInfo.type = TreeNodeEnum.TREE_NODE_CHILD;
						equipTreeNodeInfo.name = RaceCfgData.getRaceName(equipment.race)?RaceCfgData.getRaceName(equipment.race):"未知id"+goodsProto.name;
						equips = [equipTreeNodeInfo];
						raceTypeMap.add(equipment.race,equips);
					}
				}else if(equipment.equipType == EquipType.ARMOR)
				{
					//如果是衣服，就分一下男女
					sexArray = raceTypeMap.getValue(equipment.sex);
					if(!sexArray)
					{
						equipTreeNodeInfo = new EquipTreeNodeInfo();
						equipTreeNodeInfo.name = SexType.getName(equipment.sex);
						equipTreeNodeInfo.type = TreeNodeEnum.TREE_NODE_CHILD;
						sexMap = new HashMap();
						sexArray = [equipTreeNodeInfo,sexMap];
						raceTypeMap.add(equipment.sex,sexArray);
					}else
						sexMap = sexArray[1];
					equips = sexMap.getValue(equipment.refineMainStatId);
					if(!equips)
					{
						equipTreeNodeInfo = new EquipTreeNodeInfo();
						equipTreeNodeInfo.name = EquipMainStatCfgData.getTypeName(equipment.refineMainStatId);//RaceCfgData.getRaceName(equipment.race);
						equipTreeNodeInfo.type = TreeNodeEnum.TREE_NODE_CHILD;
						equips = [equipTreeNodeInfo];
						sexMap.add(equipment.refineMainStatId,equips);
					}
				}else
				{
					//下面的是普通装备，以后会区分物防法防之类的
					equips = raceTypeMap.getValue(equipment.refineMainStatId);
					if(!equips)
					{
						equipTreeNodeInfo = new EquipTreeNodeInfo();
						equipTreeNodeInfo.name = EquipMainStatCfgData.getTypeName(equipment.refineMainStatId);//RaceCfgData.getRaceName(equipment.race);
						equipTreeNodeInfo.type = TreeNodeEnum.TREE_NODE_CHILD;
						equips = [equipTreeNodeInfo];
						raceTypeMap.add(equipment.refineMainStatId,equips);
					}
				}
				if(!equips)
					continue;
				equipTreeNodeInfo = new EquipTreeNodeInfo();
				equipTreeNodeInfo.cfgId = goodsProto.id;
				equipTreeNodeInfo.level = ItemCfgData.getItemRequireLevel( goodsProto.id );
				equipTreeNodeInfo.name = goodsProto.name;
				equipTreeNodeInfo.race = equipment.race;
				equipTreeNodeInfo.type = TreeNodeEnum.TREE_NODE_CHILD_TWO;
				equips.push(equipTreeNodeInfo);
				
				equipmake= EquipMakeCfgData.getMakeEquipMaterial(goodsProto.id);
				if(!equipmake || !equipmake.groupWithCount || equipmake.groupWithCount.length != 2)
					continue;//如果消耗材料数不是2肯定是配置有问题
				minMakeCount = int.MAX_VALUE;
				
				for each(materialGroup in equipmake.groupWithCount)
				{
					if(!materialGroup)
					{
						minMakeCount = 0;
						continue;
					}
					minMakeCountTemp = Math.floor(BackPackManager.instance.getItemsCountByGroup(materialGroup.group)/materialGroup.count);
					if(minMakeCount!=0 && minMakeCount>minMakeCountTemp)
						minMakeCount = minMakeCountTemp;
				}
				equipTreeNodeInfo.makeCount = minMakeCount;
				if(equips && equips[0] as EquipTreeNodeInfo)
					(equips[0] as EquipTreeNodeInfo).makeCount += minMakeCount;
				if(tempArr && tempArr[0] as EquipTreeNodeInfo)
					(tempArr[0] as EquipTreeNodeInfo).makeCount += minMakeCount;
				
			}
			result = TreeUtils.setTreeNode(result,equipTypeMap.getValues());
			return result;
		}
		
		private function equipSort(v1 : GoodsDataProto,v2:GoodsDataProto):int
		{
			if(v1.equipment.levelStage > v2.equipment.levelStage)
				return 1;
			else
				return -1;
			return 0;
		}
	}
}