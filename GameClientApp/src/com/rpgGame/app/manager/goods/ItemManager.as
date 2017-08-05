package com.rpgGame.app.manager.goods
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.EquipWashCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *所有的物品管理总类（以前的物品管理太分散类。。。）
	 *@author dik
	 *2017-4-7上午11:15:15
	 */
	public class ItemManager
	{
		private static var isGeting:Boolean;
		private static var _isGetBackEquip:Boolean;
		private static var _initComs:Vector.<Function>=new Vector.<Function>();
		public function ItemManager()
		{
		}
		
		/**
		 *能否全部放入背包 
		 * @param id
		 * @param num
		 * @return 
		 * 
		 */
		public static function isCanPushPack(id:int,num:int):Boolean
		{
			var qItem:Q_item=ItemConfig.getQItemByID(id);
			var result:Boolean;
			var hold:int=BackPackManager.instance.getBagItemsCountById(id);
			var useGridNum:int;
			var leftNum:int;
			var leftGridNum:int=BackPackManager.instance.getEmptyGridNum();
			if(qItem.q_max>1){//可堆叠
				if(hold!=0){
					if(hold+num<qItem.q_max){
						result=true;
					}else{
						leftNum=num-(qItem.q_max-hold);
						useGridNum=Math.ceil(leftNum/qItem.q_max);
						result=useGridNum<=leftGridNum;
					}
				}else{
					leftNum=num;
					useGridNum=Math.ceil(leftNum/qItem.q_max);
					result=useGridNum<=leftGridNum;
				}
			}else{
				result=useGridNum<=num;
			}
			return result;
		}
		
		/**
		 *获取背包和装备 
		 * @param complete
		 * 
		 */
		public static function getBackEquip(complete:Function):void
		{
			if(_isGetBackEquip){
				complete();
				return;
			}
			
			if(isGeting){
				return;
			}
			_initComs.push(complete);
			isGeting=true;
			if(!ItemSender.isReqPack){
				EventManager.addEvent(ItemEvent.ITEM_INIT,initPackDatas);
				ItemSender.getItemsByType(ItemContainerID.BackPack);
			}else{
				initPackDatas();
			}
		}
		
		private static function initPackDatas(containerId:int=ItemContainerID.BackPack):void
		{
			if(containerId!=ItemContainerID.BackPack){
				return;
			}
			EventManager.removeEvent(ItemEvent.ITEM_INIT,initPackDatas);
			if(!ItemSender.isReqRole){
				EventManager.addEvent(ItemEvent.ITEM_INIT,initEquipDatas);
			}else{
				initEquipDatas();
			}
		}
		
		private static function initEquipDatas(containerId:int=ItemContainerID.Role):void 
		{
			if(containerId!=ItemContainerID.Role){
				return;
			}
			EventManager.removeEvent(ItemEvent.ITEM_INIT,initEquipDatas);
			isGeting=false;
			_isGetBackEquip=true;
			
			for each(var f:Function in _initComs){
				f();
			}
			_initComs.length=0;
		}
		
		public static function getAllEquipDatas():Array
		{
			var roleDatas:Array=RoleEquipmentManager.instance.getAllItem();
			BackPackManager.instance.setCheckType(null);
			var backDatas:Array=BackPackManager.instance.getAllItem();
			var allDatas:Array=roleDatas.concat(backDatas);
			var i:int=0
			while(i<allDatas.length){
				if(!allDatas[i]||!(allDatas[i] is EquipInfo)){
					allDatas.splice(i,1);
					continue;
				}
				i++;
			}
			return allDatas;
		}
		
		/**
		 *排序消耗装备 
		 * @param equipA
		 * @param equipB
		 * @return 
		 * 
		 */
		public static function onSortUseEquip(equipA : EquipInfo, equipB : EquipInfo) : int
		{
			if(equipA.qItem.q_levelnum==equipB.qItem.q_levelnum){//阶数相同
				if(equipA.qItem.q_default==equipB.qItem.q_default){//品质相同
					if(equipA.qItem.q_strengthen_num==equipB.qItem.q_strengthen_num){//消耗值相同
						return 0;
					}else{
						if(equipA.qItem.q_strengthen_num>equipB.qItem.q_strengthen_num){
							return 1;
						}else{
							return -1;
						}
					}
				}else{
					if(equipA.qItem.q_default>equipB.qItem.q_default){
						return 1;
					}else{
						return -1;
					}
				}
			}else{
				if(equipA.qItem.q_levelnum>equipB.qItem.q_levelnum){
					return 1;
				}else{
					return -1;
				}
			}
			return 0;
		}
		
		//继承判断用	
		/**判断是否有可继承装备*/
		public static function checkItemCanInheritance():Boolean
		{
			var allEquips:Array=getAllEquipDatas();
			var num:int=allEquips.length;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=allEquips[i];
				var equp:EquipInfo=info as EquipInfo;
				if(isCanInheritance(equp)){					
					if(judgeIsHaveItemCanBeInherited(equp))
						return true;
				}
			}
			return false;
		}
		
		//判断是否可以继承
		private static function isCanInheritance(info:EquipInfo):Boolean
		{
			if(info.qItem.q_max_strengthen>0&&!EquipStrengthCfg.isMax(info.strengthLevel))
				return true;
			return false;
		}
		
		/**判断背包中是否有可被继承的装备*/
		private static function judgeIsHaveItemCanBeInherited(targetEquipInfo:EquipInfo):Boolean
		{
			var backDatas:Array=BackPackManager.instance.getAllItem();	
			var num:int=backDatas.length;
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=backDatas[i];
				if(info is EquipInfo)
				{
					if(isCanInheritanceTo(targetEquipInfo,(info as EquipInfo))){
						return true;
					}
				}
			}
			return false;
		}
		
		//判断是否可以被继承
		private static function isCanInheritanceTo(targetEquipInfo:EquipInfo,info:EquipInfo):Boolean
		{
			var job:int=MainRoleManager.actorInfo.job;
			if(targetEquipInfo!=null)
			{
				if((info.qItem.q_job==job||info.qItem.q_job==0)&&info.qItem.q_kind==targetEquipInfo.qItem.q_kind&&(info.strengthLevel>targetEquipInfo.strengthLevel||
					info.polishLevel>targetEquipInfo.polishLevel||info.smeltAtt1!=0||info.smeltAtt2!=0))
				{
					return true;
				}
			}
			return false;
		}
		
		
		/**
		 *能强化 
		 * @param info
		 * @return 
		 * 
		 */
		public static function   isStren(info:EquipInfo):Boolean
		{
			var job:int=MainRoleManager.actorInfo.job;
			if(info.qItem.q_max_strengthen!=0&&info.strengthLevel<info.qItem.q_max_strengthen&&info.qItem.q_job==job){//可强化的
				return true;
			}
			return false;
		}
		
		/**
		 *被用作强化 
		 * @param info
		 * @return 
		 * 
		 */
		public static function isUseStren(info:ClientItemInfo):Boolean
		{
			var equip:EquipInfo=info as EquipInfo;
			if(equip.qItem.q_strengthen_num!=0&&RoleEquipmentManager.equipIsWearing(equip)==false){//消耗获得的值不为0
				return true;
			}
			return false;
		}
		
		/**
		 *有装备可被强化 
		 * @return 
		 * 
		 */
		public static function checkHasEquip2Strengthen():Boolean
		{
			var allEquips:Array=getAllEquipDatas();
			var num:int=allEquips.length;
			var equip:EquipInfo;
			var useEquip:EquipInfo;
			for(var i:int=0;i<num;i++){
				equip=allEquips[i];
				if(isStren(equip)){
					for(var j:int=0;j<num;j++){
						useEquip=allEquips[j];
						if(equip!=useEquip&&isUseStren(useEquip)){
							return true;
						}
					}
				}
			}
			return false;
		}
		/**
		 *有装备可被琢磨 
		 * @return 
		 * 
		 */
		public static function checkHasEquip2ZM():Boolean
		{
			var allEquips:Array=getAllEquipDatas();
			var num:int=allEquips.length;
			var equip:EquipInfo;
			var useEquip:EquipInfo;
			for(var i:int=0;i<num;i++){
				equip=allEquips[i];
				if(isPolish(equip)){
					for(var j:int=0;j<num;j++){
						useEquip=allEquips[j];
						if(equip!=useEquip&&isPolishUse(useEquip)){
							return true;
						}
					}
				}
			}
			return false;
		}
		
		private static function isPolishUse(info:ClientItemInfo):Boolean
		{
			var equip:EquipInfo=info as EquipInfo;
			if(equip.qItem.q_polish_num!=0&&RoleEquipmentManager.equipIsWearing(equip)==false){//消耗获得的值不为0
				return true;
			}
			return false;
		}
		
		private static function isPolish(info:EquipInfo):Boolean
		{
			var job:int=MainRoleManager.actorInfo.job;
			if(info.qItem.q_job==job){
				return true;
			}
			return false;
		}
		
		/**
		 *有装备可被洗练 
		 * @return 
		 * 
		 */
		public static function checkHasEquip2XILIAN():Boolean
		{
			var allEquips:Array=getAllEquipDatas();
			var num:int=allEquips.length;
			var equip:EquipInfo;
			var useEquip:EquipInfo;
			for(var i:int=0;i<num;i++){
				equip=allEquips[i];
				if(isSmelt(equip)){
					for(var j:int=0;j<num;j++){
						useEquip=allEquips[j];
						if(equip!=useEquip&&isSmeltUse(useEquip)){
							return true;
						}
					}
				}
			}
			return false;
		}
		
		private static function isSmeltUse(info:ClientItemInfo):Boolean
		{
			if(EquipWashCfg.washItems.indexOf(info.cfgId)!=-1){
				return true;
			}
			return false;
		}
		
		private static function isSmelt(info:EquipInfo):Boolean
		{
			var job:int=MainRoleManager.actorInfo.job;
			if(info.qItem.q_job==job){
				return true;
			}
			return false;
		}
		
		/**
		 *有装备可被合成 
		 * @return 
		 * 
		 */
		public static function checkHasEquip2HC():Boolean
		{
			BackPackManager.instance.setCheckType(null);
			var backDatas:Array=BackPackManager.instance.getAllItem();
			var num:int=backDatas.length;
			var itemInfo:ClientItemInfo;
			var targetHeCheng:Q_hecheng;
			var caiList:Array;
			for(var i:int=0;i<num;i++){
				itemInfo=backDatas[i];
				if(!itemInfo){
					continue;
				}
				targetHeCheng=HeChengData.getHeChengTargetByTragetId(itemInfo.qItem.q_id); 
				if(targetHeCheng){
					caiList=JSONUtil.decode(targetHeCheng.q_cost_items);
					if(BackPackManager.instance.getBagItemsCountById(itemInfo.qItem.q_id)>=caiList[1]){
						return true;
					}
				}
				targetHeCheng=HeChengData.getHeChengTargetByCaiLiao(itemInfo.qItem.q_id);
				if(targetHeCheng){
					caiList=JSONUtil.decode(targetHeCheng.q_cost_items);
					if(BackPackManager.instance.getBagItemsCountById(itemInfo.qItem.q_id)>=caiList[1]){
						return true;
					}
				}
			}
			return false;
		}
		public static function checkEquip2HCByType(type:int):Boolean
		{
			var arr:Array=HeChengData.getSonTypeListByType(type);
			if(arr==null||arr.length==0) return false;
			for(var i:int=0;i<arr.length;i++)
			{
				if(chackIsCanHC(type,arr[i]))
					return true;
			}
			return false;
		}
		
		public static function chackIsCanHC(type:int,subType:int):Boolean
		{
			var list:Vector.<Q_hecheng>=new Vector.<Q_hecheng>();
			list=HeChengData.getQ_HeChengListBySonType(type,subType);
			var arr:Array;
			if(list==null||list.length==0) return false;
			for(var i:int=0;i<list.length;i++)
			{
				arr=JSONUtil.decode(list[i].q_cost_items);
				if(BackPackManager.instance.getBagItemsCountById(arr[0])>=arr[1])
					return true;
			}
			return false;
		}
	}
}