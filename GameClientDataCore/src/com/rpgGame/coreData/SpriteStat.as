package com.rpgGame.coreData
{
	import com.rpgGame.coreData.info.stat.StatData;
	
	import app.message.SingleStatProto;
	import app.message.SingleStatsProto;
	import app.message.SpriteStatProto;
	import app.message.StatType;
	import app.message.TotalStatProto;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 *
	 * 属性数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-27 下午8:01:22
	 *
	 */
	public class SpriteStat
	{
		public var statProto:SpriteStatProto;
		
		private var statMap:HashMap;
		
		public function SpriteStat()
		{
			statMap = new HashMap();
		}
		
		/**
		 * 设置数据
		 * @param data
		 * @author L.L.M.Sunny
		 *
		 */
		public function setData(data : SpriteStatProto) : void
		{
			statProto = data;
			if ( data == null )
				return;
			
			var len:int;
			var i:int;
			var statData:StatData;
			statMap.clear();
			if( data.total != null )
			{
				len = data.total.value.length;
				for( i = 0; i< len; i++ )
				{
					statData = new StatData();
					statData.type = i;
					statData.value = data.total.value[i];
					statData.percent = data.total.percent[i];
					if(statData.value < 0)
					{
						trace("setData,statType", i);
					}
					statMap.add( i, statData );
				}
			}
			else if( data.single != null )
			{
				len = data.single.stats.length;
				var single:SingleStatProto;
				for( i = 0; i< len; i++ )
				{
					single = data.single.stats[i];
					statData = new StatData();
					statData.setSingle( single );
					
					statMap.add( statData.type, statData );
				}
			}
		}
		
		//-----------------------------------------
		/**
		 * 得到属性
		 * @return 
		 * 
		 */		
		public function getCloneMap():HashMap
		{
			return statMap.clone();
		}
		//-----------------------------------------
		
		/**
		 * 得到某类型的值
		 * @param type
		 * @return 
		 * 
		 */	
		public function getStatValue( type:int ):int
		{
			if( statMap.getValue( type ) == null )
				return 0;
			
			var statData:StatData = statMap.getValue( type );
			return statData.value;
		}
		/**
		 * 获取所有非0的属性 
		 * @return 
		 * 
		 */		
		public function getStatValues():Array
		{
			var result : Array = [];
			var statData : StatData;
			var statDatas : Array = statMap.getValues();
			for each(statData in statDatas)
			{
				if(!statData || statData.type==-1)
					continue;
				if(statData.value || statData.percent)
					result.push(statData);
			}
			return result;
		}
		
		/**
		 * 得到某类型的值
		 * @param type
		 * @return 
		 * 
		 */	
		public function getStatValueString( type:int ):String
		{
			return getStatValue( type ).toString();
		}
		
		/**
		 * 得到某类型的百分比
		 * @param type
		 * @return 
		 * 
		 */		
		public function getStatPercent( type:int ):int
		{
			if( statMap.getValue( type ) == null )
				return 0;
			
			var statData:StatData = statMap.getValue( type );
			return statData.percent;
		}
		
		/**
		 * 得到某类型的数据
		 * @param type
		 * @return 
		 * 
		 */		
		public function getStatData( type:int ):StatData
		{
			return statMap.getValue( type );
		}
		
		/**
		 * 增加某类型的值
		 * @param type
		 * @param value
		 * 
		 */		
		public function addStatValue( type:int, value:int ):void
		{
			setStatValue(type, getStatValue(type)+value);
		}
		
		/**
		 * 设置某类型的值
		 * @param type
		 * @param value
		 * 
		 */		
		public function setStatValue( type:int, value:int ):void
		{
			var statData:StatData = statMap.getValue( type );
			if( statData == null )
			{
				statData = new StatData();
				statData.type = type;
				statMap.add( type, statData );
			}
			
			statData.value = value;
		}
		
		/**
		 * 设置某类型的百分比
		 * @param type
		 * @param percent
		 * 
		 */		
		public function setStatPercent( type:int, percent:int ):void
		{
			var statData:StatData = statMap.getValue( type );
			if( statData == null )
			{
				statData = new StatData();
				statMap.add( type, statData )
			}
			statData.percent = percent;
		}
		
		/**
		 * 清空属性点并返回总共清空的点数
		 * @param type
		 * @param percent
		 * 
		 */
		public function clearStatValue():int
		{
			clearTotal = getStatValueTotal();
			statMap.clear();
			return clearTotal;
		}
		
		private function _totalClearStatValue(statData:StatData):void
		{
			if( statData != null )
			{
				clearTotal += int(statData.value);
			}
		}
		
		/**
		 * 获取属性点总和
		 * 
		 */
		private var clearTotal:int;
		public function getStatValueTotal():int
		{
			clearTotal = 0;
			statMap.eachValue(_totalClearStatValue);
			return clearTotal;
		}
		
		//------------------------------------以下都是直接取值的方法，取百分比用别的方法
		/**
		 * 攻击速度
		 * @return
		 *
		 */
		public function get attackSpeed() : int
		{
//			return getStatValue( StatType.ATTACK_SPEED );
			return 0;//据后端说无这个属性了，暂时保留 by luguozheng 2015.10.15
		}
		
		public function set attackSpeed(value : int) : void
		{
//			setStatValue( StatType.ATTACK_SPEED, value );
		}
		
		/**
		 * 血量
		 * @return
		 *
		 */
		public function get life() : int
		{
			return getStatValue( StatType.MAX_LIFE );
		}
		
		public function set life(value : int) : void
		{
			setStatValue( StatType.MAX_LIFE, value );
		}
		
		/**
		 * 魔量
		 * @return
		 *
		 */
		public function get mana() : int
		{
			return getStatValue( StatType.MAX_MANA );
		}
		
		public function set mana(value : int) : void
		{
			setStatValue( StatType.MAX_MANA, value );
		}
		
		/**
		 * 移动速度
		 * @return
		 *
		 */
		public function get moveSpeed() : int
		{
			return getStatValue( StatType.MOVE_SPEED );
		}
		
		public function set moveSpeed(value : int) : void
		{
			setStatValue( StatType.MOVE_SPEED, value );
		}
		
	}
}
