package com.rpgGame.app.manager.goods
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
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
	}
}