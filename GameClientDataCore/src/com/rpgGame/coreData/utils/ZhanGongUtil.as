package com.rpgGame.coreData.utils
{
	import com.rpgGame.coreData.clientConfig.Q_meritorious;
	import com.rpgGame.coreData.enum.JobEnum;
	
	public class ZhanGongUtil
	{
		/**
		 * 依据id获取相应的模型数据
		 * */
		public static function getMonsterMaskById(monsterId:int):Vector.<Number>
		{
			var list:Vector.<Number>=new Vector.<Number>();
			var po_x:Number=0;
			var po_y:Number=0;
			var scale:Number=0;
			switch(monsterId)
			{
				case 20002:
					po_x=126;
					po_y=-275;
					scale=0.95;
					break;
				case 20003:
					po_x=124;
					po_y=-232;
					scale=0.92;
					break;
				case 20004:
					po_x=126;
					po_y=-272;
					scale=1.1;
					break;
				case 20005:
					po_x=126;
					po_y=-198;
					scale=0.7;
					break;
			}
			list.push(po_x);
			list.push(-po_y);
			list.push(scale);
			return list;	
		}
		
		/**
		 * 依据职业获取属性
		 * */
		public static function getAttByJob(q_meritorious:Q_meritorious,job:int):int
		{
			switch(job)
			{
				case JobEnum.ROLE_1_TYPE: return q_meritorious.q_att_type;
				case JobEnum.ROLE_2_TYPE:
				case JobEnum.ROLE_3_TYPE: return q_meritorious.q_att_type2;
				case JobEnum.ROLE_4_TYPE: return q_meritorious.q_att_type1;
			}
			return 0;
		}
	}
}