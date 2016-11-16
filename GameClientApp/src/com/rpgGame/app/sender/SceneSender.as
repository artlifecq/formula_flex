package com.rpgGame.app.sender
{
	import com.game.engine3D.utils.PathFinderUtil;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.type.CostItemType;

	import flash.geom.Vector3D;

	import app.cmd.SceneModuleMessages;
	import app.cmd.SimpleDungeonModuleMessages;

	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 * 场景消息
	 *
	 */
	public class SceneSender extends BaseSender
	{
		public static function transportChgMap(transId : uint) : void
		{
			if (ReqLockUtil.isReqLocked(SceneModuleMessages.C2S_SCENE_REQUEST_TRANSPORT))
				return;
			ReqLockUtil.lockReq(SceneModuleMessages.C2S_SCENE_REQUEST_TRANSPORT, 5000);

			//切换场景
			GameLog.add("3_9：准备换场景");
			var by : ByteBuffer = new ByteBuffer();
			by.writeVarint32(transId);
			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_REQUEST_TRANSPORT, by);
		}

		/**
		 * 客户端加载完场景数据，可进入场景时发送，发送完等待服务器消息
		 * @param viewRange
		 */
		public static function sceneLoaded(viewRange : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(viewRange);
			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_LOADED, _bytes);
		}

		/**
		 * 改变可视范围大小. 只有已经进入场景才能发送(每次场景加载完都会附带个视野范围的)
		 */
		public static function sceneChangeViewRange(viewRange : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(viewRange);
			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_CHANGE_VIEW_RANGE, _bytes);
		}

		/**
		 * 角色移动
		 * @param path
		 *
		 */
		public static function mainCharWalk(path : Vector.<Vector3D>) : void
		{
			var len : uint = path.length;

			_bytes.clear();
			_bytes.writeVarint32(len); //总共的节点数

			var pos3D : Vector3D;
			for (var i : int = 0; i < len; i++)
			{
				pos3D = path[i];
				_bytes.writeVarint32(pos3D.x);
				_bytes.writeVarint32(pos3D.z);
			}
			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_HERO_MOVE, _bytes);
		}

		public static function cancelWalk() : void
		{
			_bytes.clear();
			send(SceneModuleMessages.C2S_SCENE_STOP_MOVE, _bytes);
		}

		/**
		 * 地图传送
		 * varint32 场景ID
		 * varint32 X坐标
		 * varint32 Y坐标
		 * varint32 目标点范围
		 * if(非Vip或VIP等级不足){
		 *      要附带数据具体参考[这里]({% post_url 2014-11-08-物品消耗 %})
		 * }
		 *
		 * 发送此消息客户端需要预先判断VIP等级是否足够，是否在普通场景（副本中不允许传送）
		 *
		 * 成功后会收到切场景的消息
		 */
		public static function sceneMapTransport(sceneID : int, posx : int, posy : int, randomRan : int = 25, isVipTrans : Boolean = false, upgradeItemListVo : UpgradeItemListVo = null) : void
		{
			if (PathFinderUtil.isSolid(SceneManager.getDistrict(), new Vector3D(posx, 0, posy)))
			{
				NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL12);
				return;
			}

			_bytes.clear();
			_bytes.writeVarint32(sceneID);
			_bytes.writeVarint32(posx);
			_bytes.writeVarint32(posy);
			_bytes.writeVarint32(randomRan);
			if (!isVipTrans)
			{
				if (upgradeItemListVo == null || !upgradeItemListVo.isItemEnough)
				{
					_bytes.writeBoolean(false);
					_bytes.writeVarint32(CostItemType.USE_YUANBAO);
				}
				else
				{
					_bytes.writeBytes(upgradeItemListVo.getByte());
				}
			}

			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_MAP_TRANSPORT, _bytes);
		}

		/**
		 * 客户端请求跳跃. 不管是一段跳还是二段跳, 都只发跳跃的目标点(鼠标所指的点, 不管当前点是否可走以及距离,
		 * 这些全服务器根据当时服务器上角色的坐标来计算)
		 *
		 * 死亡/晕眩/地图不准跳跃/体力不足/冷却中/正在施法时, 不发送
		 *
		 * 若当前正在移动, 发送跳跃请求后并不打断移动
		 *
		 * varint32 跳跃动作
		 */
		public static function sceneHeroJump(jumpAction : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(jumpAction);
			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_HERO_JUMP, _bytes);
		}

		/**
		 * 在副本中要求离开副本, 回到进入副本前的场景/坐标.
		 *
		 * 必须在副本中才能请求, 请求后必须等返回
		 *
		 * 此消息不只是在剧情副本中才能用, 任何副本都用这条来主动离开副本
		 *
		 * 死亡时候发送也可以, 会满血回到进入副本前的位置
		 *
		 * 没有附带信息
		 */
		public static function requestLeaveDungeon() : void
		{
			if (ReqLockUtil.isReqLocked(SimpleDungeonModuleMessages.C2S_LEAVE_DUNGEON))
				return;
			ReqLockUtil.lockReq(SimpleDungeonModuleMessages.C2S_LEAVE_DUNGEON, 5 * 1000);

			_bytes.clear();
			send(SimpleDungeonModuleMessages.C2S_LEAVE_DUNGEON, _bytes);
		}

		/**
		 * 拾取地上物品，客户端判定当前英雄是否可捡（拾取保护时间），不能捡不要发消息，
		 * 可以拾取时发送C2S_SCENE_PICK_UP_GOODS，附带拾取物品ID
		 *
		 * varint64 箱子在场景中的id
		 * varint32 箱子里面第几个
		 *
		 * 成功返回S2C_SCENE_PICK_UP_GOODS
		 * 失败返回S2C_SCENE_PICK_UP_GOODS_FAIL
		 */
		public static function requestPickUpGoods(sceneGoodsId : Number, index : int) : void
		{
			if (ReqLockUtil.isReqLocked(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS))
				return;
			ReqLockUtil.lockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS, 5 * 1000);

			_bytes.clear();
			_bytes.writeVarint64(sceneGoodsId);
			_bytes.writeVarint32(index);
			send(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS, _bytes);
		}

		/**
		 * 场景中可以拾取的物品的数据
		 *
		 * varint64 物品id
		 */
		public static function requestPickUpGoodsInfo(sceneGoodsId : Number) : void
		{
			if (ReqLockUtil.isReqLocked(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS_INFO))
				return;
			ReqLockUtil.lockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS_INFO, 5 * 1000);

			_bytes.clear();
			_bytes.writeVarint64(sceneGoodsId);
			send(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS_INFO, _bytes);
		}
	}
}
