package com.rpgGame.coreData.info.cheats
{
	import com.gameClient.utils.HashMap;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.cheats.CheatsNodeCfg;
	import com.rpgGame.coreData.clientConfig.Q_cheats;
	import com.rpgGame.coreData.clientConfig.Q_cheats_node;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.cheats.bean.CheatsInfo;
	import com.rpgGame.netData.cheats.bean.NodeInfo;

	/**
	 *客户端心法数据 
	 * @author Administrator
	 * 
	 */	
	public class CheatsVo
	{
		public static var FIGHT_POWER_CALL:Function;
		private var _fightPower:int=0;
		private var _cheatsConfig:Q_cheats;
		
		private var _subNodeHash:HashMap=new HashMap();
		/**不算相生的属性*/
		private var _attrHash:HashMap=new HashMap();
		/**激活属性*/
		private var _extendAttr:HashMap=new HashMap();
		//基本属性每集基本属性
		//private var _baseAttrHash:HashMap=new HashMap(); 
		//总属性
		private var _totalValue:HashMap=new HashMap();
		private var _careCheats:HashMap=new HashMap();
		private var _needItemHash:HashMap=new HashMap();
		private var _level:int=0;
		private var _dataGetFunc:Function;
		private var _buffArr:Array;
		public var isLevelUp:Boolean;
		public function CheatsVo(config:Q_cheats,dataFunc:Function)
		{
			this._cheatsConfig=config;
			this._dataGetFunc=dataFunc;
			var num:int=config.q_pointnum;
			var vo:CheatsNodeVo;
			var tmp:Q_cheats_node;
			for (var i:int = 1; i <= num; i++) 
			{
				tmp=CheatsNodeCfg.getCheatsNode(config.q_id+"_"+i);
				vo=new CheatsNodeVo(tmp);
				_subNodeHash.put(i,vo);
			}
		
			if (_cheatsConfig.q_each_other!=null&&_cheatsConfig.q_each_other!="") 
			{
				var arr:Array=JSONUtil.decode(_cheatsConfig.q_each_other) as Array;
				if (arr) 
				{
					var tmpA:Array;
					num=arr.length;
					for (var j:int = 0; j < num; j++) 
					{
						tmpA=arr[j];
						_careCheats.put(tmpA[0],tmpA);
					}
				}
			}
			if (_cheatsConfig.q_needitem!=null&&_cheatsConfig.q_needitem!="") 
			{
				var arrItem:Array=ItemUtil.jsonParse2ObjList(_cheatsConfig.q_needitem);
				if (arrItem&&arrItem.length>0)
				{
					var len:int=arrItem.length;
					for (var i2:int = 0; i2 < len; i2++)
					{
						_needItemHash.put(arrItem[i2].mod,arrItem[i2].num);
					}
				}
			}
			//激活
			if (cheatsConfig.q_attrId!=0) 
			{
				AttValueConfig.getTypeValue(cheatsConfig.q_attrId,_extendAttr);
			}
			_buffArr=JSONUtil.decode(config.q_skill) as Array;
		}
		public function getCurBuff():Array
		{
			if (_buffArr) 
			{
				return _buffArr[Math.max(0,_level-1)];
			}
			return null;
		}
		public function updateServerData(data:CheatsInfo,needUpdateAttr:Boolean=true):void
		{
			
			if (data) 
			{
				isLevelUp=data.level>_level;
				_level=data.level;
			}
			if (data&&data.nodelist.length) 
			{
				var tmp:CheatsNodeVo;
				for each (var node:NodeInfo in data.nodelist) 
				{
					tmp=_subNodeHash.getValue(node.nodeId);
					if (tmp) 
					{
						tmp.setData(node);
					}
				}
			}
			if (needUpdateAttr) 
			{
				updateAttr();
			}
			
		}
		public function updateSubNode(node:NodeInfo):void
		{
			var tmp:CheatsNodeVo=_subNodeHash.getValue(node.nodeId);
			if (tmp) 
			{
				tmp.setData(node);
			}
			updateAttr();
		}
		public function updateAttr():void
		{
			_attrHash.clear();
			_fightPower=0;
			//_extendAttr.clear();
			if (isActive()) 
			{
				
				HashMap.mergeValueHashMap(_attrHash,_extendAttr);
				//原始属性
				var attrArr:Array=JSON.parse(cheatsConfig.q_levelattr) as Array;
				if (attrArr!=null&&attrArr.length>=_level) 
				{
					AttValueConfig.getTypeValue(int(attrArr[_level-1]),_attrHash);
				}
				//基本属性=原始属性+子穴位最大等级属性，为了策划好配置，一分为2的
				//HashMap.mergeValueHashMap(_attrHash,_baseAttrHash.getValue(_level-1));
				//计算子节点属性
				var keys:Array=_subNodeHash.keys();
				var subLen:int=keys.length;
				var node:CheatsNodeVo;
				for (var i:int = 0; i < subLen; i++) 
				{
					node=_subNodeHash.getValue(keys[i]);
					if (node&&node.isActive) 
					{
						node.getAttrHash(_attrHash);
					}
				}
				
				updateEffectAttr();
			}
		}
		/**
		 *计算相生加成 
		 * 
		 */		
		private function updateEffectAttr():void
		{
			_totalValue.clear();
			HashMap.mergeValueHashMap(_totalValue,_attrHash);
			var keys:Array=_careCheats.keys();
			var len:int=keys.length;
			var tmp:CheatsVo;
			var careArr:Array;
			for (var i:int = 0; i < len; i++) 
			{
				tmp=_dataGetFunc(keys[i]);
				if (tmp) 
				{
					careArr=_careCheats.getValue(keys[i]);
					if (careArr) 
					{
						if (tmp.level>=int(careArr[1]))
						{
							var val:int=_totalValue.getValue(int(careArr[2]));
							//val=val*(1+int(careArr[3])/10000);
							val+=int(careArr[3]);//改成加固定值了
							_totalValue.put(int(careArr[2]),val);
						}
					}
				}
			}
			if (FIGHT_POWER_CALL) 
			{
				_fightPower=FIGHT_POWER_CALL(_totalValue);
			}
		}
		public function checkEffectCheatUpdate(cheatId:int):void
		{
			if (_careCheats.containsKey(cheatId)) 
			{
				updateEffectAttr();
			}
		}
		public function isActive():Boolean
		{
			return _level>0
		}

		public function get level():int
		{
			return _level;
		}

		/**心法图id**/
		public function get cheatsConfig():Q_cheats
		{
			return _cheatsConfig;
		}
		/**
		 *激活属性 
		 * @return 
		 * 
		 */
		public function get extendAttr():HashMap
		{
			return _extendAttr;
		}
		public function getSubNode(id:int):CheatsNodeVo
		{
			return _subNodeHash.getValue(id);
		}

		public function get subNodeHash():HashMap
		{
			return _subNodeHash;
		}

//		public function get attrHash():HashMap
//		{
//			return _attrHash;
//		}

		public function get careCheats():HashMap
		{
			return _careCheats;
		}

		public function get needItemHash():HashMap
		{
			return _needItemHash;
		}

		public function get totalValue():HashMap
		{
			return _totalValue;
		}
		public function getBaseAttr():HashMap
		{
			var ret:HashMap=new HashMap();
			//原始属性
			var attrArr:Array=JSON.parse(cheatsConfig.q_levelattr) as Array;
			if (attrArr!=null&&attrArr.length>=0) 
			{
				AttValueConfig.getTypeValue(int(attrArr[0]),ret);
			}
			return ret;
		}

		public function get fightPower():int
		{
			return _fightPower;
		}


	}
}