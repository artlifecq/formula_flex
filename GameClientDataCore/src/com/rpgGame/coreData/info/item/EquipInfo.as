package com.rpgGame.coreData.info.item
{
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.netData.player.bean.AttributeItem;

	/**
	 *装备信息 
	 * @author dik
	 * 
	 */
	public class EquipInfo extends ClientItemInfo
	{
	   /** 评价 **/
		public var evaluate:int;
		/** 基础属性Proto **/
		public var base_stat:Vector.<AttributeItem>;
		/** 随机属性Proto **/
		public var random_stat:Vector.<AttributeItem>;
		/** 耐久度 **/
		public var durability:int;
		/** 已经使用的耐久度 **/
		public var used_durability:int;
		/** 强化等级， 0表示没有强化 **/
		public var refined_times:int;
		/** 强化属性Proto，强化等级>0才会提供这个值 **/
		public var refined_stat:Vector.<AttributeItem>;
		/** 打造者的名字，为空表示没有打造着 **/
		public var build_signature:String;
		/** 战斗力 **/
		public var fighting_amount:Number;
		/** 是否能改改造名将套装 **/
		public var can_general_taoz : Boolean;
		/** 名将套装ID **/
		public var general_taoz_id : int;
		/** 名将套装品质 **/
		public var general_quality : int;
		/** 是否装备绑定 **/
		public var isEquipBind : Boolean;
		/** 基础属性 **/
		private var _baseSpriteStat : SpriteStat;
		/** 随机属性 **/
		private var _randomSpriteStat : SpriteStat;
		/** 强化属性 **/
		private var _refinedStat : SpriteStat;
		
		/**
		 * 强化等级
		 */
		public var strengthLevel:int;
		/**
		 * 强化经验(值)
		 */
		public var strengthExp:int;
		/**
		 * 琢磨等级
		 */
		public var polishLevel:int;
		/**
		 * 琢磨等级
		 */
		public var polishExp:int;

		public function EquipInfo(cfgId : int = 0)
		{
			super(cfgId);
		}
		
		override public function updateParameters():void
		{
			if(!itemInfo||!itemInfo.parameters){
				return;
			}
			var json:Object=JSON.parse(itemInfo.parameters);
			strengthLevel=json.StrengthLevel;
			strengthExp=json.StrengthExp;
			polishLevel=json.PolishLevel;
			polishExp=json.PolishExp;
		}
		
		
		/**
		 * 获取基础属性
		 * @return 
		 * 
		 */	
		public function get baseSpriteStat():SpriteStat
		{
			if(!_baseSpriteStat)
			{
				_baseSpriteStat = new SpriteStat();
				_baseSpriteStat.setData(base_stat);
			}
			return _baseSpriteStat;
		}
		
		/**
		 * 获取随机属性
		 * @return 
		 * 
		 */		
		public function get randomSpriteStat():SpriteStat
		{
			if(!_randomSpriteStat)
			{
				_randomSpriteStat = new SpriteStat();
				_randomSpriteStat.setData(random_stat);
			}
			return _randomSpriteStat;
		}
		
		/**
		 * 获取强化属性
		 * @return 
		 * 
		 */	
		public function get refinedStat():SpriteStat
		{
			if(!_refinedStat)
			{
				_refinedStat = new SpriteStat();
				_refinedStat.setData(refined_stat);
			}
			return _refinedStat;
		}
		
		/**
		 * 装备类型 
		 * @return 
		 * 
		 */		
		public function get equipType():int
		{
			return ItemConfig.getItemType(cfgId);
		}
		
		override public function clone():ClientItemInfo
		{
			var equipInfo : EquipInfo = new EquipInfo();
			equipInfo.count = count;
			equipInfo.cfgId = cfgId;
			equipInfo.type = type;
			equipInfo.name = name;
			//			equipInfo.expireTime = expireTime;
			equipInfo.evaluate = evaluate;
			equipInfo.quality = quality;
			equipInfo.base_stat = this.base_stat;
			equipInfo.random_stat = random_stat;
			equipInfo.durability = durability;
			equipInfo.used_durability = used_durability;
			equipInfo.refined_times = refined_times;
			equipInfo.refined_stat = refined_stat;
			equipInfo.build_signature = build_signature;
			equipInfo.fighting_amount = fighting_amount;
			equipInfo.general_taoz_id = general_taoz_id;
			equipInfo.can_general_taoz = can_general_taoz;
			equipInfo.general_quality = general_quality;
			equipInfo.setContainerId( containerID );
			equipInfo.setIndex(index);
			return equipInfo;
		}
	}
}
