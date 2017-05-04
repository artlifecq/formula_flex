package com.rpgGame.coreData.info.cheats
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.cheats.CheatsNodeCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_cheats_node;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.cheats.bean.NodeInfo;

	public class CheatsNodeVo
	{
		public static const NODE_NORMAL:int=0;
		public static const NODE_STONE:int=1;
		private  var _serverData:NodeInfo;
		private var _config:Q_cheats_node;
		private var _needLevelArr:Array;
		private var _needSpritArr:Array;
		private var _needPreLvArr:Array;
		private var _attrLevelArr:Array;
		
		private var _cheatsId:int;
		private var _chetasNodeId:int;
		private var _curLevel:int;
		public function CheatsNodeVo(data:Q_cheats_node)
		{
			this._config=data;
			var arr:Array=data.q_node_id.split("_");
			_cheatsId=int(arr[0]);
			_chetasNodeId=int(arr[1]);
			_needLevelArr=jsonParase(data.q_need_level) ;
			_needSpritArr=jsonParase(data.q_need_spirit) ;
			_needPreLvArr=jsonParase(data.q_prelvl);
			_attrLevelArr=jsonParase(data.q_attribute);
			
		}
		private static function jsonParase(str:String):Array
		{
			if(str!=null&&str!="")
			{
				return JSON.parse(str) as Array;
			}
			return null;
		}
		public function getNodeType():int
		{
			return _config.q_type;
		}
		public function getConfig():Q_cheats_node
		{
			return _config;
		}
		public function setData(data:NodeInfo):void
		{
			this._serverData=data;
			_curLevel=data.level;
		}
		public function getAttrHash(ret:HashMap):void
		{
			if (_serverData==null) 
			{
				return;
			}
			//真气节点
			if (_config.q_type==0) 
			{
				if (_config.q_attribute!=null&&_config.q_attribute!="") 
				{
					var attrId:int=getSafeIndexData(_attrLevelArr,_curLevel-1);
					if (attrId!=0) 
					{
						AttValueConfig.getTypeValue(attrId,ret);
					}
				}
			}
			else
			{
				if (_serverData.stone.length>0) 
				{
					var qitem:Q_item=ItemConfig.getQItemByID(_serverData.stone[0].itemModelId);
					if (qitem&&qitem.q_att_type!=0) 
					{
						AttValueConfig.getTypeValue(qitem.q_att_type,ret);
					}
				}
			}
		}
		public function get serverData():NodeInfo
		{
			return _serverData;
		}
		public function get isActive():Boolean
		{
			return _serverData!=null&&(_serverData.level>0||_serverData.stone.length>0);
		}
		
		public function get levelUpNeedPlayerLevel():int
		{
			return getSafeIndexData(_needLevelArr,_curLevel);
		}
		public function getUnLockNeedPlayerLevel():int
		{
			return getSafeIndexData(_needLevelArr,0);
		}
		public function getUnLockNeedNodePreLv():int
		{
			return getSafeIndexData(_needPreLvArr,0);
		}
		public function get levelUpNeedSpirit():int
		{
			return getSafeIndexData(_needSpritArr,_curLevel);
		}
		public function get levelUpNeedPreLv():int
		{
			return getSafeIndexData(_needPreLvArr,_curLevel);
		}
		public static function getMaxLevelAttrId(vo:CheatsNodeVo):int
		{
			return getSafeIndexData(vo._attrLevelArr,vo._config.q_maxlevel-1);
		}
		public function getAttrIdAtLevel(lv:int):int
		{
			return getSafeIndexData(_attrLevelArr,lv-1);
		}
		private static function getSafeIndexData(arr:Array,index:int):*
		{
			if (arr&&arr.length>index&&index>-1) 
			{
				return arr[index];
			}
			return 0;
		}
		public function getPreNodeConfig():Q_cheats_node
		{
			if (_config.q_need_node_id!=null&&_config.q_need_node_id!="") 
			{
				return CheatsNodeCfg.getCheatsNode(_config.q_need_node_id);
			}
			return null;
		}

		public function get cheatsId():int
		{
			return _cheatsId;
		}

		public function get chetasNodeId():int
		{
			return _chetasNodeId;
		}

		public function get curLevel():int
		{
			return _curLevel;
		}
		public function getStone():ItemInfo
		{
			if (_serverData&&_serverData.stone.length>0) 
			{
				return _serverData.stone[0];
			}
			return null;
		}

	}
}