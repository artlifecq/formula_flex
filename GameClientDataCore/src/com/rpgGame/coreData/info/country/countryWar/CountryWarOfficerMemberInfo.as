package com.rpgGame.coreData.info.country.countryWar
{
	
	/**
	 * 国战观战时所需的官员信息
	 * zhangguodong
	 * 2016-9-7
	 */
	public class CountryWarOfficerMemberInfo
	{
		private static var _pool:Vector.<CountryWarOfficerMemberInfo>;
		public static function recover(info:CountryWarOfficerMemberInfo):void
		{
			info.id = 0;
			info.name = null;
			info.isOnline = false;
			info.sceneId = 0;
			info.sceneCountry = 0;
			if(_pool == null)
			{
				_pool = new Vector.<CountryWarOfficerMemberInfo>();
			}
			_pool.push(info);
		}
		
		public static function getInfo():CountryWarOfficerMemberInfo
		{
			var info:CountryWarOfficerMemberInfo;
			if(_pool == null || _pool.length <= 0)
			{
				info = new CountryWarOfficerMemberInfo();
			}
			else
			{
				info = _pool.pop();
			}
			return info;
		}
		
		public var position:int;//官职
		public var id:Number = 0; // id
		public var name:String; // 名字
		public var isOnline:Boolean; // 是否在线，为true表示在线，false读取下面的离线时间，在线才可以读取后面的字段
		public var sceneId:int; // 所在场景
		public var sceneCountry:int; // 场景所属国家
	}
}