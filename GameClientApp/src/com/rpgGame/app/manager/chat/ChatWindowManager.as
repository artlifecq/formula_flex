package com.rpgGame.app.manager.chat
{
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.info.chat.PrivateChaterVo;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 对话聊天管理
	 * @author Guodong.Zhang
	 * 
	 */
	public class ChatWindowManager
	{
		private static var _privateChatWindowInfoMap : HashMap = new HashMap();
		//----------------------没打开聊天窗口时为了弹出列表显示的私聊数据缓存-----------------
		private static var _privateChaterVec:Vector.<Number> = new Vector.<Number>();
		private static var _nameMap:HashMap = new HashMap();
		
		/**
		 * 添加当前聊天对象
		 * @param id
		 * 
		 */
		public static function addWindowChatTargetId(heroID:Number,heroName:String = null) : void
		{
			_nameMap.add(heroID,heroName);
			var index:int = _privateChaterVec.indexOf(heroID);
			if(index >= 0)
			{
				_privateChaterVec.splice(index,1);
			}
			_privateChaterVec.unshift(heroID);
		}
		
		public static function removeWindowChatTargetId(heroID:Number):void
		{
			var len:int = _privateChaterVec.length;
			for(var i:int = 0; i < len; i++)
			{
				var targetID:Number = _privateChaterVec[i];
				if(targetID == heroID)
				{
					_privateChaterVec.splice(i,1);
					break;
				}
			}
		}
		
		public static function getUserName(userID:Number):String
		{
			return _nameMap.getValue(userID);
		}
		
		/** 删除所有当前私聊对象 */
		public static function removeAllWindowTargetId() : void
		{
			_privateChaterVec.length = 0;
		}
		
		public static function getWindowChatTargetIdVec() : Vector.<Number>
		{
			return _privateChaterVec;
		}
		
		public static function checkHasMessageWait():Boolean
		{
			var len:int = _privateChaterVec.length;
			for(var i:int = 0; i < len; i++)
			{
				var targetID:Number = _privateChaterVec[i];
				var privateInfo:PrivateChaterVo = getPrivateChatDataByUserId(targetID);
				if(privateInfo)
				{
					if(privateInfo.waitMsgNum > 0)
					{
						return true;
					}
				}
			}
			return false;
		}
		
		public static function addPrivateChatData(targetUserId : Number, chatInfo : ChatInfo, isRecord : Boolean = false, hasMore : Boolean = false, isWaite : Boolean = false) : void
		{
			var privateChaterVo : PrivateChaterVo = getPrivateChatDataByUserId(targetUserId);
			if (privateChaterVo == null)
			{
				privateChaterVo = createOneWindowChatVo(targetUserId, chatInfo.name, chatInfo.level);
			}
			privateChaterVo.putMsg(chatInfo, isRecord, isWaite);
			privateChaterVo.hasMoreRecord = hasMore;
		}
		
		public static function addPrivateChatOfflineData(id : Number, userName : String, userLevel : int) : void
		{
			var privateChaterVo : PrivateChaterVo = getPrivateChatDataByUserId(id);
			if (privateChaterVo == null)
			{
				privateChaterVo = createOneWindowChatVo(id, userName, userLevel);
			}
			privateChaterVo.putOfflineMsg();
			privateChaterVo.hasMoreRecord = true;
		}
		
		public static function getPrivateChatDataByUserId(targetUserId : Number) : PrivateChaterVo
		{
			return _privateChatWindowInfoMap.getValue(targetUserId);
		}
		
		public static function isHavePrivateChatVo(targetUserId : Number) : Boolean
		{
			return getPrivateChatDataByUserId(targetUserId) != null;
		}
		
		/**
		 * 离线玩家留言创建窗口对象(可能不在场景上，所以不能用上一种方法创建)
		 * @param	id
		 * @param	rName
		 * @param	lev
		 */
		public static function createOneWindowChatVo(id : Number, rName : String, lvl : int = 0) : PrivateChaterVo
		{
			var privateChaterVo : PrivateChaterVo = new PrivateChaterVo();
			privateChaterVo.id = id;
			privateChaterVo.name = rName;
			privateChaterVo.level = lvl;
			_privateChatWindowInfoMap.add(id, privateChaterVo);
			return privateChaterVo;
		}
		
	}
}