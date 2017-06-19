package com.rpgGame.coreData
{
	import com.rpgGame.coreData.info.stat.StatData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.player.bean.AttributeItem;
	import com.rpgGame.netData.player.bean.ResourceDataItem;
	
	import org.client.mainCore.ds.HashMap;
	import org.game.netCore.data.long;
	
	/**
	 * 存储角色相关的所有属性 
	 * @author NEIL
	 * 
	 */	
	public class SpriteStat
	{
		
		
		private var statMap:HashMap;//角色属性
		private var maxMap:HashMap;//最大属性
		private var resMap:HashMap;//资源属性
		
		public function SpriteStat()
		{
			statMap = new HashMap();
			maxMap=new HashMap();
			resMap=new HashMap();
		}
		
		/**
		 * 资源数据集
		 * @param type
		 * @param value
		 * 
		 */
		public function setResDatas(arr:Vector.<ResourceDataItem> ):void
		{
			var statData:StatData;
			resMap.clear();
			if ( arr != null)
			{
				for ( var j:int = 0; j < arr.length; j++ )
				{
					statData = new StatData();
					statData.type = arr[j].type;
					statData.value = arr[j].value;
					resMap.add( statData.type, statData );
				}
			}
		}
		
		/**
		 * 资源数据
		 * @param type
		 * @param value
		 * 
		 */
		public function setResData(type:int, value:int):void
		{
			var statData:StatData = resMap.getValue( type );
			if ( statData == null )
			{
				statData = new StatData();
				statData.type = type;
				resMap.add( type, statData );
			}
			
			statData.value = value;
		}
		
		/**
		 *获取资源属性数据 
		 * @param type
		 * @return 
		 * 
		 */
		public function getResData(type:int):Number
		{
			if ( resMap.getValue( type ) == null )
				return 0;
			
			var statData:StatData = resMap.getValue( type );
			return statData.value;
		}
		
		/**
		 *最大值数据 
		 * @param type
		 * @param value
		 * 
		 */
		public function setMaxData(type:int, value:long):void
		{
			var statData:StatData = maxMap.getValue( type );
			if ( statData == null )
			{
				statData = new StatData();
				statData.type = type;
				maxMap.add( type, statData );
			}
			
			statData.value = value.fValue;
		}
		
		/**
		 *获取最大值 
		 * @param type
		 * @return 
		 * 
		 */
		public function getMaxValue( type:int ):Number
		{
			if ( maxMap.getValue( type ) == null )
				return 0;
			
			var statData:StatData = maxMap.getValue( type );
			return statData.value;
		}
		
		/**
		 * 设置数据
		 * @param data
		 * @author L.L.M.Sunny
		 *
		 */
		public function setData( arr:Vector.<AttributeItem> ):void
		{
			
			if ( arr == null )
				return;
			
			var statData:StatData;
//			statMap.clear();
			
			if ( arr != null)
			{
				for ( var j:int = 0; j < arr.length; j++ )
				{
					setStatValue(arr[j].type,arr[j].value);
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
		public function getStatValue( type:int ):Number
		{
			if ( statMap.getValue( type ) == null )
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
			var result:Array = [];
			var statData:StatData;
			var statDatas:Array = statMap.getValues();
			for each ( statData in statDatas )
			{
				if ( !statData || statData.type == -1 )
					continue;
				if ( statData.value || statData.percent )
					result.push( statData );
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
			var per:int=CharAttributeType.getAttrPer(type);
			if(per!=1){
				var str:String=(getStatValue( type )/per).toFixed(2);
				return Number(str).toString()+CharAttributeType.getAttrUnit(type);
			}
			return getStatValue( type ).toString()+CharAttributeType.getAttrUnit(type);
		}
		
		/**
		 * 得到某类型的百分比
		 * @param type
		 * @return
		 *
		 */
		public function getStatPercent( type:int ):int
		{
			if ( statMap.getValue( type ) == null )
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
			setStatValue( type, getStatValue( type ) + value );
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
			if ( statData == null )
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
			if ( statData == null )
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
		
		private function _totalClearStatValue( statData:StatData ):void
		{
			if ( statData != null )
			{
				clearTotal += int( statData.value );
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
			statMap.eachValue( _totalClearStatValue );
			return clearTotal;
		}
		
		//------------------------------------以下都是直接取值的方法，取百分比用别的方法
		/**
		 * 攻击速度
		 * @return
		 *
		 */
		public function get attackSpeed():int
		{
			//			return getStatValue( StatType.ATTACK_SPEED );
			return 0; //据后端说无这个属性了，暂时保留 by luguozheng 2015.10.15
		}
		
		public function set attackSpeed( value:int ):void
		{
			//			setStatValue( StatType.ATTACK_SPEED, value );
		}
		
		/**
		 * 血量
		 * @return
		 *
		 */
		public function get life():int
		{
			return getStatValue( CharAttributeType.MAX_HP );
		}
		
		public function set life( value:int ):void
		{
			setStatValue( CharAttributeType.MAX_HP, value );
		}
		
		/**
		 * 魔量
		 * @return
		 *
		 */
		public function get mana():int
		{
			return getStatValue( CharAttributeType.MAX_MP );
		}
		
		public function set mana( value:int ):void
		{
			setStatValue( CharAttributeType.MAX_MP, value );
		}
		
		/**
		 * 马上移动速度
		 * @return
		 *
		 */
		public function get upMoveSpeed() : int
		{
			return getStatValue( CharAttributeType.SPEED );
		}
		
		/**
		 * 移动速度
		 * @return
		 *
		 */
		public function get moveSpeed():int
		{
			return getStatValue( CharAttributeType.SPEED );
		}
		
		public function set moveSpeed( value:int ):void
		{
			setStatValue( CharAttributeType.SPEED, value );
		}
		
		public function get hp():int
		{
			return getStatValue( CharAttributeType.HP );
		}
		
		public function set hp( value:int ):void
		{
			setStatValue( CharAttributeType.HP, value );
		}
		
		public function get mp():int
		{
			return getStatValue( CharAttributeType.MP );
		}
		
		public function set mp( value:int ):void
		{
			setStatValue( CharAttributeType.MP, value );
		}
		
		public function get level():int
		{
			return getStatValue( CharAttributeType.LV );
		}
		
		public function set level( value:int ):void
		{
			setStatValue( CharAttributeType.LV, value );
		}
	}
}
