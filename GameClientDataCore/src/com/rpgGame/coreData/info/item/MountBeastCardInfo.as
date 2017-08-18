package com.rpgGame.coreData.info.item
{
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.netData.player.bean.AttributeItem;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 坐骑兽牌信息 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountBeastCardInfo extends ClientItemInfo
	{
		/** 基础属性，显示的时候，所有属性都要除以100，如303点力量，则显示为3.03 **/
		public var bornStat:Vector.<AttributeItem>;
		/** 成长属性，显示的时候，所有属性都要除以100，如303点力量，则显示为3.03 **/
		public var growthStat:Vector.<AttributeItem>;
		/** 转化率属性Proto **/
		public var growthTransStat:Vector.<AttributeItem>;
		/** 基础属性 **/
		private var _mountBornStat:SpriteStat;
		/** 成长属性 **/
		private var _mountGrowthStat:SpriteStat;
		/** 转化属性 **/
		private var _mountGrowthTransStat:SpriteStat;
		/** 技能属性Proto **/
		public var spells:Object;
		
		/** 经验 **/
		public var exp:Number;
		/** 坐骑id **/
		public var id:int;
		/** 饥饿度 **/
		public var hungerDegree:int;
		/** 是否已经繁育了，只有宝宝该字段才有意义 **/
		public var isBreed:Boolean;
		/** 等级 **/
		public var mountLevel:int;
		/** 寿命 **/
		public var lifeTime:int;
		/** 性别（1：雄、2：雌） **/
		public var sex:int;
		/** 是否未鉴定 **/
		public var unidentified:Boolean;
		/** 根骨 **/
		public var vitality:int;
		/** 根骨经验(当前经验) **/
		public var vitalityExp:Number;
		/** 坐骑技能数据 **/
		public var spellMap:HashMap = new HashMap();
		
		public function MountBeastCardInfo()
		{
			_mountBornStat = new SpriteStat();
			_mountGrowthStat = new SpriteStat();
			_mountGrowthTransStat = new SpriteStat();
		}
		
		/**
		 * 设置坐骑兽牌数据 
		 * @param data
		 * 
		 */		
//		public function setMountBreastCardInfo( data:MountProto ):void
//		{
//			//基础属性
////			bornStat = data.bornStat;
//			_mountBornStat.setData( bornStat );
//			//成长属性
////			growthStat = data.growthStat;
//			_mountGrowthStat.setData( growthStat );
//			//转化率属性
////			growthTransStat = data.growthTransStat;
//			_mountGrowthTransStat.setData( growthTransStat );			
//
//			spells = data.mountSpells;
//			id = data.id;
//			exp = data.exp.toNumber();
//			hungerDegree = data.hungerDegree;
//			isBreed = data.isBreed;
//			mountLevel = data.level;
//			lifeTime = data.lifeTime;
//			sex = data.sex;
//			unidentified = data.unidentified;
//			vitality = data.vitality;
//			if( data.vitalityExp != null )
//			{
//				vitalityExp = data.vitalityExp.toNumber();
//			}
//			
//			//设置坐骑的技能数据
//			for (var i:int = 0; i < spells.spellBookId.length; i++) 
//			{
//				spellMap.add( i, spells.spellBookId[i] );
//			}
//		}
		
		/**
		 * 获取所有的坐骑技能数据 
		 * @return 
		 * 
		 */		
		public function getMountSkillData():Array
		{
			return spellMap.getValues();
		}
		
		/**
		 * 通过当前坐骑的技能槽索引，获取对应的技能数据 
		 * @param index
		 * @return 
		 * 
		 */		
		public function getMountSkillDataByIndex( index:int ):int
		{
			return spellMap.getValue( index );
		}
		
		/** 基础属性Proto **/
		public function get mountBornStat():SpriteStat
		{
			return _mountBornStat;
		}
		
		/** 成长属性 **/
		public function get mountGrowthStat():SpriteStat
		{
			return _mountGrowthStat;
		}
		
		/** 转化率属性 **/
		public function get mountGrowthTransStat():SpriteStat
		{
			return _mountGrowthTransStat;
		}
		
		override public function clone():ClientItemInfo
		{
			var mountBreastCardInfo:MountBeastCardInfo = new MountBeastCardInfo();
			mountBreastCardInfo.count = count;
			mountBreastCardInfo.cfgId = cfgId;
			mountBreastCardInfo.type = type;
			mountBreastCardInfo.name = name;
//			mountBreastCardInfo.expireTime = expireTime;
			mountBreastCardInfo.bornStat = bornStat;
			mountBreastCardInfo.mountBornStat.setData( bornStat );
			//成长属性
			mountBreastCardInfo.growthStat = growthStat;
			mountBreastCardInfo.mountGrowthStat.setData( growthStat );
			//转化率属性
			mountBreastCardInfo.growthTransStat = growthTransStat;
			mountBreastCardInfo.mountGrowthTransStat.setData( growthTransStat );			
			
			mountBreastCardInfo.spells = spells;
			mountBreastCardInfo.id = id;
			mountBreastCardInfo.exp =exp;
			mountBreastCardInfo.hungerDegree = hungerDegree;
			mountBreastCardInfo.isBreed = isBreed;
			mountBreastCardInfo.mountLevel = mountLevel;
			mountBreastCardInfo.lifeTime = lifeTime;
			mountBreastCardInfo.sex = sex;
			mountBreastCardInfo.unidentified = unidentified;
			mountBreastCardInfo.vitality = vitality;
			mountBreastCardInfo.vitalityExp = vitalityExp;
			mountBreastCardInfo.setContainerId( containerID );
			mountBreastCardInfo..setIndex(index);
			
			//设置坐骑的技能数据
			mountBreastCardInfo.spellMap = spellMap;
			return mountBreastCardInfo;
		}
	}
}