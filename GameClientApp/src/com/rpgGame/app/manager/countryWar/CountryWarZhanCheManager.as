package com.rpgGame.app.manager.countryWar
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.CountryWarSender;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.ZhanCheData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 战车数据存储
	 * GuoDong.Zhang
	 * 2016-8-15
	 */
	public class CountryWarZhanCheManager
	{
		public static var sceneLoadedWhenTakeZhanChe:Boolean;
		public static var zhanCheSceneLoaded:Boolean;
		public static var zhanCheVersionNumber:int;
		/**自己战车的速度，存储以供异步处理*/
		public static var selfZhanCheSpeed:int;
		/**车主ID为key，存储战车场景ID*/
		private static var _zhanCheIDMap:HashMap;
		/**乘客ID列表*/
		private static var _passengerIDsMap:HashMap;
		
		public static function addZhanCheID(ownerID:Number,zhanCheID:Number):void
		{
			if(_zhanCheIDMap == null)
			{
				_zhanCheIDMap = new HashMap();
			}
			_zhanCheIDMap.add(ownerID,zhanCheID);
		}
		
		public static function removeZhanCheID(ownerID:Number):void
		{
			if(_zhanCheIDMap != null)
			{
				_zhanCheIDMap.remove(ownerID);
			}
		}
		
		public static function getZhanCheID(ownerID:Number):Number
		{
			if(_zhanCheIDMap != null)
			{
				return _zhanCheIDMap.getValue(ownerID);
			}
			return 0;
		}
		
		public static function addPassengerID(ownerID:Number,passengerID:Number):void
		{
			if(_passengerIDsMap == null)
			{
				_passengerIDsMap = new HashMap();
			}
			var vec:Vector.<Number> = _passengerIDsMap.getValue(ownerID);
			if(vec == null)
			{
				vec = new Vector.<Number>();
				_passengerIDsMap.add(ownerID,vec);
			}
			if(vec.indexOf(passengerID) < 0)
			{
				vec.push(passengerID);
			}
		}
		
		public static function removePassengerID(passengerID:Number):void
		{
			if(_passengerIDsMap != null)
			{
				var keys:Array = _passengerIDsMap.keys();
				if(keys)
				{
					var len:int = keys.length;
					var i:int = 0;
					for(i = len - 1; i >= 0; i--)
					{
						var ownerID:Number = keys[i];
						var vec:Vector.<Number> = _passengerIDsMap.getValue(ownerID);
						if(vec != null)
						{
							var index:int = vec.indexOf(passengerID);
							if(index >= 0)
							{
								vec.splice(index,1);
							}
						}
						else
						{
							_passengerIDsMap.remove(ownerID);
						}
					}
				}
				
			}
		}
		
		public static function getPassengerIDs(ownerID:Number):Vector.<Number>
		{
			if(_passengerIDsMap != null)
			{
				var vec:Vector.<Number> = _passengerIDsMap.getValue(ownerID);
				if(vec)
				{
					return vec.concat();
				}
			}
			return null;
		}
		
		public static function tryGetOnZhanChe():void
		{
			var role:SceneRole = SceneRoleSelectManager.selectedRole;
			if(role && role.type == SceneCharType.ZHAN_CHE)
			{
				var zhanCheData:ZhanCheData = role.data as ZhanCheData;
				if(zhanCheData)
				{
					CountryWarSender.reqOldDriverTakeMe(zhanCheData.ownerId);
				}
			}
		}
		
		public static function tryGetOffZhanChe():void
		{
			var heroData:HeroData = MainRoleManager.actorInfo;
			if(heroData.zhanCheOwnerID > 0)
			{
				if(heroData.zhanCheOwnerID == heroData.id)
				{
					CountryWarSender.reqDownFromZhanChe();
				}
				else
				{
					CountryWarSender.reqOldDriverLetMeLeave();
				}
			}
		}
	}
}