package com.rpgGame.app.manager.friend
{
	import com.netease.protobuf.Int64;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.FriendSender;
	import com.rpgGame.app.ui.alert.AlertText;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FriendEvent;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.friend.EnemyInfo;
	import com.rpgGame.coreData.info.friend.FriendAddedMeInfo;
	import com.rpgGame.coreData.info.friend.FriendBaseInfo;
	import com.rpgGame.coreData.info.friend.FriendInfo;
	import com.rpgGame.coreData.info.friend.FriendTalkInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangFriend;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.coreData.type.FriendType;
	
	import app.message.AllClientRelationDetail;
	import app.message.ClientFriendProto;
	import app.message.ClientRelation;
	import app.message.ClientRelationDetail;
	import app.message.EnemyProto;
	import app.message.SingleRelation;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;

	/**
	 *
	 * 好友数据管理
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-9 上午10:05:12
	 *
	 */
	public class FriendManager
	{
		public static var MAX_FRIEND_NUM : int = 0;
		public static var MAX_BLACK_NUM : int = 0;
		public static var ADD_FRIEND_TIMEOUT : int = 300000;
		public static var MAX_TALK_NUM : int = 30;

		/**是否请求过好友数据*/
		public static var requested : Boolean;
		/**好友列表Hash,FriendSimpleInfo*/
		private static var _friendHash : HashMap = new HashMap();
		/**屏蔽列表Hash,FriendSimpleInfo*/
		private static var _blackHash : HashMap = new HashMap();
		/**敌对列表**/
		private static var _enemyHash : HashMap = new HashMap();
		/**最近联系列表**/
		private static var _talkHash : HashMap = new HashMap();
		/**是否禁止被加为好友*/
		public static var forbidBeenAddedAsFriend : Boolean;
		/**把我加为好友的玩家数据列表*/
		private static var _targetAddedMeAsFriendVec : Vector.<FriendAddedMeInfo>;
		/**是否显示离线好友**/
		public static var isShowLeavelLineFriend : Boolean = true;
		public static var removeBlackId : Number;
		public static var removeFriendId : Number;

		public function FriendManager()
		{
		}

		public static function startTimer() : void
		{
			TimerServer.addLoop(onTimeTick, 1000);
		}
		/**设置基础数据**/
		public static function setBasicRelation(relation : ClientRelation) : void
		{
			setBaseBlack(relation.blackId);
			setBaseEnemy(relation.enemyList);
			setBaseFriend(relation.friends);
			forbidBeenAddedAsFriend = relation.forbidBeenAddedAsFriend;
		}
		//----------------------tools
		public static function getHashByType(type:int):HashMap
		{
			if(type != FriendType.RELATION_TYPE_BLACKLIST && type != FriendType.RELATION_TYPE_FRIEND && type != FriendType.RELATION_TYPE_ENEMY)
			{
				trace("传进来的数据是有问题的");
				return null;
			}
			switch(type)
			{
				case FriendType.RELATION_TYPE_BLACKLIST:
					return _blackHash;
				case FriendType.RELATION_TYPE_FRIEND:
					return 	_friendHash;
				case FriendType.RELATION_TYPE_ENEMY:
					return _enemyHash;
			}
			return null;
		}
		
		//-------------------简单数据
		/**
		 * 设置好友简单数据 
		 * @param array
		 * 
		 */		
		private static function setBaseFriend(array:Array):void
		{
			var friendInfo : FriendInfo;
			for each(var data : ClientFriendProto in array)
			{
				if(!data)
					continue;
				friendInfo = new FriendInfo();
				friendInfo.setup(data);
				friendInfo.type = FriendType.RELATION_TYPE_FRIEND;
				_friendHash.add(friendInfo.id,friendInfo);
			}
		}
		
		public static function getMaxFriendNum():int
		{
			return _friendHash.length;
		}
		
		public static function getMaxEnemyNum():int
		{
			return _enemyHash.length;
		}
		
		public static function getOnLineFriendNum():int
		{
			var result : int = 0;
			for each(var data : FriendInfo in _friendHash.getValues())
			{
				if(data && data.isOnLine)
					result ++;
			}
			return result;
		}
		
		public static function getOnLineEnemyNum():int
		{
			var result : int = 0;
			for each(var data : EnemyInfo in _enemyHash.getValues())
			{
				if(data && data.isOnLine)
					result ++;
			}
			return result;
		}
		
		public static function addFriendRelation(friendInfo : FriendInfo):void
		{
			_friendHash.add(friendInfo.id,friendInfo);
		}
		/**
		 * 设置仇人列表 
		 * @param array
		 * 
		 */		
		private static function setBaseEnemy(array:Array):void
		{
			var enemy : EnemyInfo;
			for each(var data : EnemyProto  in array)
			{
				if(!data)
					continue;
				enemy = new EnemyInfo();
				enemy.setup(data);
				enemy.type = FriendType.RELATION_TYPE_ENEMY;
				_enemyHash.add(enemy.id,enemy);
			}
		}
		
		public static function addEnemyRelation(enemy:EnemyInfo):void
		{
			_enemyHash.add(enemy.id,enemy);
		}
		
		public static function setEnemyRelation(proto:EnemyProto):void
		{
			if(!proto || !proto.enemyId)
				return;
			var enemy : EnemyInfo = _enemyHash.getValue(proto.enemyId.toNumber());
			if(!enemy)
				return;
			enemy.setup(proto);
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
		}
		/**
		 * 设置黑名单 
		 * @param array
		 * 
		 */		
		private static function setBaseBlack(array:Array):void
		{
			var black : FriendBaseInfo;
			for each(var id : Int64 in array)
			{
				if(!id)
					continue;
				black = new FriendBaseInfo();
				black.id = id.toNumber();
				black.type = FriendType.RELATION_TYPE_BLACKLIST;
				_blackHash.add(black.id,black);
			}
		}
		
		public static function addBlackRelation(black:FriendBaseInfo):void
		{
			_blackHash.add(black.id,black);
		}
		
		public static function addTalkInfo(id:Number,name:String):void
		{
			removeTalkMaxHashMap();
			var talk : FriendTalkInfo = new FriendTalkInfo();
			talk.id = id;
			talk.name = name;
			talk.time = SystemTimeManager.curtTm;
			_talkHash.add(id,talk);
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
		}
		
		private static function removeTalkMaxHashMap():void
		{
			if(!_talkHash || _talkHash.length < MAX_TALK_NUM)
				return;
			var removeData : FriendBaseInfo;
			for each(var data : FriendBaseInfo in HashMap)
			{
				if(!removeData || removeData.time < data.time)
					removeData = data;
			}
			_talkHash.remove(removeData.id);
		}
		
		public static function getBaseInfoById(id:Number):FriendBaseInfo
		{
			if(_friendHash.containsKey(id))
				return _friendHash.getValue(id);
			else if(_enemyHash.containsKey(id))
				return _enemyHash.getValue(id);
			else if(_blackHash.getValue(id))
				return _blackHash.getValue(id);
			return null;
		}
		//------------------详细数据
		/**
		 *设置所有好友的具体数据
		 * @param clientRelationDetail
		 *
		 */
		public static function setAllRelationDetail(allClient : AllClientRelationDetail) : void
		{
			var len : int = allClient.detail.length;
			var baseInfo : FriendBaseInfo;
			for (var i : int = 0; i < len; i++)
			{
				var client : ClientRelationDetail = allClient.detail[i];
				baseInfo = _friendHash.getValue(client.detail.id.toNumber());
				if(baseInfo)
				{
					baseInfo.setupSingleRelation(client.detail);
					baseInfo.isOnLine = client.isOnline;
				}
				
				baseInfo = _enemyHash.getValue(client.detail.id.toNumber());
				if(baseInfo)
				{
					baseInfo.setupSingleRelation(client.detail);
					baseInfo.isOnLine = client.isOnline;
				}
				
				baseInfo = _blackHash.getValue(client.detail.id.toNumber());
				if(baseInfo)
				{
					baseInfo.setupSingleRelation(client.detail);
					baseInfo.isOnLine = client.isOnline;
				}
			}
			
			EventManager.dispatchEvent(FriendEvent.FRIEND_ALL_LIST_INIT);
		}
		
		/**
		 * 更新详细数据到指定类型的hashmap
		 * @param singleRelation
		 * @param isOnLine
		 *
		 */
		public static function addDetailInfo(data:FriendBaseInfo) : FriendBaseInfo
		{
			var hash : HashMap = getHashByType(data.type);
			if(hash)
			{
				hash.add(data.id,data);
				return data;
			}
			return null;
		}
		
		public static function removeFriend(id:Number):FriendBaseInfo
		{
			var baseInfo : FriendBaseInfo = _friendHash.getValue(id);
			if(!baseInfo)
			{
				trace("你不能删除一个和你没有任何关系的人");
				return null;
			}
			_friendHash.remove(id);
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
			return baseInfo;
		}
		
		public static function removeEnemy(id:Number):FriendBaseInfo
		{
			var baseInfo : FriendBaseInfo = _enemyHash.getValue(id);
			if(!baseInfo)
			{
				trace("你不能删除一个和你没有任何关系的人");
				return null;
			}
			_enemyHash.remove(id);
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
			return baseInfo;
		}
		
		public static function removeBlack(id:Number):FriendBaseInfo
		{
			var baseInfo : FriendBaseInfo = _blackHash.getValue(id);
			if(!baseInfo)
			{
				trace("你不能删除一个和你没有任何关系的人");
				return null;
			}
			_blackHash.remove(id);
			EventManager.dispatchEvent(FriendEvent.BLACK_STATE_CHANGE);
			return baseInfo;
		}
		
		public static function changeDetailInfo(singleRelation : SingleRelation) : void
		{
			var id : Number = singleRelation.id.toNumber();
			var baseInfo : FriendBaseInfo = _friendHash.getValue(id);
			if(!baseInfo)
				return;
			baseInfo.setupSingleRelation(singleRelation);
			baseInfo.isOnLine = true;
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
		}
		
		public static function detailInfoOffLine(id : Number) : void
		{
			var info : FriendBaseInfo = _friendHash.getValue(id);
			if (info)
				info.isOnLine = false;
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
		}
		
		//--------------黑名单

		/**
		 * 检测是否黑名单
		 * @param id
		 *
		 */
		public static function checkIsBlackList(id : Number) : Boolean
		{
			return _blackHash.containsKey(id);
		}
		/**
		 * 检测是否是仇人 
		 * @param id
		 * @return 
		 * 
		 */		
		public static function checkIsEnemy(id : Number):Boolean
		{
			return _enemyHash.containsKey(id);
		}

		/**
		 * 检测是否好友
		 * @param id
		 *
		 */
		public static function checkIsFriend(id : Number) : Boolean
		{
			return _friendHash.containsKey(id);
		}

		/**
		 * 获取所有的好友 
		 * @return 
		 * 
		 */		
		public static function getFriendDetailInfos() : Array
		{
			var datas : Array = [];
			var len : int = _friendHash.length;
			var values : Array = _friendHash.getValues();
			for (var i : int = 0; i < len; i++)
			{
				var info : FriendInfo = values[i];
				if (info && info.type == FriendType.RELATION_TYPE_FRIEND)
				{
					if(isShowLeavelLineFriend)
						datas.push(info);
					else if(!isShowLeavelLineFriend && info.isOnLine)
						datas.push(info);
				}
			}
			datas.sortOn(["isOnLine", "name"], [Array.DESCENDING | Array.NUMERIC, Array.DESCENDING]);
			return datas;
		}
		
		public static function getTalkList():Array
		{
			return _talkHash.getValues();
		}
		
		/**获取仇人列表**/
		public static function getEnemyDetailInfos():Array
		{
			var datas : Array = [];
			var len : int = _enemyHash.length;
			var values : Array = _enemyHash.getValues();
			for (var i : int = 0; i < len; i++)
			{
				var info : FriendBaseInfo = values[i];
				if (info && info.type == FriendType.RELATION_TYPE_ENEMY)
				{
					if(isShowLeavelLineFriend)
						datas.push(info);
					else if(!isShowLeavelLineFriend && info.isOnLine)
						datas.push(info);
				}
			}
			datas.sortOn(["isOnLine", "name"], [Array.DESCENDING | Array.NUMERIC, Array.DESCENDING]);
			return datas;
		}
		
		/**获取黑名单列表**/
		public static function getBlackDetailInfos() : Array
		{
			var datas : Array = [];
			var len : int = _blackHash.length;
			var values : Array = _blackHash.getValues();
			for (var i : int = 0; i < len; i++)
			{
				var info : FriendBaseInfo = values[i];
				if (info && info.type == FriendType.RELATION_TYPE_BLACKLIST)
				{
					datas.push(info);
				}
			}
			datas.sortOn(["isOnLine", "name"], [Array.DESCENDING | Array.NUMERIC, Array.DESCENDING]);
			return datas;
		}
		
		public static function reqestReplyAddFriend(id:Number,isSure:Boolean,name:String = null):void
		{
			if (MainRoleManager.actorID == id)
			{
				NoticeManager.showNotify("不能加自己为好友");
				return;
			}
			if (checkIsFriend(id))
			{
				NoticeManager.showNotify("该玩家已经在你的好友列表中");
				return;
			}
			if (checkIsEnemy(id)) //在仇人列表需要先充仇人列表中移除
			{
				removeBlackId = id;
				if (!name)
				{
					name = "该玩家";
				}
				GameAlert.showAlertUtil(LangFriend.addFriendRemoveEnemy,addFriendRemoveEnemyClick,name);
			}else if (checkIsBlackList(id)) //在黑名单中需先从黑名单中移除
			{
				removeBlackId = id;
				if (!name)
				{
					name = "该玩家";
				}
				GameAlert.showAlertUtil(LangFriend.addFriendRemoveBlack,addFriendRemoveBlackClick,name);
			}
			else
			{
				if(reqAddFriendFailList.indexOf(id)!=-1)
				{
					NoticeManager.showNotify(LangFriend.addFriendInTime);
					return;
				}
				FriendSender.reqAddFriend(id);
			}
		}
		private static function replyAddFriendRemoveEnemy(gameALert:GameAlert,target:int):void
		{
			
		}
			
		public static function requestAddFriend(id : Number, name : String = null) : void
		{
			if (MainRoleManager.actorID == id)
			{
				NoticeManager.showNotify("不能加自己为好友");
				return;
			}
			if (checkIsFriend(id))
			{
				NoticeManager.showNotify("该玩家已经在你的好友列表中");
				return;
			}
			if (_friendHash.length >= MAX_FRIEND_NUM)
			{
				GameAlert.showAlertUtil(LangFriend.addFriendNumMax);
				return;
			}
			
			if (checkIsEnemy(id)) //在仇人列表需要先充仇人列表中移除
			{
				removeBlackId = id;
				if (!name)
				{
					name = "该玩家";
				}
				GameAlert.showAlertUtil(LangFriend.addFriendRemoveEnemy,addFriendRemoveEnemyClick,name);
			}else if (checkIsBlackList(id)) //在黑名单中需先从黑名单中移除
			{
				removeBlackId = id;
				if (!name)
				{
					name = "该玩家";
				}
				GameAlert.showAlertUtil(LangFriend.addFriendRemoveBlack,addFriendRemoveBlackClick,name);
			}
			else
			{
				if(reqAddFriendFailList.indexOf(id)!=-1)
				{
					NoticeManager.showNotify(LangFriend.addFriendInTime);
					return;
				}
				FriendSender.reqAddFriend(id);
			}
		}
		
		private static function addFriendRemoveBlackClick(gameAlert : GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					requestAddFriendSureCallback();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					requestAddFriendCancelCallback();
					break;
			}		
		}
		
		private static function addFriendRemoveEnemyClick(gameAlert : GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					reqsetAddFrendRemoveEnemy();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					requestAddFriendCancelCallback();
					break;
			}
		}
		/**申请加为好友但是被对方拒绝了的list**/
		private static var reqAddFriendFailList : Array = [];
		public static function reqAddFriendFailPlayer(id:Number):void
		{
			if(reqAddFriendFailList.indexOf(id)!=-1)
			{
				trace("明显不能申请加好友的，但是居然还是申请了？不科学吧。");
				return;
			}
			reqAddFriendFailList.push(id);
			TimerServer.add(removeAddFriendFail,300000,[id]);
		}
		
		private static function removeAddFriendFail(id:Number):void
		{
			if(reqAddFriendFailList.indexOf(id)!=-1)
				reqAddFriendFailList.splice(reqAddFriendFailList.indexOf(id),1);
		}
		private static function reqsetAddFrendRemoveEnemy():void
		{
			FriendSender.reqAddFriend(removeBlackId);
			removeBlackId = NaN;
		}

		private static function requestAddFriendSureCallback() : void
		{
			FriendSender.reqAddFriend(removeBlackId);
			removeBlackId = NaN;
		}
		/**
		 * 不论是何种方式添加好友了，都把这两个给删了 
		 * 
		 */		
		public static function addFriendRemoveBlackAndEnemy(id:Number):void
		{
			removeBlack(id);
			removeEnemy(id);
		}

		private static function requestAddFriendCancelCallback() : void
		{
			removeBlackId = NaN;
		}

		public static function requestRemoveFriend(id : Number) : void
		{
			removeFriendId = id;
			var friendInfo : FriendInfo = _friendHash.getValue(id);
			if(friendInfo)
			{
				GameAlert.showAlertUtil(LangAlertInfo.removeFriend,requestRemoveFriendClick,friendInfo.name);
			}
//				GameAlert.show("确定移除该好友吗？", "提示", requestRemoveFriendSureCallback, requestRemoveFriendCancelCallback);
		}
		
		private static function requestRemoveFriendClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					requestRemoveFriendSureCallback();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					requestRemoveFriendCancelCallback();
					break;
			}
		}

		private static function requestRemoveFriendSureCallback() : void
		{
			FriendSender.reqRemoveFriend(removeFriendId);
			removeFriendId = NaN;
		}

		private static function requestRemoveFriendCancelCallback() : void
		{
			removeFriendId = NaN;
		}

		public static function requestAddBlack(id : Number, name : String = null) : void
		{
			if (MainRoleManager.actorID == id)
			{
				NoticeManager.showNotify("不能加自己到黑名单");
				return;
			}
			if (checkIsBlackList(id))
			{
				NoticeManager.showNotify("该玩家已经在你的黑名单列表中");
				return;
			}
			if (_blackHash.length >= MAX_BLACK_NUM)
			{
				GameAlert.showAlertUtil(LangFriend.addBlackNumMax);
				return;
			}
			if (checkIsFriend(id)) //是好友需先移除好友
			{
				removeBlackId = id;
				if (!name)
				{
					name = "该玩家";
				}
				GameAlert.showAlertUtil(LangFriend.addBlackRemoveFriend,addBlackRemoveFriendClick,name);
			}
			else
			{
				FriendSender.reqAddBlack(id);
			}
		}
		
		private static function addBlackRemoveFriendClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					requestAddBlackSureCallback();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					requestAddBlackCancelCallback();
					break;
			}
		}
		
		private static function requestAddBlackSureCallback() : void
		{
			FriendSender.reqRemoveFriend(removeBlackId);
			FriendSender.reqAddBlack(removeBlackId);
			removeBlackId = NaN;
		}

		private static function requestAddBlackCancelCallback() : void
		{
			removeBlackId = NaN;
		}

		public static function requestRemoveBlack(id : Number) : void
		{
			FriendSender.reqRemoveBlack(id);
		}

		/**
		 * 添加把我添加为好友的玩家数据
		 * @param value
		 *
		 */
		public static function addTargetAddedMeAsFriend(value : FriendAddedMeInfo) : void
		{
			if (!_targetAddedMeAsFriendVec)
			{
				_targetAddedMeAsFriendVec = new Vector.<FriendAddedMeInfo>();
			}
			value.addTime = SystemTimeManager.curtTm;
			_targetAddedMeAsFriendVec.push(value);

			EventManager.dispatchEvent(FriendEvent.FRIEND_ADDED_COUNT_CHANGED);
			if(!AppManager.isAppInScene(AppConstant.TARGET_ADD_ME_TO_FRIEND))
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.FRIEND_TYPE, FriendManager.targetAddedMeAsFriendCount);
		}

		public static function removeTargetAddedMeAsFriend(id : Number) : void
		{
			if (!_targetAddedMeAsFriendVec)
			{
				return;
			}
			var len : int = _targetAddedMeAsFriendVec.length;
			for (var i : int = 0; i < len; i++)
			{
				var target : FriendAddedMeInfo = _targetAddedMeAsFriendVec[i];
				if (target.id == id)
				{
					_targetAddedMeAsFriendVec.splice(i, 1);
					break;
				}
			}
			EventManager.dispatchEvent(FriendEvent.FRIEND_ADDED_COUNT_CHANGED);
			if(AppManager.isAppInScene(AppConstant.TARGET_ADD_ME_TO_FRIEND))
				return;
			if (_targetAddedMeAsFriendVec.length > 0)
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.FRIEND_TYPE, FriendManager.targetAddedMeAsFriendCount);
			else
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.FRIEND_TYPE);
		}
		/**回复所有的好友申请**/
		public static function reqAllAddMeToFriend(req:Boolean):void
		{
			if (!_targetAddedMeAsFriendVec)
				return;
			var len : int = _targetAddedMeAsFriendVec.length;
			for (var i : int = 0; i < len; i++)
			{
				var target : FriendAddedMeInfo = _targetAddedMeAsFriendVec[i];
				if (target && target.id )
				{
					FriendSender.reqReplyAddFriend(target.id, req);
					break;
				}
			}
			_targetAddedMeAsFriendVec.length = 0;
		}

		/**
		 * 检测目标是否已经在加我为好友的列表里
		 * @param id
		 * @return
		 *
		 */
		public static function checkInTargetAddedMeAsFriend(id : Number) : FriendAddedMeInfo
		{
			if (_targetAddedMeAsFriendVec)
			{
				var len : int = _targetAddedMeAsFriendVec.length;
				for (var i : int = 0; i < len; i++)
				{
					var target : FriendAddedMeInfo = _targetAddedMeAsFriendVec[i];
					if (target.id == id)
					{
						return target;
					}
				}
			}
			return null;
		}

		/**
		 * 清空把我添加为好友的玩家数据
		 *
		 */
		public static function clearTargetAddedMeAsFriend() : void
		{
			if (_targetAddedMeAsFriendVec)
			{
				_targetAddedMeAsFriendVec.length = 0;
				_targetAddedMeAsFriendVec = null;
			}
		}

		/**
		 * 获取把我添加为好友的玩家数据列表
		 * @return
		 *
		 */
		public static function getTargetAddedMeAsFriendVec() : Vector.<FriendAddedMeInfo>
		{
			return _targetAddedMeAsFriendVec;
		}

		/**
		 * 获取把我添加为好友的玩家个数
		 * @return
		 *
		 */
		public static function get targetAddedMeAsFriendCount() : int
		{
			if (_targetAddedMeAsFriendVec)
			{
				return _targetAddedMeAsFriendVec.length;
			}
			return 0;
		}

		private static function onTimeTick() : void
		{
			if (_targetAddedMeAsFriendVec)
			{
				var curtTm : Number = SystemTimeManager.curtTm;
				var len : int = _targetAddedMeAsFriendVec.length;
				for (var i : int = len - 1; i >= 0; i--)
				{
					var target : FriendAddedMeInfo = _targetAddedMeAsFriendVec[i];
					if (curtTm - target.addTime > ADD_FRIEND_TIMEOUT)
					{
						_targetAddedMeAsFriendVec.splice(i, 1);
					}
				}
				var newLen : int = _targetAddedMeAsFriendVec.length;
				if (len > newLen)
				{
					EventManager.dispatchEvent(FriendEvent.FRIEND_ADDED_COUNT_CHANGED);
					if (newLen > 0)
						EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.FRIEND_TYPE, newLen);
					else
						EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.FRIEND_TYPE);
				}
			}
		}
		
		public static function editorMood():void
		{
			AlertText.showAlert("心 情",MainRoleManager.actorInfo.mood,sendEditorMood);
		}
		private static var editorMoodStr:String;
		private static function sendEditorMood(str:String):void
		{
			editorMoodStr = str;
			FriendSender.editorMood(str);
		}
		
		public static function editorMoodComplete():void
		{
			MainRoleManager.actorInfo.mood = editorMoodStr;
			EventManager.dispatchEvent(FriendEvent.MOOD_CHANGE);
		}
	}
}
