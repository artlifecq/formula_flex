package com.rpgGame.coreData.info.team
{
	import flash.utils.ByteArray;
	
	import app.message.ModelProto;
	
	import org.game.netCore.net.ByteBuffer;


	/**
	 * 队伍单元的数据
	 * @author 
	 */
	public class TeamUnit
	{
		/**在队伍里的位置编号(根据入队时间顺序)*/
		public var index : int;
		/** 玩家id **/
		public var id : Number;
		/** 国家id **/
		public var countryId : int;
		/** 玩家名字 **/
		public var name : String;
		/** 军团名字 **/
		public var guildName : String;
		/** 等级 **/
		public var level : int;
		/** 线路 **/
		public var line : int;
		/** 队员换装数据 **/
		public var resources : Array = null;
//		public var guJianWearedResource : Number = 0;
		/**更新后成员的坐标位置 X坐标*/
		public var mx : Number;
		/**更新后成员的坐标位置 Y坐标*/
		public var my : Number;
		/** 地图国家Id */
		public var mapCountryId : int;
		/** 场景id */
		public var sceneId : int;
		/** 是否在副本里 */
		public var isInCopy : Boolean;
		/**职业*/
		public var job : int;
		/**是否在线*/
		public var isOnline : Boolean;
		/**离线队员的被踢下线时间点*/
		public var leveTime : Number = 0;
		/**职业id*/
		public var raceId:int = -1;
		/** 是否跟随 **/
		private var _isFollowing:Boolean;

		public function TeamUnit()
		{
		}

		/**
		 * 换装数据 @L.L.M.Sunny 20160126 
		 * @param buffer
		 *
		 */
		public function setResources(buffer : ByteBuffer) : void
		{
			var resourcesLen : int = buffer.readVarint32();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes, 0, resourcesLen);
			var proto : ModelProto = new ModelProto();
			proto.mergeFrom(bytes);
			resources = proto.resources;
		}

		/** 是否跟随 **/
		public function get isFollowing():Boolean
		{
			return _isFollowing;
		}

		/**
		 * @private
		 */
		public function set isFollowing(value:Boolean):void
		{
			_isFollowing = value;
		}

	}
}
