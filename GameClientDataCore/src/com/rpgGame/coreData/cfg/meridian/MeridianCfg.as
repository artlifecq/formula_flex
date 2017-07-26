package com.rpgGame.coreData.cfg.meridian
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class MeridianCfg
	{
		public function MeridianCfg()
		{
		}
		private static var _maxHash:HashMap;
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info : Q_meridian in _dataArr) {
				_dataDic[info.q_meridian_id] = info;
			}
		}
		public static function getMeridianCfg(id:String):Q_meridian
		{
			return _dataDic[id];
		}
		public static function getInitCfg():HashMap
		{
			var hash:HashMap=new HashMap();
			var tmpArr:Array;
			var merid:int=0;
			var level:int;
			var splitArr:Array;
			for each (var info : Q_meridian in _dataArr) 
			{
				splitArr=info.q_meridian_id.split("_");
				level=int(splitArr[2]);
				if (level==0)//找等级为1的
				{
					merid=int(splitArr[0]);
					tmpArr=hash.getValue(merid);
					if (!tmpArr) 
					{
						tmpArr=[info];
						hash.put(merid,tmpArr);
					}
					else
					{
						tmpArr.push(info);
					}
				}
			}
			
			return hash;
		}

		public static function get dataArr():Array
		{
			return _dataArr;
		}
		public static function getMaxLevel(merdianId:int,posId:int):int
		{
			if (!_maxHash) 
			{
				_maxHash=new HashMap();
				var len:int=_dataArr.length;
				var tmp:Q_meridian;
				var key:String;
				var lv:int=0;
				var tmpArr:Array;
				var oldLv:int;
				for (var i:int = 0; i < len; i++) 
				{
					tmp=_dataArr[i];
					tmpArr=tmp.q_meridian_id.split("_");
					key=tmpArr[0]+"_"+tmpArr[1];
					lv=tmpArr[2];
					oldLv=_maxHash.getValue(key);
					if (lv>oldLv) 
					{
						_maxHash.put(key,lv);
					}
				}
			}
			return _maxHash.getValue(merdianId+"_"+posId);
		}
	}
}