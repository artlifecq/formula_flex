package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.mount.MountManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.TextSizeUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StatNameCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.mount.MountConfigData;
	import com.rpgGame.coreData.cfg.mount.MountMiscData;
	import com.rpgGame.coreData.cfg.mount.MountSpeciesData;
	import com.rpgGame.coreData.cfg.mount.MountUnitData;
	import com.rpgGame.coreData.cfg.mount.MountVitalityData;
	import com.rpgGame.coreData.info.item.MountBeastCardInfo;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	import com.rpgGame.coreData.info.stat.StatData;
	import com.rpgGame.coreData.lang.LangMount;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.Label;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 坐骑兽牌tips 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountBeastCardTip extends SkinUI implements ITip
	{
		private var _mountBeastCardTip:Object;//MountBeastCardTipSkin;
		/** 图标icon **/
		private var titleIconFace:IconCDFace;
		/** 坐骑数据 **/
		private var _mountData:MountInfoData;
		/** 初始化坐骑tips **/
		private var _data:MountBeastCardInfo;
		/** tips高度 **/
		private var tipsHeight:Number;
		
		public function MountBeastCardTip()
		{
//			_mountBeastCardTip = new MountBeastCardTipSkin();
			super( _mountBeastCardTip );
			initTip();
		}
		
		private static var _instance:MountBeastCardTip = null;
		public static function get instance() : MountBeastCardTip
		{
			if (null == _instance)
			{
				_instance = new MountBeastCardTip();
			}
			return _instance;
		}
		 
		/**
		 * 初始化坐骑tips
		 * 
		 */		 
		private function initTip():void
		{
			titleIconFace = FaceUtil.creatIconCDFaceByUIAsset( _mountBeastCardTip.imgIcon, 46, 0 );
		}
		
		/**
		 * 获取物品tips背景高度 
		 * @return 
		 * 
		 */        
		public override function get height():Number
		{
			return _mountBeastCardTip.imgBG.height <= 566 ? 566 : _mountBeastCardTip.imgBG.height;
		}
		
		/**
		 * 设置坐骑tips 
		 * @param data
		 * 
		 */		
		public function setTipData( data:* ):void
		{
			_data = data as MountBeastCardInfo;
			if( _data != null )
			{
				setMountTips( _data );
			}
		}
		
		/**
		 * 设置坐骑的tips 
		 * @param data 当前的兽牌数据
		 * 
		 */		
		private function setMountTips( data:MountBeastCardInfo ):void
		{
			if( data == null )
				return;
			
			var tipsStr:String = "";
			var mountUnitData:MountUnitData = MountConfigData.getMountDataById( data.id );
			if( mountUnitData == null )
				return;
			
			//坐骑物种数据
			var mountSpeciesData:MountSpeciesData = MountConfigData.getMountSpecieById( mountUnitData.speciesId );
			if( mountSpeciesData == null )
				return;
			
			//头部icon
			FaceUtil.SetItemGrid( titleIconFace, data, false );
			//坐骑前缀 
			var mountPrefixTypeStr:String = MountManager.getPrefixType( mountUnitData.prefixType );
			//坐骑类型（0：成年、1：宝宝、2：变异、3：二代）
			var mountTypeStr:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_7_1, MountManager.getMountType( mountUnitData.mountType ) );
			//名字
			var mountName:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_1, mountPrefixTypeStr + mountUnitData.name );
			//寿命
			var liftTime:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_2, mountSpeciesData.maxLifeTime );
			//性别
			var sex:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_3, MountManager.getMountSexStr( data.sex ) );
			//等级
			var level:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_4, data.mountLevel );
			//状态
			var mountStatus:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_5, MountManager.getMountBeastCardStatue( data ) );
			//携带等级
			var requiredLevelColor:uint;
			if( MainRoleManager.actorInfo.totalStat.level < mountSpeciesData.requiredLevel )
				requiredLevelColor = StaticValue.RED_TEXT;
			else
				requiredLevelColor = StaticValue.GREEN_TEXT;
			var requiredLevel:String = HtmlTextUtil.getTextColor( requiredLevelColor, LanguageConfig.getText( LangMount.MOUNT_TIPS_6, mountSpeciesData.requiredLevel ) );
			//物种
			var speciesStr:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_7, mountUnitData.name );
			//饱食度
			var feedDegree:String = "";
			var hungerDegree:int = MountMiscData.autoDownFromMountHungerDegree;
			if( ( MountMiscData.maxHungerDegree - data.hungerDegree ) <= hungerDegree )
				feedDegree = LanguageConfig.getText( LangMount.MOUNT_TIPS_8_1, ( MountMiscData.maxHungerDegree - data.hungerDegree ) + "/" + MountMiscData.maxHungerDegree );
			else
				feedDegree = LanguageConfig.getText( LangMount.MOUNT_TIPS_8, ( MountMiscData.maxHungerDegree - data.hungerDegree ) + "/" + MountMiscData.maxHungerDegree );
			
			//资质 + 根骨
			var ziZhiAndGenGu:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_9, MountManager.getMountZiZhiStr( mountUnitData.quality ), "+ " + data.vitality );
			
			
			//根骨属性
			var curVitalityData:MountVitalityData = MountConfigData.getMountVitalityDataByVitality( data.vitality );
			var curStatArr:Array = curVitalityData.stat.getStatValues();
			var curStatValue:Number;
			var curDifference:Number;
			
			//基础属性、成长属性、转化属性
			var len:uint = data.mountBornStat.getStatValues().length;
			var label:Label;
			var mountBornStatValue:int;
			var mountGrowthTransStatValue:int;
			var mountGrowthStatValue:int;
			var bornStat:StatData;
			var growthTransStat:StatData;
			var growthStat:StatData; 
			var bornStatValueStr:String = "";
			var growthTransStatStr:String = "";
			var growthStatStr:String = "";
			var str:String = "";
			var i:int;
			for ( i = 0; i < len; i++) 
			{
				label=new Label();
				label.width = 250;
				label.height = 18;
				
				
				//基础属性
				if( data.mountBornStat != null )
				{
					var mountBornStatArr:Array = data.mountBornStat.getStatValues();
					if( mountBornStatArr != null && mountBornStatArr.length > 0 )
					{
						bornStat = mountBornStatArr[i];
						mountBornStatValue = bornStat.value ? bornStat.value: bornStat.percent;
					}
				}
				
				//成长属性
				if( data.mountGrowthStat != null )
				{
					var mountGrowthStatArr:Array = data.mountGrowthStat.getStatValues();
					if( mountGrowthStatArr != null && mountGrowthStatArr.length > 0 )
					{
						growthStat = mountGrowthStatArr[i];
						mountGrowthStatValue = growthStat.value ? growthStat.value: growthStat.percent;
						growthStatStr += "  " + StatNameCfgData.getStatName( growthStat.type ) 
							+ LanguageConfig.getText( LangMount.MOUNT_TIP_66, mountGrowthStatValue + "<br/>" );
					}
				}
				
				//总属性值【 总属性 = 出生的基础属性 + 出生的成长属性 * （ 坐骑当前等级 - 1 ） 】
				var allStatValue:int = mountBornStatValue + mountGrowthStatValue * ( data.mountLevel - 1 );
				if( bornStat != null )
					bornStatValueStr += "  " + StatNameCfgData.getStatName( bornStat.type ) + "：" + allStatValue + "<br/>";
				
				//根骨属性
				var curStat:StatData = curStatArr[i];
				if( curStat != null )
				{
					curStatValue = curStat.value ? curStat.value : curStat.percent;
					curDifference = curStatValue / 100;
				}
				else
				{
					curStatValue = 0;
					curDifference = curStatValue / 100;
				}
				
				//转化属性
				if( data.mountGrowthTransStat != null )
				{
					var mountGrowthTransStatArr:Array = data.mountGrowthTransStat.getStatValues();
					if( mountGrowthTransStatArr != null && mountGrowthTransStatArr.length > 0 )
					{
						growthTransStat = mountGrowthTransStatArr[i];
						mountGrowthTransStatValue = growthTransStat.value ? growthTransStat.value: growthTransStat.percent;
						//转化率
						var vitalityRateHash:HashMap = MountManager.getMountVitalityRateHash( data.vitality );
						var rate:Number;
						if( vitalityRateHash != null && vitalityRateHash.length > 0 )
						{
							var mountVitalityRate:Number = vitalityRateHash.getValue( bornStat.type );
							if( mountVitalityRate != 0 )
							{
								rate = mountGrowthTransStatValue / 100 + curDifference;
								growthTransStatStr += "  " + StatNameCfgData.getStatName( growthTransStat.type ) 
									+ LanguageConfig.getText( LangMount.MOUNT_TIP_65, rate.toFixed(2) + "%" + "<br/>" );
							}
							else
							{
								growthTransStatStr += "  " + LanguageConfig.getText( LangMount.MOUNT_TIP_94 );
							}
						}
						else
						{
							rate = mountGrowthTransStatValue / 100 + curDifference;
							growthTransStatStr += "  " + StatNameCfgData.getStatName( growthTransStat.type ) 
								+ LanguageConfig.getText( LangMount.MOUNT_TIP_65, rate.toFixed(2) + "%" + "<br/>" );
						}
					}
				}
			}
			
			var bornStatStr:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_10 );
			bornStatValueStr = LanguageConfig.getText( LangMount.MOUNT_TIPS_11, bornStatValueStr );
			
			var growthTransStr:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_12 );
			growthTransStatStr = LanguageConfig.getText( LangMount.MOUNT_TIPS_13, growthTransStatStr );
			
			var growthStr:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_14 );
			growthStatStr = LanguageConfig.getText( LangMount.MOUNT_TIPS_15, growthStatStr );
			
			//技能
			var spellStr:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_16 );
			var spellArr:Array = data.spellMap.getValues();
			var spellStatStr:String = "";
			for ( i = 0; i < spellArr.length; i++) 
			{
				var cfgId:int = data.spellMap.getValue(i);
				if( cfgId != 0 )
				{
					var spellBookGroupName:String = ItemConfig.getItemNameWithQualityColor(cfgId);
					spellStatStr += "  " + spellBookGroupName + "<br/>";
				}
			}
			
			//tips内容
			tipsStr = liftTime + sex + level + mountStatus + requiredLevel + speciesStr +  mountTypeStr + feedDegree + ziZhiAndGenGu 
				+ bornStatStr + bornStatValueStr 
				+ growthTransStr + growthTransStatStr
				+ growthStr + growthStatStr
				+ spellStr + spellStatStr;
			
			//tips高度
			tipsHeight = _mountBeastCardTip.groupTitle.x 
				+ _mountBeastCardTip.groupTitle.height 
				+ _mountBeastCardTip.labDesc.x 
				+ TextSizeUtil.getTextHeght( _mountBeastCardTip.labDesc.htmlText, _mountBeastCardTip.labDesc.width ) 
				+ 110;
			
			_mountBeastCardTip.labName.htmlText = mountName;
			_mountBeastCardTip.labType.htmlText = LanguageConfig.getText( LangMount.MOUNT_TIP_100 );
			_mountBeastCardTip.labLevel.htmlText = LanguageConfig.getText( LangMount.MOUNT_TIP_101, ItemConfig.getItemRequireLevel( data.cfgId ) );
			_mountBeastCardTip.labDesc.htmlText = tipsStr;
			_mountBeastCardTip.labDesc.wordWrap = true;
			_mountBeastCardTip.imgBG.height = tipsHeight;
		}
		
		public function hideTips():void
		{
			
		}
	}
}