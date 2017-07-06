package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_mibao_monster;
	import com.rpgGame.coreData.clientConfig.Q_mibao_reward;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 秦陵秘宝 数据   43_1秦陵秘宝奖励表 43_2秦陵秘宝怪物 
	 * @author YT
	 * 
	 */	
	public class MibaoCfgData
	{
		private static var _monsterdataDic : Dictionary = new Dictionary();
		private static var _rewarddataDic : Dictionary = new Dictionary();
		private static var _waveIdDic :Dictionary=new Dictionary();
		public static function setup(data : ByteArray,data2 : ByteArray) : void {
			var arr : Array = data.readObject();
			for each(var info :Q_mibao_monster in arr) {
				_monsterdataDic[info.q_id] = info;
			}
			
			arr = data2.readObject();
			for each(var info2 :Q_mibao_reward in arr) {
				_rewarddataDic[info2.q_id] = info2;
			}
			
			setWaveIdList();
		}
		
		/** 设置波数id列表*/
		private static function setWaveIdList():void
		{
			var i:int,id:int;
			for each(var info :Q_mibao_monster in _monsterdataDic) {
				var idArr:Array=_waveIdDic[info.q_zoneId];
				if(!idArr)
				{
					idArr=new Array();
					_waveIdDic[info.q_zoneId]=idArr;
				}
				
				if(!haveWaveIdList(info.q_zoneId,info.q_step))
				{
					idArr.push(info.q_step);
				}
				/*idArr.sort(function(a:int,b:int):int{
					return a>b?1:-1;
				});*/
			}
			
			var bossInfo:Vector.<Q_mibao_monster>=getMonsterListByType(2);
			if(bossInfo&&bossInfo.length>0)
			{
				for each(var idArray :Array in _waveIdDic) {
					idArray.push(bossInfo[0].q_step);
				}
			}
			for each(var allidArray :Array in _waveIdDic) {
				allidArray.sort(function(a:int,b:int):int{
					return a>b?1:-1;
				});
			}
			
		}
		
		private static function haveWaveIdList(zoneId:int,id:int):Boolean
		{
			var idArr:Array=_waveIdDic[zoneId];
			var i:int;
			if(idArr)
			{
				for(i=0;i<idArr.length;i++)
				{
					if(idArr[i]==id)
					{
						return true;
					}
				}
			}
			return false;
		}
		/** 返回 怪物数据*/
		public static function getMonster(id:int):Q_mibao_monster
		{
			return _monsterdataDic[id];
		}
		public static function getWaveIdList(zoneId:int):Array
		{
			return _waveIdDic[zoneId];
		}
		/** 返回 怪物数据列表 by 波数*/
		public static function getMonsterListByWaveId(zoneId:int,step:int):Vector.<Q_mibao_monster>
		{
			var mlist:Vector.<Q_mibao_monster>=new Vector.<Q_mibao_monster>();
			
			for each(var info :Q_mibao_monster in _monsterdataDic) {
				if(info.q_zoneId==zoneId&&info.q_step==step)
				{
					mlist.push(info);
				}
			}
			return mlist;
		}
		/** 返回 怪物数据列表 by 怪物类型  1是小怪，2是最后一个boss*/
		public static function getMonsterListByType(type:int):Vector.<Q_mibao_monster>
		{
			var mlist:Vector.<Q_mibao_monster>=new Vector.<Q_mibao_monster>();
			
			for each(var info :Q_mibao_monster in _monsterdataDic) {
				if(info.q_type==type)
				{
					mlist.push(info);
				}
			}
			return mlist;
		}
		
		/** 返回 奖励数据 by 根据积分*/
		public static function getRewardDataByjf(jf:int):Q_mibao_reward
		{
			for each(var info :Q_mibao_reward in _rewarddataDic) {
				if(info.q_type==1&&jf>=info.q_jifen_start&&jf<=info.q_jifen_end)
				{
					return info;
				}
			}
			return null;
		}
		/** 返回 奖励数据 by 根据伤害百分比*/
		public static function getRewardDataBydamage(damage:int):Q_mibao_reward
		{
			for each(var info :Q_mibao_reward in _rewarddataDic) {
				if(info.q_type==2&&damage>=info.q_jifen_start&&damage<=info.q_jifen_end)
				{
					return info;
				}
			}
			return null;
		}
		
		
		
		public function MibaoCfgData()
		{
		}
	}
}