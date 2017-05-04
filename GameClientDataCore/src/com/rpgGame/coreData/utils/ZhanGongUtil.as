package com.rpgGame.coreData.utils
{
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
	}
}