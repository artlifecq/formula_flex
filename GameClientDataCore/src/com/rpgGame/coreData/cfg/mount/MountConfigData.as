package com.rpgGame.coreData.cfg.mount
{
	import org.client.mainCore.ds.HashMap;

	/**
	 * MountConfig
	 * @author 陈鹉光
	 * 
	 */	
	public class MountConfigData
	{
		/** 坐骑物种数据 **/
		public static var mountSpeciesVec:Vector.<MountSpeciesData>;
		/** 所有坐骑数据 **/
		public static var mountDataVec:Vector.<MountUnitData>;
		/** 升级需要经验数据 **/
		public static var mountUpgradeExpHash:HashMap;
		/** 所有根骨数据 **/
		public static var mountVitalitysVec:Vector.<MountVitalityData>;
//		/** 坐骑强化数据 **/
//		public static var mountRefineVec:Vector.<MountRefineData>;
		/** 坐骑饥饿度导致移动速度变化数据 **/
		public static var mountHungerDegreeVec:Vector.<MountHungerDegreeData>;
		
		public function MountConfigData()
		{
		}
		
		/**
		 * 设置登录数据
		 * @param config
		 * 
		 */		
//		public static function setConfig( config:MountConfig ):void
//		{
//			if( config == null )
//				return;
//			
//			mountSpeciesVec = new Vector.<MountSpeciesData>();
//			mountUpgradeExpHash = new HashMap();
//			mountDataVec = new Vector.<MountUnitData>();
//			mountVitalitysVec = new Vector.<MountVitalityData>();
////			mountRefineVec = new Vector.<MountRefineData>();
//			mountHungerDegreeVec = new Vector.<MountHungerDegreeData>();
//			
//			// 坐骑杂项
//			MountMiscData.setConfig( config.mountMisc );
//			
//			// 坐骑物种
//			if( config.mountSpecies != null )
//			{
//				if( config.mountSpecies.species != null && config.mountSpecies.species.length > 0 )
//				{
//					for each (var mountSpeciesDataPro:MountSpeciesDataProto in config.mountSpecies.species) 
//					{
//						var mountSpecieData:MountSpeciesData = new MountSpeciesData();
//						mountSpecieData.setData( mountSpeciesDataPro );
//						mountSpeciesVec.push( mountSpecieData );
//					}
//				}
//			}
//			
//			// 坐骑等级
//			if( config.mountLevel != null )
//			{
//				if( config.mountLevel.level != null && config.mountLevel.level.length > 0 )
//				{
//					var levelArr:Array = config.mountLevel.level;
//					for (var i:int = 0; i < levelArr.length; i++) 
//					{
//						var mountLevelDataPro:MountLevelDataProto = levelArr[i];
//						var expVal:Number = mountLevelDataPro.upgradeExp.toNumber();
//						mountUpgradeExpHash.add( i + 1, expVal );
//					}
//				}
//			}
//			
//			// 所有坐骑
//			if( config.mountDatas != null )
//			{
//				if( config.mountDatas.mount != null && config.mountDatas.mount.length > 0 )
//				{
//					for each ( var mountDatasPro:MountDataProto in config.mountDatas.mount ) 
//					{
//						var mountUnitData:MountUnitData = new MountUnitData();
//						mountUnitData.setMountData( mountDatasPro );
//						mountDataVec.push( mountUnitData );
//					}
//				}
//			}
//			
//			// 坐骑根骨
//			if( config.mountVitality != null )
//			{
//				if( config.mountVitality.vitalitys != null && config.mountVitality.vitalitys.length > 0 )
//				{
//					for each (var mountVitalityDataPro:MountVitalityDataProto in config.mountVitality.vitalitys) 
//					{
//						var mountVitalityData:MountVitalityData = new MountVitalityData();
//						mountVitalityData.setData( mountVitalityDataPro );
//						mountVitalitysVec.push( mountVitalityData );
//					}
//				}
//			}
//			
//			// 坐骑强化
////			if( config.mountRefine != null )
////			{
////				if( config.mountRefine.refineDatas != null && config.mountRefine.refineDatas.length > 0 )
////				{
////					for each (var mountRefineDataPro:MountRefineDataProto in config.mountRefine.refineDatas) 
////					{
////						var mountRefineData:MountRefineData = new MountRefineData();
////						mountRefineData.setData( mountRefineDataPro );
////						mountRefineVec.push( mountRefineData );
////					}
////				}
////			}
//			
//			// 坐骑饥饿度导致移动速度变化
//			if( config.mountHungreDegreeDatas != null )
//			{
//				if( config.mountHungreDegreeDatas.datas != null && config.mountHungreDegreeDatas.datas.length > 0 )
//				{
//					for each (var mountHungerDegreeDataPro:MountHungerDegreeDataProto in config.mountHungreDegreeDatas.datas ) 
//					{
//						var mountHungerDegreeData:MountHungerDegreeData = new MountHungerDegreeData();
//						mountHungerDegreeData.setData( mountHungerDegreeDataPro );
//						mountHungerDegreeVec.push( mountHungerDegreeData );
//					}
//				}
//			}
//		}
		
		//------------------------------------------------静态数据获取方法----------------------------------------------------
		/**
		 * 通过坐骑id获取坐骑数据 
		 * @param id
		 * 
		 */		
		public static function getMountDataById( id:int ):MountUnitData
		{
			var mountUnitData:MountUnitData;
			var len:int = mountDataVec.length;
			for(var i:uint = 0;i < len;i++)
			{
				mountUnitData = mountDataVec[i];
				if( mountUnitData.id == id )
					return mountUnitData;
			}
			return mountUnitData;
		}
		
		/**
		 * 通过物种id获取坐骑物种数据 
		 * @param id
		 * 
		 */		
		public static function getMountSpecieById( id:int ):MountSpeciesData
		{
			var info:MountSpeciesData;
			var len:int = mountSpeciesVec.length;
			for(var i:uint = 0;i < len;i++)
			{
				info = mountSpeciesVec[i];
				if( info.id == id )
					return info;
			}
			return info;
		}
		
		/**
		 * 通过坐骑的根骨（vitality），获得当前根骨的数据 
		 * @param vitality
		 * 
		 */		
		public static function getMountVitalityDataByVitality( vitality:int ):MountVitalityData
		{
			var info:MountVitalityData;
			var len:int = mountVitalitysVec.length;
			for(var i:uint = 0;i < len;i++)
			{
				info = mountVitalitysVec[i];
				if( info.vitality == vitality )
					return info;
			}
			return info;
		}
		
//		/**
//		 * 根据当前坐骑的根骨、以及锻骨丹的根骨、或兽牌根骨、或坐骑根骨，获取强化的数据 
//		 * @param mountVitality 当前坐骑根骨
//		 * @param vitality 锻骨丹的根骨、或兽牌根骨、或坐骑根骨（其中之一）
//		 * @return 坐骑强化 单元数据
//		 * 
//		 */		
//		public static function getMountRefineDataByVitality( mountVitality:int, vitality:int ):MountRefineData
//		{
//			var info:MountRefineData;
//			var len:int = mountRefineVec.length;
//			//所有相等的根骨数据
//			var vitalityVec:Vector.<MountRefineData> = new Vector.<MountRefineData>();
//			
//			for(var i:uint = 0;i < len;i++)
//			{
//				info = mountRefineVec[i];
//				if( info && info.curVitality == mountVitality )
//					vitalityVec.push( info );
//			}
//			
//			var data:MountRefineData;
//			for (var j:int = 0; j < vitalityVec.length; j++) 
//			{
//				
//				if( vitalityVec[j].targetVitality != vitality )
//					continue;
//				data = vitalityVec[j];
//					return data;
//			}
//			return data;
//		}
		
		/**
		 * 获取坐骑所有对应等级所需要升级的经验 
		 * @return 
		 * 
		 */		
		public static function getAllMountUpgradeExpData():Array
		{
			return mountUpgradeExpHash.getValues();
		}
		
		/**
		 * 通过坐骑等级获取坐骑对应的升级的经验 
		 * @param id
		 * @return 
		 * 
		 */		
		public static function getMountUpgradeExpByLevel(level:int):Number
		{
			return mountUpgradeExpHash.getValue(level);
		}
	}
}