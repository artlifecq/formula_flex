package com.rpgGame.coreData.cfg
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.clientConfig.Q_sevenday;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 七日豪礼数据管理
	 * @author YT
	 */
	public class SevendayCfgData
	{
		private static var _dataDic : Dictionary = new Dictionary();
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			for each (var info : Q_sevenday in arr)
			{
				_dataDic[info.q_id] = info;
			}
		}
		public static function getSevenday(id:int):Q_sevenday
		{
			return _dataDic[id];
		}
		/**根据职业性别返回展示模型*/
		public static function getSevendayModByJob(mod:String,job:int,sex:int):String
		{
			var modObj:Array=JSONUtil.decode(mod);
			if(modObj!=null&&modObj.length>0)
			{
				for each(var obj:Object in modObj)
				{
					if(obj.job==null&&obj.sex==null)
					{
						return obj.mod;
					}
					else if(obj.job!=null&&obj.sex==null&&obj.job==job)
					{
						return obj.mod;
					}
					else if(obj.job==null&&obj.sex!=null&&obj.sex==sex)
					{
						return obj.mod;
					}
					else if(obj.job!=null&&obj.sex!=null&&obj.job==job&&obj.sex==sex)
					{
						return obj.mod;
					}
				}
			}
			
			return ""
		}
		
	}
}