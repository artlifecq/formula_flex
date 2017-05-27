package com.rpgGame.coreData.utils
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.JunJieData;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_junjie;
	
	public class JunJieUtil
	{
		public static function getShuXingJiaCheng(lv:int):HashMap
		{
			var has:HashMap=new HashMap();
			var q_junjie:Q_junjie=JunJieData.getModByLv(lv);
			var attValues:Q_att_values= AttValueConfig.getAttInfoById(q_junjie.q_att_id);
			has=AttValueConfig.getTypeValueMap(attValues);
			return has;
		}
		
		/**
		 * 依据条件类型获取条件
		 * */
		public static function getStrByTiaoJianType(type:int):String
		{
			switch(type)
			{
				case 1: return "人物等级达到";
				case 2: return "战斗力达到";
				case 3: return "技能累计升级";
				case 4: return "参与强化总等级";
				case 5: return "坐骑等级";
				case 6: return "经脉等级";
				case 7: return "装备琢磨等级";
				case 8: return "洗炼装备数量";
				case 9: return "心法等级";
				case 10: return "绝学技能总等级";
				case 11: return "绝学技能手动激活";
			}
			return "未知条件";
		}
	}
}