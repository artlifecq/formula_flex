package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.chat.ChatDataManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.chat.ChatWindowManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.friend.FriendManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.ChatSender;
	import com.rpgGame.app.ui.main.chat.ChatWindowPanel;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.cfg.FaceCfgData;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.info.chat.PrivateChaterVo;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	
	import flash.utils.ByteArray;
	
	import app.cmd.ChatModuleMessages;
	import app.message.ChatContentProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.client.mainCore.utils.Delegate;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	import org.game.netCore.net.BytesUtil;
	
	/**
	 * 聊天
	 * 聊天系统消息处理  ModuleID==12
	 * @author carver
	 *
	 */
	public class ChatCmdListener extends BaseBean
	{
		
		public function ChatCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
//			SocketConnection.addCmdListener(ChatModuleMessages.S2C_GOODS_INFO_REPLY, onGetItemInfo);
//			SocketConnection.addCmdListener(ChatModuleMessages.S2C_GOODS_INFO_REPLY_ERROR, onGetItemInfoError);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_COUNTRY_CHAT_SUCCESS, Delegate.create(onGetSendSuccess,EnumChatChannelType.CHAT_CHANNEL_COUNTRY));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_COUNTRY_CHAT_FAIL, onSendWorldFaile);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_COUNTRY_CHAT_BROADCAST, getCountryBroadCast);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_WORLD_CHAT_SUCCESS, Delegate.create(onGetSendSuccess,EnumChatChannelType.CHAT_CHANNEL_WORLD));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_WORLD_CHAT_FAIL, onSendWorldFaile);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_WORLD_CHAT_BROADCAST, getWorldBroadCast);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_SCENE_CHAT_SUCCESS, Delegate.create(onGetSendSuccess,EnumChatChannelType.CHAT_CHANNEL_NORMAL));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_SCENE_CHAT_FAIL, onSendNormalFaile);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_SCENE_CHAT_BROADCAST, getNormalBroadCast);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_PAID_CHAT_SUCCESS, Delegate.create(onGetSendSuccess,EnumChatChannelType.CHAT_CHANNEL_LABA));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_PAID_CHAT_FAIL, onSendChuanyinFaile);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_PAID_CHAT_FORBIDDEN, onSendChuanyinFaileStop);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_PAID_CHAT_BROADCAST, getChuanyinBroadCast);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_NORMAL_PRIVATE_CHAT_SUCCESS_AND_TARGET_ONLINE, Delegate.create(onGetPrivateChatBack,true));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_NORMAL_PRIVATE_CHAT_SUCCESS_AND_TARGET_OFFLINE, Delegate.create(onGetPrivateChatBack,false));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_NORMAL_PRIVATE_CHAT_FAIL, onGetPrivateChatFaile);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_RECEIVED_NORMAL_PRIVATE_CHAT, getPrivateChatCast);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_WINDOW_CHAT_OPEN_REPLY_MOOD, onGetStateAndMood);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_WINDOW_CHAT_OPEN_ERROR, onGetChaterConditionFaile);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_SEND_WINDOW_CHAT_SUCCESS_AND_TARGET_ONLINE, Delegate.create(onGetWindowChatBack,true));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_SEND_WINDOW_CHAT_SUCCESS_AND_TARGET_OFFLINE, Delegate.create(onGetWindowChatBack,false));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_SEND_WINDOW_CHAT_FAIL, onGetPrivateChatFaile);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_RECEIVED_WINDOW_CHAT, getWindowChatCast);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_OTHER_IS_TYPING, Delegate.create(getChaterIsTyping,true));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_OTHER_STOPPED_TYPING, Delegate.create(getChaterIsTyping,false));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_GET_CHAT_HISTORY_FAIL, onGetChatRecordFaile);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_GET_CHAT_HISTORY_RESULT, onGetChatRecordBack);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_THEY_LEFT_MSG_WHEN_YOU_OFFLINE, getSomeOffLineMsg);
		
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_TEAM_CHAT_FAIL, onSendTeamFaile);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_TEAM_CHAT_SUCCESS, Delegate.create(onGetSendSuccess,EnumChatChannelType.CHAT_CHANNEL_TEAM));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_TEAM_CHAT_BROADCAST, getTeamBroadCast);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_BROADCAST_MOOD, onBroadcastMoodSuccess);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_BROADCAST_MOOD_FAIL, onBroadcastMoodFail);
			
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_FAMILY_CHAT_FAIL, onSendFamilyFaile);
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_FAMILY_CHAT_SUCCESS, Delegate.create(onGetSendSuccess,EnumChatChannelType.CHAT_CHANNEL_FAMILY));
			SocketConnection.addCmdListener(ChatModuleMessages.S2C_FAMILY_CHAT_BROADCAST, getFamilyBroadCast);
			
			finish();
		}
		
		/**
		 * 心情广播
		 *
		 * varint64 玩家id
		 * varint32 心情id
		 */
		private function onBroadcastMoodSuccess(buffer:ByteBuffer):void
		{
			var userID:Number = buffer.readVarint64();
			var moodIndex:int = buffer.readVarint32();
			var faceInfo:FaceInfo = FaceCfgData.getMoodBigInfoByKey(moodIndex);
			var role:SceneRole = SceneManager.getSceneObjByID(userID) as SceneRole;
			if(role && role.usable && faceInfo)
			{
				if(role.headFace is HeadFace)
					(role.headFace as HeadFace).addMoodMC(faceInfo);
			}
		}
		
		/**
		 * 发送心情失败, 请求太过频繁
		 */
		private function onBroadcastMoodFail(buffer:ByteBuffer):void
		{
			NoticeManager.mouseFollowNotify("发送心情失败, 请求太过频繁");
		}
		
		/**
		 * 返回物品静态信息错误
		 * 附带varint32错误码
		 * 1. 没找到你找的物品
		 * 2. 你已经问过这物品了, 怎么还来问
		 */
		private function onGetItemInfoError(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_GOODS_REPLY_ERROR1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_GOODS_REPLY_ERROR2 );
					break;
			}
		}
		
		/**
		 * 收到的发送成功返回,自己直接显示发送内容
		 * @param buffer
		 * @param type ChatChannelType枚举
		 * 
		 */
		private function onGetSendSuccess(buffer:ByteBuffer,channel:int):void
		{
			var chatInfo:ChatInfo = ChatManager.mySendChatInfo;
			if( chatInfo == null )
				return;
			chatInfo.channel = channel;
			chatInfo.realShowMsg = chatInfo.speech;
			chatInfo.realShowName = chatInfo.name;
			
			ChatManager.saveCDInfo(channel);
			ChatManager.parseReceivedChatMsg( chatInfo );
			ChatDataManager.GetInstance().putChatData( chatInfo );
			
			EventManager.dispatchEvent( ChatEvent.SEND_SUCCESS, chatInfo );
		}
		
		/**
		 *国家频道发送失败 
		 * @param buffer
		 * 
		 */
		private function onSendCountryFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_COUNTRY_CHAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_COUNTRY_CHAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_COUNTRY_CHAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.CHAT_COUNTRY_CHAT_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.CHAT_COUNTRY_CHAT_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.CHAT_COUNTRY_CHAT_FAIL6 );
					break;
			}
		}
		
		/**
		 * 国家频道广播 
		 * @param buffer
		 * 
		 */
		private function getCountryBroadCast(buffer:ByteBuffer):void
		{
			showGetChatMessage(EnumChatChannelType.CHAT_CHANNEL_COUNTRY, getChatProto(buffer));
		}
		
		/**
		 *世界频道发送失败 
		 * @param buffer
		 * 
		 */
		private function onSendWorldFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_WORLD_CHAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_WORLD_CHAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_WORLD_CHAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.CHAT_WORLD_CHAT_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.CHAT_WORLD_CHAT_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.CHAT_WORLD_CHAT_FAIL6 );
					break;
				case 7:
					NoticeManager.showHint( EnumHintInfo.CHAT_WORLD_CHAT_FAIL7 );
					break;
			}
		}
		
		/**
		 * 世界频道广播 
		 * @param buffer
		 * 
		 */
		private function getWorldBroadCast(buffer:ByteBuffer):void
		{
			showGetChatMessage(EnumChatChannelType.CHAT_CHANNEL_WORLD, getChatProto(buffer));
		}
		
		/**
		 * 场景聊天失败
		 * 附带varint32的错误码
		 * 1. 发送太频繁
		 * 2. 话太长
		 * 3. 格式非法. 消息后面解不出ChatMessage
		 * 4. 你被禁言了
		 * 5. 你被天子禁言了
		 */
		private function onSendNormalFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_SCENE_CHAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_SCENE_CHAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_SCENE_CHAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.CHAT_SCENE_CHAT_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.CHAT_SCENE_CHAT_FAIL5 );
					break;
			}
		}
		
		//发送一句错误提示
		private function showWrongHint(wronginfo:String,isWrong:Boolean = true):void
		{
			ChatManager.showWrongHint(wronginfo,isWrong)
		}
		
		/**
		 * 普通(当前)频道广播
		 * @param buffer
		 * 
		 */
		private function getNormalBroadCast(buffer:ByteBuffer):void
		{
			showGetChatMessage(EnumChatChannelType.CHAT_CHANNEL_NORMAL,getChatProto(buffer));
		}
		
		/**
		 * 因为被禁言而失败
		 * @param buffer
		 * 
		 */
		private function onSendChuanyinFaileStop(buffer:ByteBuffer):void
		{
			//			Mgr.chatMgr.chuanyinTimeNotEnd(buffer.readVarint64());
		}
		
		/**
		 * 喇叭广播
		 * @param buffer
		 * 
		 */
		private function getChuanyinBroadCast(buffer:ByteBuffer):void
		{
			showGetChatMessage(EnumChatChannelType.CHAT_CHANNEL_LABA,getChatProto(buffer));
		}
		
		/**
		 * 收到左下角私聊发送后的返回(true对方在线，false对方不在线)
		 * @param buffer
		 * @param isOnLine
		 * 
		 */
		private function onGetPrivateChatBack(buffer:ByteBuffer,isOnLine:Boolean):void
		{
			if (isOnLine)
			{
				onGetSendSuccess(buffer,EnumChatChannelType.CHAT_CHANNEL_SILIAO);
			}
			else
			{
				NoticeManager.mouseFollowNotify("对方不在线");
			}
		}
		
		/**
		 * 私聊广播
		 * @param buffer
		 * 
		 */
		private function getPrivateChatCast(buffer:ByteBuffer):void
		{
			var time:Number = buffer.readVarint64();
			showGetChatMessage(EnumChatChannelType.CHAT_CHANNEL_SILIAO, getChatProto(buffer) );
		}
		
		/**
		 * 窗口私聊广播
		 * @param buffer
		 * 
		 */
		private function getWindowChatCast(buffer:ByteBuffer):void
		{
			var talkTime:Number = buffer.readVarint64();
			var chatInfo:ChatInfo = getChatInfo(EnumChatChannelType.CHAT_CHANNEL_WINDOW, buffer);
			chatInfo.talkTime = talkTime;
			if(chatInfo)
			{
				chatInfo.talkTime = talkTime;
				chatInfo.realShowMsg = chatInfo.speech;
				chatInfo.realShowName = chatInfo.name;
				ChatWindowManager.addPrivateChatData(chatInfo.id,chatInfo,false,false,true);
				ChatWindowManager.addWindowChatTargetId(chatInfo.id);
				var isPrivateWindowShowing:Boolean = ChatWindowPanel.isShowing();
				if(isPrivateWindowShowing)
				{
					EventManager.dispatchEvent(ChatEvent.GET_NEW_WHISPER_DATA,chatInfo);
				}
				else
				{
					EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.CHAT_TYPE);
				}
			}
		}
		
		/**
		 * 收到窗口私聊信息发送成功后返回  isOnLine对方是否在线
		 * @param buffer
		 * @param isOnLine
		 * 
		 */
		private function onGetWindowChatBack(buffer:ByteBuffer,isOnLine:Boolean):void
		{
			EventManager.dispatchEvent(ChatEvent.WINDW_CHAT_SEND_SUCCESS, isOnLine);
		}
		
		/**
		 * 请求对方心情失败
		 * @param buffer
		 * 
		 */
		private function onGetChaterConditionFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_WINDOW_CHAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_WINDOW_CHAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_WINDOW_CHAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.CHAT_WINDOW_CHAT_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.CHAT_WINDOW_CHAT_FAIL5 );
					break;
			}
		}
		
		/**
		 * 收到对方的状态和心情
		 * @param buffer
		 * 
		 */
		private function onGetStateAndMood(buffer:ByteBuffer):void
		{
			var id:Number = buffer.readVarint64();
			var ddd:int = buffer.readVarint32();
			var isOnLine:Boolean = (ddd & 1) == 1;
			var race:int = ddd >>> 1;
			var lev:int = buffer.readVarint32();
			var mood:String = BytesUtil.readRemainUTF(buffer);
		}
		
		/**
		 * 喇叭频道发送失败 
		 * @param buffer
		 * 
		 */
		private function onSendChuanyinFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL6 );
					break;
				case 7:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL7 );
					break;
				case 8:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL8 );
					break;
			}
		}
		
		/**
		 * 发送国家频道聊天失败
		 * @param buffer
		 * 
		 */
		private function onGetUnionChatFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL6 );
					break;
				case 7:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL7 );
					break;
				case 8:
					NoticeManager.showHint( EnumHintInfo.CHAT_PAID_CHAT_FAIL8 );
					break;
			}
		}
		
		/**
		 * 跟我聊天的对象是否正在输入
		 * @param buffer
		 * @param isTypeing
		 * 
		 */
		private function getChaterIsTyping(buffer:ByteBuffer,isTypeing:Boolean):void
		{
			//			if(ChatWindow.isShowing())
			//			{
			//				ChatWindow.instance.setChaterInputState(buffer.readVarint64(),isTypeing);
			//			}
		}
		
		/**
		 * 上线后收到对方发来的离线消息
		 * @param buffer
		 * 
		 */
		private function getSomeOffLineMsg(buff:ByteBuffer):void
		{
			var showIcon:Boolean = false;
			while(buff.bytesAvailable)
			{
				var id:Number = buff.readVarint64();
				var name:String = buff.readUTF();
				var level:int = buff.readVarint32();
				ChatWindowManager.addPrivateChatOfflineData(id,name,level);
				ChatWindowManager.addWindowChatTargetId(id);
				showIcon = true;
				ChatSender.requestChatRecord(id);
			}
			if(showIcon)
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.CHAT_TYPE);
			}
		}
		
		/**
		 * 收到国家频道信息广播
		 * @param buffer
		 * 
		 */
		private function onGetUnionChatBroadCast(buffer:ByteBuffer):void
		{
			showGetChatMessage(EnumChatChannelType.CHAT_CHANNEL_COUNTRY, getChatProto(buffer) );
		}
		
		private function showGetChatMessage(channel:int, chatMessage:ChatContentProto):void
		{
			var chatInfo:ChatInfo = getChatInfoByChatMessage(channel,chatMessage);
			//不显示黑名单聊天内容
			if(FriendManager.checkIsBlackList(chatInfo.id))
			{
				return;
			}
			
			ChatManager.parseReceivedChatMsg( chatInfo );
			//私聊添加最近联系人
			if(channel == EnumChatChannelType.CHAT_CHANNEL_SILIAO || channel == EnumChatChannelType.CHAT_CHANNEL_WINDOW)
			{
				FriendManager.addTalkInfo(chatInfo.id,chatInfo.name);
			}
			ChatDataManager.GetInstance().putChatData( chatInfo );
			
			EventManager.dispatchEvent( ChatEvent.GET_NEW_NORMAL_DATA, chatInfo );
		}
		
		/**
		 * 判断频道是否被屏蔽 
		 * @param channel
		 * @return 
		 * 
		 */		
		private function isShield(channel:int):Boolean
		{
			//			if(channel == ChatChannelType.CHAT_CHANNEL_ALLY)
			//			{
			//				return ClientSettingManager.getBoolValue(EnumClientBoolSetting.SHIELD_COUNTRY_CHAT);
			//			}
			//			else if(channel == ChatChannelType.CHAT_CHANNEL_WORLD)
			//			{
			//				return ClientSettingManager.getBoolValue(EnumClientBoolSetting.SHIELD_WORLD_CHAT);
			//			}
			//			else if(channel == ChatChannelType.CHAT_CHANNEL_PARTY)
			//			{
			//				return ClientSettingManager.getBoolValue(EnumClientBoolSetting.SHIELD_PART_CHAT);
			//			}
			//			else if(channel == ChatChannelType.CHAT_CHANNEL_TEAM)
			//			{
			//				return ClientSettingManager.getBoolValue(EnumClientBoolSetting.SHIELD_TEAM_CHAT);
			//			}
			return false;
		}
		
		/**
		 * 私聊频道发送失败
		 * @param buffer
		 * 
		 */
		private function onGetPrivateChatFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_NORMAL_CHAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_NORMAL_CHAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_NORMAL_CHAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.CHAT_NORMAL_CHAT_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.CHAT_NORMAL_CHAT_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.CHAT_NORMAL_CHAT_FAIL6 );
					break;
				case 7:
					NoticeManager.showHint( EnumHintInfo.CHAT_NORMAL_CHAT_FAIL7 );
					break;
				case 8:
					NoticeManager.showHint( EnumHintInfo.CHAT_NORMAL_CHAT_FAIL8 );
					break;
			}
		}
		
		/**
		 * 查询聊天记录失败
		 * @param buffer
		 * 
		 */
		private function onGetChatRecordFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_HISTORY_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_HISTORY_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_HISTORY_FAIL3 );
					break;
			}
		}
		
		/**
		 * 收到服务器返回的聊天记录
		 * @param buffer
		 * 
		 */
		private function onGetChatRecordBack(buff:ByteBuffer):void
		{
			var chaterID:Number = buff.readVarint64();
			var haveMore:Boolean = buff.readBoolean();
			var privateChaterVo:PrivateChaterVo = ChatWindowManager.getPrivateChatDataByUserId(chaterID);
			//			var isUserShowing:Boolean = ChatWindow.isUserShowing(chaterID);
			var chatMsgProto:ChatContentProto;
			var bytes:ByteArray;
			var race:int;
			while (buff.bytesAvailable)
			{
				var isMySpeech:Boolean = buff.readBoolean();
				var time:Number = buff.readVarint64();
				var len:int = buff.readVarint32();
				chatMsgProto = new ChatContentProto();
				bytes = new ByteArray();
				buff.readBytes(bytes, 0, len);
				chatMsgProto.mergeFrom(bytes);
				
				var chatInfo:ChatInfo = new ChatInfo();
				chatInfo.id = isMySpeech ? MainRoleManager.actorID : chaterID;
				chatInfo.vipLevel = chatMsgProto.vipLevel;
				chatInfo.speech = chatMsgProto.speech;
				//坑爹,服务端不发历史消息的昵称,要自己根据当前窗口用户名取
				//				chatInfo.name = ChatWindow.instance.curentShowNick;
				chatInfo.talkTime = time;
				chatInfo.realShowMsg = chatMsgProto.speech;
				chatInfo.realShowName = chatMsgProto.heroName;
				chatInfo.level = chatMsgProto.level;
				chatInfo.posInfo = chatMsgProto.posInfo;
				privateChaterVo.putMsg(chatInfo,true,true);
			}
			privateChaterVo.hasMoreRecord = haveMore;
			
			if(ChatWindowPanel.isShowing())
			{
				ChatWindowPanel.instance.freshRecore(chaterID,true);
			}
		}
		
		/**
		 * 组队频道发送失败
		 * @param buffer
		 * 
		 */
		private function onSendTeamFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL6 );
					break;
				case 7:
					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL7 );
					break;
			}
		}
		
		/**
		 * 组队广播
		 * @param buffer
		 * 
		 */
		private function getTeamBroadCast(buffer:ByteBuffer):void
		{
			showGetChatMessage(EnumChatChannelType.CHAT_CHANNEL_TEAM,getChatProto(buffer));
		}
		
		/**
		 * 家族聊天失败
		 *
		 * 附带varint32的错误码
		 *
		 * 1. 发送太频繁
		 * 2. 话太长
		 * 3. 格式非法. 消息后面解不出ChatMessage
		 * 4. 你没有家族
		 * 5. 你被禁言了
		 * 6. 你被天子禁言了
		 */
		private function onSendFamilyFaile(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 1:
//					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL1 );
					break;
				case 2:
//					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL2 );
					break;
				case 3:
//					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL3 );
					break;
				case 4:
//					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL4 );
					break;
				case 5:
//					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL5 );
					break;
				case 6:
//					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL6 );
					break;
				case 7:
//					NoticeManager.showHint( EnumHintInfo.CHAT_TEAM_CHAT_FAIL7 );
					break;
			}
		}
		
		/**
		 * 帮会广播
		 * @param buffer
		 * 
		 */
		private function getFamilyBroadCast(buffer:ByteBuffer):void
		{
			showGetChatMessage(EnumChatChannelType.CHAT_CHANNEL_FAMILY,getChatProto(buffer));
		}
		
		/** 解析聊天附带 chatMessage proto */
		private function getChatProto(buff:ByteBuffer):ChatContentProto
		{
			var chatMsgProto:ChatContentProto = new ChatContentProto();
			var bytes:ByteArray = new ByteArray();
			buff.readBytes(bytes);
			chatMsgProto.mergeFrom(bytes);
			return chatMsgProto;
		}
		
		private function getChatInfoByChatMessage(channelType:int,chatMsgProto:ChatContentProto):ChatInfo
		{
			var chatInfo:ChatInfo = new ChatInfo();
			chatInfo.channel = channelType;
			
			chatInfo.speech = chatMsgProto.speech;
			chatInfo.chatGoods = chatMsgProto.chatGoods;
			
			chatInfo.checkSum = chatMsgProto.checkSum;
			
			chatInfo.id = chatMsgProto.heroId.toNumber();
			chatInfo.name = chatMsgProto.heroName;
			chatInfo.countryId = chatMsgProto.country;
			chatInfo.level = chatMsgProto.level;
			
			chatInfo.posInfo = chatMsgProto.posInfo;
			
//			chatInfo.isKingGuild = chatMsgProto.isWangCityMaster;
//			chatInfo.isEmperorGuild = chatMsgProto.isHuangCityMaster;
//			chatInfo.cityMasterType = chatMsgProto.cityMasterType;
			
			chatInfo.isGM = chatMsgProto.isGm;
			chatInfo.vipLevel = chatMsgProto.vipLevel;
				
			return chatInfo;
		}
		
		
		private function getChatInfo(channelType:int,buff:ByteBuffer):ChatInfo
		{
			var chatMsgProto:ChatContentProto = getChatProto(buff);
			return getChatInfoByChatMessage(channelType,chatMsgProto);
		}
	}
}
