package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.TrailManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.NpcSender;
	import com.rpgGame.coreData.cfg.npc.VehiclePathCfgData;
	import com.rpgGame.coreData.info.move.TrailPathPoint;
	import com.rpgGame.coreData.lang.LangTask;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * npc消息侦听
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 下午4:50:25
	 *
	 */
	public class NpcCmdListener extends BaseBean
	{
		public function NpcCmdListener()
		{
			super();
		}

		override public function start() : void
		{
//			SocketConnection_protoBuffer.addCmdListener(NpcModuleMessages.S2C_ON_CLICK_NPC, onClickNpc);
//			SocketConnection_protoBuffer.addCmdListener(NpcModuleMessages.S2C_ON_CLICK_NPC_FAIL, onClickNpcFail);
//			SocketConnection_protoBuffer.addCmdListener(NpcModuleMessages.S2C_VEHICLE_PLAYER, onVehiclePlayer);
//			SocketConnection_protoBuffer.addCmdListener(NpcModuleMessages.S2C_VEHICLE_PLAYER_FAIL, onVehiclePlayerFail);

			finish();
		}

		/**
		 * 请求npc功能成功,解锁
		 */
		private function onClickNpc(buffer : ByteBuffer) : void
		{
			trace("onClickNpcReturnSuccess");
			NpcSender.unlockSend();
		}

		/**
		 * 请求npc失败，返回varint32错误码，解锁
		 *
		 * 1. npc没找到
		 * 2. 距离npc过远
		 * 3. npc该有该功能
		 */
		private function onClickNpcFail(buffer : ByteBuffer) : void
		{
			NpcSender.unlockSend();

			var failID : int = buffer.readVarint32();
			trace("onClickNpcFail", failID);

			switch (failID)
			{
				case 1:
					NoticeManager.showNotify(LangTask.ON_CLICK_NPC_FAIL_2);
					break;
				case 2:
					NoticeManager.showNotify(LangTask.ON_CLICK_NPC_FAIL_1);
					break;
				case 3:
					NoticeManager.showNotify(LangTask.ON_CLICK_NPC_FAIL_3);
					break;
			}
		}

		/**
		 * 场景中有英雄/怪物/宠物啥的 搭乘固定路线载具了, 包含每个节点和到达这个节点的时间
		 *
		 * varint64 移动的对象的id
		 * varint32 载具配置id
		 * varint64 飞行开始的时间
		 */
		private function onVehiclePlayer(buffer : ByteBuffer) : void
		{
//			var objId : Number = buffer.readVarint64();
//			var vehicleId : int = buffer.readVarint32();
//			var startTime : Number = buffer.readVarint64();
//			var role : SceneRole = SceneManager.getSceneObjByID(objId) as SceneRole;
//			if (role)
//			{
//				var data : VehiclePathDataProto = VehiclePathCfgData.getData(vehicleId);
//				if (data)
//				{
//					var mountRes : String = data.mountRes;
//					var mountModelId : int = data.mountModelId;
//					var paths : Vector.<TrailPathPoint> = VehiclePathCfgData.createPaths(data);
//					TrailManager.getInstance().play(role, paths, data.isClingGround, startTime, mountRes, mountModelId);
//				}
//			}
		}

		/**
		 * 搭乘固定路线载具失败，返回varint32错误码
		 *
		 * 1. 战斗中
		 * 2. 英雄当前无法乘坐
		 * 3. 已经死了
		 * 4. 被击晕/不可移动
		 * 5. 当前已经有搭乘固定路线载具
		 */
		private function onVehiclePlayerFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			switch (failID)
			{
				case 1:
					NoticeManager.showNotify(LangTask.VEHICLE_PLAYER_FAIL_1);
					break;
				case 2:
					NoticeManager.showNotify(LangTask.VEHICLE_PLAYER_FAIL_2);
					break;
				case 3:
					NoticeManager.showNotify(LangTask.VEHICLE_PLAYER_FAIL_3);
					break;
				case 4:
					NoticeManager.showNotify(LangTask.VEHICLE_PLAYER_FAIL_4);
					break;
				case 5:
					NoticeManager.showNotify(LangTask.VEHICLE_PLAYER_FAIL_5);
					break;
			}
		}
	}
}

