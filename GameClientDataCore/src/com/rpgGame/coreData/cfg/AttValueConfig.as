package com.rpgGame.coreData.cfg
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.EquipWashAttCfg;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	import com.rpgGame.coreData.clientConfig.Q_equip_strength;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash_attr;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import feathers.controls.Label;
	import feathers.controls.text.Fontter;
	
	
	
	/**
	 *属性配置表 
	 * @author dik
	 * 
	 */
	public class AttValueConfig
	{
		private static var _dataDic:Dictionary;
		public function AttValueConfig()
		{
		}
		
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			
			for each(var info : Q_att_values in arr) {
				_dataDic[info.id] = info;
			}
		}
		
		public static function getAttInfoById(id:int):Q_att_values
		{
			return _dataDic[id] ;
		}
		
		/**
		 *根据类型获得值 
		 * @param id
		 * @param type
		 * @return 
		 * 
		 */
		public static function getQattValueByType(id:int,type:int):int
		{
			var att:Q_att_values=getAttInfoById(id);
			if(!att){
				return 0;
			}
			
			for(var i:int=1;i<CharAttributeType.TYPE_NUM;i++){
				if(att["q_type"+i]==type){
					return att["q_value"+i];
				}
			}
			
			return 0;
		}
		
		/**
		 *获取展示值的字符串带单位
		 * @param type
		 * @param value
		 * @return 
		 * 
		 */
		public static function getDisAttValueStr(type:int,value:int):String
		{
			var per:int=CharAttributeType.getAttrPer(type);
			if(per!=1){
				var str:String=(value/per).toFixed(2);
				return Number(str).toString()+CharAttributeType.getAttrUnit(type);
			}
			return value.toString()+CharAttributeType.getAttrUnit(type);
		}
		
		/**
		 *获取要显示的数值，显示必须强制转换
		 * @param type
		 * @param value
		 * @return 
		 * 
		 */
		public static function getDisAttValue(type:int,value:int):Number
		{
			var per:int=CharAttributeType.getAttrPer(type);
			if(per!=1){
				return Math.round(value/per);
			}
			return value;
		}
		
		/**
		 *获取类型值对的表 
		 * @param att
		 * @return 
		 * 
		 */
		public static function getTypeValueMap(att:Q_att_values):HashMap
		{
			var maps:HashMap=new HashMap();
			for(var i:int=1;i<CharAttributeType.TYPE_NUM;i++){
				if(att["q_type"+i]!=0){//值和类型都存在
					maps.put(att["q_type"+i],att["q_value"+i]);	//type为key，value为value			
				}
			}
			return maps;
		}
		public static function getAttrHash(attId:int):HashMap
		{
			var attr:Q_att_values=getAttInfoById(attId);
			if (attr) 
			{
				return getTypeValueMap(attr);
			}
			return null;
		}
		public static function getTypeValue(attId:int,retHash:HashMap):void
		{
			if (retHash==null) 
			{
				throw new Error("retHash is null");
			}
			var attr:Q_att_values=getAttInfoById(attId);
			if (attr) 
			{
				var valueH:HashMap=getTypeValueMap(attr);
				if (valueH) 
				{
					var keys:Array=valueH.keys();
					for each (var type:int in keys) 
					{
						if (retHash.containsKey(type)) 
						{
							retHash.put(type,valueH.getValue(type)+retHash.getValue(type));
						}
						else
						{
							retHash.put(type,valueH.getValue(type));
						}
					}
				}
			}
		}
		
		//获取强化、琢磨后的总属性
		public static function getHashByEquip(info:EquipInfo):HashMap
		{
			var hash:HashMap=new HashMap();
			var currenCfg:Q_equip_polish=EquipPolishCfg.getPolishCfg(info.polishLevel);
			var attValues1:Q_att_values;
			var maps1:HashMap;
			var types:Array;
			var values1:Array;
			attValues1=AttValueConfig.getAttInfoById(info.qItem.q_att_type); //基础属性
			maps1=AttValueConfig.getTypeValueMap(attValues1);
			types=maps1.keys();
			values1=maps1.values();
			
			var stren:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(info.qItem.q_kind,info.qItem.q_job,info.strengthLevel);
			var attValues2:Q_att_values=AttValueConfig.getAttInfoById(stren.q_att_type);//强化属性
			var maps2:HashMap;
			var types2:Array;
			var values2:Array;
			maps2=AttValueConfig.getTypeValueMap(attValues2);
			types2=maps2.keys();
			values2=maps2.values();
			
			//琢磨属性
			var poli:Q_equip_polish=EquipPolishCfg.getPolishCfg(info.polishLevel);
			var jc:Number=1;
			if(poli){
				jc=jc+Number(poli.q_promote/100000);
			}
			
			for(var i:int=0;i<types2.length;i++){
				var type:int=types[i];
				if(currenCfg)
				{
					var num:int=Math.floor((values2[i]+values1[i])*jc);		
				}else{
					num=Math.floor(values2[i]*jc);
				}
				hash.put(type,num);
			}
			return hash;
		}
		
		//获取装备属性总值
		public static function getAllAttByEquip(info:EquipInfo):HashMap
		{
			var has_1:HashMap=getHashByEquip(info);
			var attValues1:Q_att_values;
			var maps1:HashMap;
			var keys:Array;
			var values1:Array;
			if(info.smeltAtt1!=0)
			{
				var q_wash_attr:Q_equip_wash_attr=EquipWashAttCfg.getEquipWashAttr(info.smeltAtt1);
				if(q_wash_attr.q_attr_id!=0)
				{
					attValues1=AttValueConfig.getAttInfoById(q_wash_attr.q_attr_id);
					maps1=AttValueConfig.getTypeValueMap(attValues1);
					keys=maps1.keys();
					values1=maps1.values();
					for(var i:int=0;i<values1.length;i++)
					{
						if(has_1.getValue(keys[i])){
							var view:int=has_1.getValue(keys[i]);
							view=has_1.getValue(keys[i])+values1[i];
						}
						else{
							has_1.put(keys[i],values1[i]);
						}
					}
				}
			}
			if(info.smeltAtt2!=0)
			{
				q_wash_attr=EquipWashAttCfg.getEquipWashAttr(info.smeltAtt2);
				if(q_wash_attr.q_attr_id!=0)
				{
					attValues1=AttValueConfig.getAttInfoById(q_wash_attr.q_attr_id);
					maps1=AttValueConfig.getTypeValueMap(attValues1);
					keys=maps1.keys();
					values1=maps1.values();
					for(i=0;i<values1.length;i++)
					{
						if(has_1.getValue(keys[i])){
							view=has_1.getValue(keys[i]);
							view=has_1.getValue(keys[i])+values1[i];
						}
						else{
							has_1.put(keys[i],values1[i]);
						}
					}
				}
			}		
			return has_1;
		}
	}
}
