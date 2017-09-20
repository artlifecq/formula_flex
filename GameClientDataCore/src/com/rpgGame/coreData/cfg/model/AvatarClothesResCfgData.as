package com.rpgGame.coreData.cfg.model
{
	import com.rpgGame.coreData.clientConfig.AvatarClothesRes;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.type.SexType;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 换装衣服资源配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-26 上午10:25:12
	 *
	 */
	public class AvatarClothesResCfgData
	{
		private static var _map : HashMap;

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : AvatarClothesRes in arr)
			{
				_map.add(info.id, info);
			}
		}
		
		/**
		 *获取身体模型资源 
		 * @param id
		 * @param job
		 * @param sex
		 * @return 
		 * 
		 */
		public static function getBodyRes(id:int,job:int,sex:int):String
		{
			var info:AvatarClothesRes=_map.getValue(id);
			if(!info){
				info=_map.getValue(job);
			}
			var bodyRes:String;
			switch(job){
				case JobEnum.ROLE_1_TYPE:
					bodyRes=info.bodyManRes;
					break;
				case JobEnum.ROLE_2_TYPE:
					if(sex==SexType.MALE){
						bodyRes=info.bodyManRes;
					}else{
						bodyRes=info.bodyWomanRes;
					}
					break;
				case JobEnum.ROLE_4_TYPE:
					bodyRes=info.bodyWomanRes;
					break;
			}
			return bodyRes;
		}
		
		public  static function getBodyAvatarInfo(id:int,job:int):AvatarClothesRes
		{
			var info:AvatarClothesRes=_map.getValue(id);
			if(!info){
				info=_map.getValue(job);
			}
			return info;
		}

		public function AvatarClothesResCfgData()
		{
		}
	}
}
