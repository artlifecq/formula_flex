package com.rpgGame.coreData.info.mount
{
	import com.rpgGame.coreData.SpriteStat;
	
	import app.message.EquipmentListProto;
	import app.message.MountProto;
	import app.message.MountSpellsProto;
	import app.message.SpriteStatProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 坐骑infoData
	 * @author 陈鹉光
	 * 
	 */	
	public class MountInfoData
	{
		/** 基础属性，显示的时候，所有属性都要除以100，如303点力量，则显示为3.03 **/
		public var bornStat:SpriteStatProto;
		/** 成长属性，显示的时候，所有属性都要除以100，如303点力量，则显示为3.03 **/
		public var growthStat:SpriteStatProto;
		/** 转化率属性Proto **/
		public var growthTransStat:SpriteStatProto;
		/** 基础属性 **/
		private var _mountBornStat:SpriteStat;
		/** 成长属性 **/
		private var _mountGrowthStat:SpriteStat;
		/** 转化率属性 **/
		private var _mountGrowthTransStat:SpriteStat;
		/** 技能属性Proto **/
		public var spells:MountSpellsProto;
		
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
		/** 槽位 **/
		public var idx:int;
		/** 坐骑状态，是否在训练/战斗中 **/
		public var mountStatus:int;
		/** 是否在马上，只有在战斗中，该字段才有意义 **/
		public var isRiding:Boolean;
		/** 坐骑装备信息 **/
		public var mountEquipInfo:MountEquipInfo;
		/** 是否处于携带状态 **/
		public var isCarry:Boolean;
		/** 坐骑技能数据 **/
		public var spellMap:HashMap = new HashMap();
		/** 坐骑技能技能槽 **/
		public var spellIndex:int;
		
		public function MountInfoData()
		{
			mountEquipInfo = new MountEquipInfo();
			_mountBornStat = new SpriteStat();
			_mountGrowthStat = new SpriteStat();
			_mountGrowthTransStat = new SpriteStat();
		}
		
		/**
		 * 坐骑数据 
		 * @param data
		 * 
		 */		
		public function setInfoData( data:MountProto ):void
		{
			id = data.id;
			unidentified = data.unidentified;
			if( unidentified )
				return;
				
			//基础属性
			bornStat = data.bornStat;
			_mountBornStat.setData( bornStat );
			//成长属性
			growthStat = data.growthStat;
			_mountGrowthStat.setData( growthStat );
			//转化率属性
			growthTransStat = data.growthTransStat;
			_mountGrowthTransStat.setData( growthTransStat );
			
			spells = data.mountSpells;
			exp = data.exp.toNumber();
			hungerDegree = data.hungerDegree;
			isBreed = data.isBreed;
			mountLevel = data.level;
			lifeTime = data.lifeTime;
			sex = data.sex;
			vitality = data.vitality;
			if( data.vitalityExp != null )
			{
				vitalityExp = data.vitalityExp.toNumber();
			}
			isCarry = true;
			
			//设置坐骑的技能数据
			for (var i:int = 0; i < spells.spellBookId.length; i++) 
			{
				spellMap.add( i, spells.spellBookId[i] );
			}
		}
		
		/**
		 * 坐骑装备数据 
		 * @param data
		 * 
		 */		
		public function setMountEquipData( data:EquipmentListProto ):void
		{
			mountEquipInfo.setMountEquipsProto( data );
		}
		
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
	}
}