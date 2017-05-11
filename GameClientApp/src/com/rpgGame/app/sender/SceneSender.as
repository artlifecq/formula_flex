package com.rpgGame.app.sender
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.scene.FirstEnterSceneManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.type.CostItemType;
	import com.rpgGame.netData.backpack.message.ReqTakeUpMessage;
	import com.rpgGame.netData.login.message.ReqLoadFinishMessage;
	import com.rpgGame.netData.map.message.ReqChangeMapByMoveMessage;
	import com.rpgGame.netData.map.message.ReqChangeMapCommonMessage;
	import com.rpgGame.netData.map.message.ReqLoadFinishForChangeMapMessage;
	import com.rpgGame.netData.map.message.ReqNewRunningMessage;
	import com.rpgGame.netData.map.message.ReqPlayerStopMessage;
	import com.rpgGame.netData.map.message.ReqSmallFlyShoesMessage;
	import com.rpgGame.netData.player.message.ReqLocalReviveMessage;
	import com.rpgGame.netData.player.message.ReqReviveMessage;
	import com.rpgGame.netData.structs.Position;
	import com.rpgGame.netData.zone.message.ReqZoneCommonEnterMessage;
	import com.rpgGame.netData.zone.message.ReqZoneCommonQuitMessage;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import app.cmd.SceneModuleMessages;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;

	/**
	 * 场景消息
	 *
	 */
	public class SceneSender extends BaseSender
	{
		public static function SendLoadFinishMessage():void
		{
			var msg:Message;
			if(!FirstEnterSceneManager.isEnterScene)
			{
				msg = new ReqLoadFinishMessage();
			}
			else
			{
				msg = new ReqLoadFinishForChangeMapMessage();
				(msg as ReqLoadFinishForChangeMapMessage).width = SceneManager.scene.sceneConfig.width;
				(msg as ReqLoadFinishForChangeMapMessage).height = SceneManager.scene.sceneConfig.height;
			}
			SocketConnection.send(msg);
		}
		
		public static function SendNewRunningMessage(path : Vector.<Vector3D>):void
		{
			GameLog.add("send SendNewRunningMessage :" + path.join(","));
			var msg:ReqNewRunningMessage = new ReqNewRunningMessage();
			
			var vec:Vector.<Position> = new Vector.<Position>();
			var len:int = path.length;
			
			var pos3D : Vector3D;
			for (var i:int = 0; i < len; ++i)
			{
				pos3D = path[i];
				
				vec.push(Position.FromPoint(new Point(pos3D.x,pos3D.z)));
			}
			
			msg.positions = vec;
			SocketConnection.send(msg);
		}
		
		public static function SendPlayerStopMessage():void
		{
			var msg:ReqPlayerStopMessage = new ReqPlayerStopMessage();
			SocketConnection.send(msg);
		}
		
		public static function SendChangeViewRange(width : int,height : int) : void
		{
			
		}
		
		public static function transportChgMap(transId : uint):void
		{
			if (ReqLockUtil.isReqLocked(101206))
				return;
			ReqLockUtil.lockReq(101206, 3000);
			
			//切换场景
			GameLog.addShow("3_9：准备换场景  传送门ID:\t" +transId);
			var msg:ReqChangeMapByMoveMessage = new ReqChangeMapByMoveMessage();
			msg.line = 0;
			msg.tranId = transId;
			SocketConnection.send(msg);
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
			/*if (PathFinderUtil.isSolid(SceneManager.getDistrict(), new Vector3D(posx, posy, 0)))
			{
				NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL12);
				return;
			}*/
			
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
			
			var msg:ReqSmallFlyShoesMessage = new ReqSmallFlyShoesMessage();
			msg.autoGold = 0;
			msg.mapLine = 1;
			msg.mapModel = sceneID;
			msg.position = new Position();
			msg.position.x = posx;
			msg.position.y = posy;
			SocketConnection.send(msg);
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
		public static function requestLeaveDungeon(mapid:int=-1, pos:Point = null, params:int = 0) : void
		{
			if (ReqLockUtil.isReqLocked(101218))
				return;
			ReqLockUtil.lockReq(101218, 5 * 1000);
			
			var msg:ReqChangeMapCommonMessage = new ReqChangeMapCommonMessage();
			msg.mapModel = mapid;
			if (pos == null)
			{
				msg.position = new Position();
			}
			else
			{
				msg.position = Position.FromGridPoint(pos);
			}
			
			msg.params = params;
			
			SocketConnection.send(msg);
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
//			_bytes.clear();
//			_bytes.writeVarint32(jumpAction);
			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_HERO_JUMP, _bytes);
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////////////
		//
		//  以下代码为参照代码，是深圳那边后台对应的
		//
		///////////////////////////////////////////////////////////////////////////////////////////////////////////
//		public static function transportChgMap(transId : uint) : void
//		{
//			if (ReqLockUtil.isReqLocked(SceneModuleMessages.C2S_SCENE_REQUEST_TRANSPORT))
//				return;
//			ReqLockUtil.lockReq(SceneModuleMessages.C2S_SCENE_REQUEST_TRANSPORT, 5000);
//
//			//切换场景
//			GameLog.add("3_9：准备换场景");
//			var by : ByteBuffer = new ByteBuffer();
//			by.writeVarint32(transId);
//			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_REQUEST_TRANSPORT, by);
//		}

		/**
		 * 客户端加载完场景数据，可进入场景时发送，发送完等待服务器消息
		 * @param viewRange
		 */
//		public static function sceneLoaded(viewRange : int) : void
//		{
//			_bytes.clear();
//			_bytes.writeVarint32(viewRange);
//			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_LOADED, _bytes);
//		}

		/**
		 * 改变可视范围大小. 只有已经进入场景才能发送(每次场景加载完都会附带个视野范围的)
		 */
//		public static function sceneChangeViewRange(viewRange : int) : void
//		{
//			_bytes.clear();
//			_bytes.writeVarint32(viewRange);
//			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_CHANGE_VIEW_RANGE, _bytes);
//		}

		/**
		 * 角色移动
		 * @param path
		 *
		 */
//		public static function mainCharWalk(path : Vector.<Vector3D>) : void
//		{
//			var len : uint = path.length;
//
//			_bytes.clear();
//			_bytes.writeVarint32(len); //总共的节点数
//
//			var pos3D : Vector3D;
//			for (var i : int = 0; i < len; i++)
//			{
//				pos3D = path[i];
//				_bytes.writeVarint32(pos3D.x);
//				_bytes.writeVarint32(pos3D.z);
//			}
//			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_HERO_MOVE, _bytes);
//		}
//
//		public static function cancelWalk() : void
//		{
//			_bytes.clear();
//			send(SceneModuleMessages.C2S_SCENE_STOP_MOVE, _bytes);
//		}

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
//		public static function sceneHeroJump(jumpAction : int) : void
//		{
//			_bytes.clear();
//			_bytes.writeVarint32(jumpAction);
//			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_SCENE_HERO_JUMP, _bytes);
//		}

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
//		public static function requestPickUpGoods(sceneGoodsId : Number, index : int) : void
//		{
//			if (ReqLockUtil.isReqLocked(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS))
//				return;
//			ReqLockUtil.lockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS, 5 * 1000);
//
//			_bytes.clear();
//			_bytes.writeVarint64(sceneGoodsId);
//			_bytes.writeVarint32(index);
//			send(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS, _bytes);
//		}

		/**
		 * 场景中可以拾取的物品的数据
		 *
		 * varint64 物品id
		 */
		public static function requestPickUpGoodsInfo(sceneGoodsId : long) : void
		{
			var msg:ReqTakeUpMessage=new ReqTakeUpMessage();
			msg.goodsId=sceneGoodsId;
			SocketConnection.send(msg);
		}
		
		
		/**
		 *返回复活点复活 
		 * 
		 */
		public static function reqReviveRole():void
		{
			var msg:ReqReviveMessage=new ReqReviveMessage();
			SocketConnection.send(msg);
		}	
		
		/**
		 *原地复活 
		 * @param itemid
		 * @param type
		 * 
		 */
		public static function reqReviveLocalRole(itemid:int,type:int):void
		{
			var msg:ReqLocalReviveMessage=new ReqLocalReviveMessage();
			msg.itemmodelid=itemid;
			msg.type=type;
			SocketConnection.send(msg);
		}
	}
}
