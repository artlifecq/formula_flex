package com.rpgGame.app.manager
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import flash.external.ExternalInterface;
	import flash.utils.Timer;
	
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 断线重连管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-07-28 上午10:30:12
	 *
	 */
	public class ReconnectManager
	{
		private static var _retryTimer : Timer;
		private static var _isHookIng : Boolean = false;

		public static function setup() : void
		{
//			SocketConnection.addCmdListener(CmdID.S2C_RECONNECTED_FAIL, onReconnectedFail);
//			SocketConnection.addCmdListener(CmdID.S2C_RECONNECT_LOGIN_SUCCESS, onReconnectedSuccess);
//			//
//			SocketConnection.addCmdListener(CmdID.S2C_AUTH_INFO, onGetAuthInfo);
			//
		}

		private static function onSocketDisconnect(data : ByteBuffer) : void
		{
			var errID : uint = data.readVarint32();
			showErrorMessage("服务器断开链接,断开原因: " + errID);
		}

		private static function showErrorMessage(msg : String) : void
		{
			GameLog.addShow(msg);
		}

		private static function onGetAuthInfo(data : ByteBuffer) : void
		{
			var len : uint = data.readShort();
			var auth : String = data.readUTFBytes(len);
			var sign : String = data.readUTFBytes(data.bytesAvailable);
			//
			//_userLoginInfo = {auth: auth, sign: sign};
		}

		public static var errorID : uint = 0;

		private static function onReconnectedFail(buffer : ByteBuffer) : void
		{
			errorID = buffer.readByte();
			GameAlert.showAlertUtil(LangAlertInfo.onReconnectedFail,onReconnectedFailClick);
		}
		
		private static function onReconnectedFailClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					onOkFunc();
					break;
			}
		}
		
		private static function onOkFunc() : void
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.call("reload")
			}
		}

		private static function onReconnectedSuccess(buffer : ByteBuffer) : void
		{
//			_retryCnt = 0;
//			errorID = 0;
//			//
//			var loginData : ByteBuffer = SocketConnection.messsageUnCompress(buffer, CmdID.S2C_RECONNECT_LOGIN_SUCCESS);
//			var userID : Number = loginData.readLong();
//			var hasUserValue : int = loginData.readByte();
//			var loginType : int = hasUserValue >>> 1; // 登陆方式，0-内部 1-web 2-微端
//			var hasHero : Boolean = (hasUserValue & 1) > 0;
//			if (hasHero)
//			{
////				LoginDataManager.parseData(loginData);
//				var heroName : String = loginData.readUTF();
//				var bytes : ByteArray = new ByteArray();
//				loginData.readBytes(bytes);
//				var heroProto : HeroProto = new HeroProto();
//				heroProto.mergeFrom(bytes);
//				//角色信息
//				HeroData.setUserLoginInfo(MainManager.actorInfo, heroProto, heroName); //暂时先只更新主角信息
//				//
//				EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
//				MapManager.changeMap(true, true);
//				//断线重连后，需要重新拉一遍挂机数据， 否则服务器不会推送挂机收益信息了
//				HeroMiscSender.reqHookRecordInfo();
//			}
		}

		private static function onSwitchCmp() : void
		{
//			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
//			updateMainActorInfo();
//			//
//			updateMainCharStatus();
		}

		private static function updateMainActorInfo() : void
		{
//			var char : SceneRole = MainManager.actor;
//			var info : HeroData = MainManager.actorInfo;
//			//更新ID和名字
//			char.id = info.id;
//			char.name = info.name;
//			char.showHeadFace(info.name, StaticValue.BLUE);
//			char.getHeadTop().setNickName(info.name);
//
//			HeadFaceManager.updateGuildName(char.headFace, info);
//			//
//			var apd : RenderParamData3D;
//			var ap : RenderUnit;
//			apd = new RenderParamData3D(RenderUnitID.MAGIC_RING_FOOT, RenderUnitType.MAGIC_RING_FOOT, ClientConfig.getAvatarEffect(ClientPathConfig.AVATAR_SELECT_BLUE));
//			ap = char.addRenderUnit(apd);
//			ap.mouseEnabled = false;
//			ap.depth = RenderUnitType.getDefaultDepth(RenderUnitType.MAGIC_RING_FOOT);
//			ap.setStatus(CharStatusType.STAND);
//			//更新人头上血条
//			char.headFace.showBarType(EnumHeadBloodType.HEAD_BLOOD_PLAYER, EnumPlayerHeadBloodColor.GREEN);
//			char.headFace.setBarLv(MainManager.actorInfo.lv);
//			char.headFace.setBar(MainManager.actorInfo.hp, MainManager.actorInfo.totalStat.life);
//			char.getHeadTop().setHp(MainManager.actorInfo.hp, MainManager.actorInfo.totalStat.life);
//			char.stateMachine.transition(RoleStateType.ACTION_STAND); //切换到“站立状态”
//			HeadFaceOffsetManager.updateCharHeadFaceOffset(char);
//			//执行主换装更新
//			AvatarManager.updateAvatar(char);
//			//更新速度
//			char.speed = MainManager.actorInfo.totalStat.moveSpeed;
//			//MoveHelper.setSpeed(char,MainManager.actorInfo.totalStat.moveSpeed);
//			Scene.scene.addSceneObj(MainManager.actor);
//			//
//			NoticeManager.notify(NoticeManager.SYSTEM_SWITCH, TextFormatUtil.getRedText("网络中断，尝试掉线重连成功！"));
//			NoticeManager.notify(NoticeManager.SYSTEM_CHAT, "网络中断，尝试掉线重连成功！", ChatChannelType.CHAT_CHANAEL_SYSTEM);
		}

		private static function updateMainCharStatus() : void
		{
		}

	}
}
