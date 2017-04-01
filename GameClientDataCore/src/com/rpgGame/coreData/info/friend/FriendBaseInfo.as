package com.rpgGame.coreData.info.friend
{
	import app.message.SingleRelation;

	public class FriendBaseInfo
	{
		public function FriendBaseInfo()
		{
		}
		
		public var id : Number;
		/**
		 *  名字
		 */
		public var name : String = "";
		
		/**
		 *他当前等级
		 */
		public var level : int;
		/**
		 *是否在线
		 */
		public var isOnLine : Boolean;
		/**
		 *所在国家 
		 */		
		public var country : int;
//		/**
//		 *是否有摆摊 
//		 */		
//		public var hasSell : Boolean; // 
		/**
		 *是男是女 
		 */		
		public var isMale : Boolean; //
		/**
		 *头像 
		 */		
		public var head : int; // 
//		/**
//		 * 家族名 
//		 */		
//		public var familyName : String; //
//		/**
//		 *帮派名 
//		 */		
//		public var guildName : String ; // 
		/**
		 *心情 
		 */		
		private var _mood : String =""; //
		/**
		 * 数据类型 
		 */		
		public var type : int;
		
		/**数据创建的时间**/
		public var time : Number;
		
		/**设置详细数据**/
		public function setupSingleRelation(detail:SingleRelation):void
		{
			if(!detail.id)
			{
				trace("发了个没有id的好友过来");
				return;
			}
			id = detail.id.toNumber();
			name = detail.name;
			level = detail.level;
			country = detail.country;
//			hasSell = detail.hasSell;
			isMale = detail.isMale;
			head = detail.head;
//			familyName = detail.familyName?BytesUtil.bytes2UTF(detail.familyName):"";
//			guildName =  detail.guildName?BytesUtil.bytes2UTF(detail.guildName):"";
			_mood =  detail.mood;
		}
		
		public function get mood():String
		{
			return _mood==""?"无":_mood;
		}
	}
}