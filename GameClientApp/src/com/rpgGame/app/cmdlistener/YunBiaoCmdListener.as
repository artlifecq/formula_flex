package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.manager.BiaoJuManager;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.YunBiaoSender;
	import com.rpgGame.app.cmdlistener.enum.EmEvenTrackType;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.coreData.cfg.biao.BiaoCfgData;
	import com.rpgGame.coreData.lang.LangYunBiao;
	import com.rpgGame.coreData.role.BiaoCheData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import app.cmd.BiaoModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	import org.game.netCore.net.BytesUtil;
	
	/**
	 * 运镖消息监听 
	 * @author wewell@163.com
	 * 
	 */	
	public class YunBiaoCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_BIAO_STATUS_WHEN_ONLINE, onYunBiaoProtoOnlogin);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_BIAO_DESTROY_TIMES, onBiaoCheDestroyTime);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_REQUEST_PERSONAL_BIAO, onRequestYunbiaoSucceed);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_REQUEST_PERSONAL_BIAO_FAIL, onRequestYunbiaoFail);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_BIAO_STOP, onBiaoCheStop);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_BIAO_FOLLOW, onBiaoCheFollow);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_BIAO_DISAPPEAR, onBiaoCheDisappear);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_BIAO_BEEN_HURT, onBiaoCheLifeUpdate);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_BIAO_DEAD, onBiaoCheDead);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_BIAO_BROKEN, onBiaoCheBroken);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_REFRESH_BIAO, onRefreshBiaoCheSucceed);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_REFRESH_BIAO_FAIL, onRefreshBiaoCheFail);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_CHANGE_QUALITY, onBiaoCheQualityChang);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_COMPLETE_BIAO, onSubmitYunBiaoSucceed);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_COMPLETE_BIAO_FAIL, onSubmitYunBiaoFail);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_ADD_BIAO, onAddBiaoChe);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_TRANSPORT_TO_BIAO, onTransportToBiao);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_GIVE_UP_PERSONAL_BIAO, onGiveUpYunbiaoSucceed);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_GIVE_UP_PERSONAL_BIAO_FAIL, onGiveUpYunbiaoFail);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_GOT_ADD_BIAO_GOODS, onGotAddBiaoGoods);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_TRANSPORT_TO_SELF_BIAO, onTransportToSelfBiao);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_TRANSPORT_TO_SELF_BIAO_FAIL, onTransportToSelfBiaoFail);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_UP_OR_DOWN_FROM_BIAO, onUpOrDownFromBiao);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_UP_OR_DOWN_FROM_BIAO_FAIL, onUpOrDownFromBiaoFail);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_UP_OR_DOWN_FROM_BIAO_BROADCAST, onUpOrDownFromBiaoBroadcast);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_CHECK_BIAO, onCheckBiao);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_CHECK_BIAO_FAIL, onCheckBiaoFail);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_INVICINBLE_BIAO_RECOVERY_LIFE, onInvicinbleBiaoRecoveryLife);
			SocketConnection.addCmdListener(BiaoModuleMessages.S2C_MAX_QUALITY_BIAO_BROADCAST, onMaxQualityYunBiaoBroadcast);
			super.finish();
		}
		
		/**
		 * 解锁个人镖车功能：
		 * <p>
		 * FunctionType
		 * <p>
		 * ...
		 * FUNC_PERSONAL_BIAO = 24; // 个人镖车
		 * ...
		 * <p>
		 * 镖车配置数据，请参考
		 * biao_config.proto
		 * <p>
		 * 镖车客户端其他数据，请参考
		 * biao_client.proto
		 * <p>
		 * 镖车数据重置
		 * <p>
		 * BiaoModuleObjClientProto，将todayAcessPersonalBiaoTimes重置为空
		 * <p>
		 * ====================================
		 * <p>
		 * 上线的时候会给你发送你的镖车的信息，收到这条消息说明有镖车
		 * <p>
		 * varint32 场景id
		 * varint32 场景所属国家
		 * varint64 过期时间
		 * varint32 镖车品质
		 * varint32 x
		 * varint32 y
		 * <p>
		 * varint64 生命值
		 * varint64 最大生命值
		 * varint64 移动速度
		 * <p>
		 * varint32 镖车类型 即 BiaoType
		 * <p>
		 * if(镖车类型 == BiaoType.PERSONAL){
		 *      bool 镖车是否是损毁，客户端显示损毁的镖车
		 *      varint32 下一个要验镖的npc的下标, check_biao_npcs中的下标,当越界了,就是可以交镖了
		 *
		 *      while(buffer.readable()){
		 *          varint32 刷新的npc的配置id
		 *          varint32 刷新的次数
		 *      }
		 * }
		 */
		private function onYunBiaoProtoOnlogin(byte:ByteBuffer) : void
		{
			YunBiaoManager.hasBiao = true;
			var data:BiaoCheData = new BiaoCheData(RoleType.TYPE_BIAOCHE);
			data.setYunBiaoProtoOnlogin(byte);
			MainRoleManager.actorInfo.biaoCheData = data;
			YunBiaoManager.nextIndex = data.nextIndex;
			YunBiaoManager.setYunBiaoNpcRefreshCount( byte );
			EventManager.dispatchEvent( YunBiaoEvent.CHECK_ON_LOGIN_BIAO );
		}
		
		/**
		 * 镖车被摧毁的次数，上线会推送一次，后面还是会有推送，完成一次运镖，客户端重置为0
		 *
		 * varint32 镖车被摧毁的次数
		 */
		private function onBiaoCheDestroyTime(byte:ByteBuffer) : void
		{
			var count:int = byte.readVarint32();
			YunBiaoManager.brokenCount = count;
		}
		
		/**
		 * 请求运镖成功
		 * <p>
		 * varint32 新的运镖次数
		 * varint64 移动速度
		 */
		private function onRequestYunbiaoSucceed(byte:ByteBuffer) : void
		{
			var newBiaoCount:int = byte.readVarint32();
			var moveSpeed:Number = byte.readVarint64();
			YunBiaoManager.moveSpeed = moveSpeed;
			YunBiaoManager.hasBiao = true;
			YunBiaoSender.requestUpOrDownFromBiao( true );
			MainRoleManager.actorInfo.biaoTimes = newBiaoCount;
			YunBiaoManager.setBiaoRefreshCount();
			
			EventManager.dispatchEvent( YunBiaoEvent.ACCEPT_BIAO, EmEvenTrackType.YUN_BIAO );
		}
		
		/**
		 * 请求运镖失败，返回varint32错误码
		 *
		 * 1. 不在本国普通场景
		 * 2. 不在1线
		 * 3. 已经接取了
		 * 4. 没找到npc
		 * 5. 距离npc过远
		 * 6. 功能没开放
		 * 7. 服务器bug
		 * 8. 当前没次数了
		 * 9. 银两不够
		 * 10. 绑银不够
		 * 11. 物品不够
		 * 12. npc无法接取个人镖车
		 */
		private function onRequestYunbiaoFail(byte:ByteBuffer) : void 
		{
			var errID:int = byte.readByte();
			NoticeManager.showNotify( LangYunBiao[ "YUN_BIAO_CMDLISTENER_" + errID ] );
		}
		
        /**
         * 你的镖车更随了，在你视野里面
         */
        private function onBiaoCheFollow(byte:ByteBuffer) : void
        {
            YunBiaoManager.isFollowimg = true;
        }

		/**
		 * 你的镖车停止了
		 *
		 * <p>
		 * varint32 场景id
		 * varint32 所有线
		 * varint32 场景所属国家
		 * varint32 x
		 * varint32 y
		 */
		private function onBiaoCheStop(byte:ByteBuffer) : void
		{
			var data:BiaoCheData = new BiaoCheData(RoleType.TYPE_BIAOCHE);
			data.setYunBiaoStopInfo(byte);
			YunBiaoManager.isFollowimg = false;
			
//			var pos:Point = new Point( data.x, data.y );
//			YunBiaoManager.point = pos;
			EventManager.dispatchEvent( YunBiaoEvent.BIAO_STOP, data );
		}
		
		/**
		 * 你的镖车消失了(时间到了)
		 */
		private function onBiaoCheDisappear(byte:ByteBuffer) : void
		{
			MainRoleManager.actorInfo.biaoCheData = null;
			YunBiaoManager.hasBiao = false;
			YunBiaoManager.nextIndex = 0;
			EventManager.dispatchEvent( YunBiaoEvent.BIAO_DISAPPER, EmEvenTrackType.YUN_BIAO );
			AppManager.showApp( AppConstant.YUN_BIAO_TIPS, [ 1 ] );
		}
		
		/**
		 * 镖车被伤害了
		 *
		 * varint64 当前血量
		 * varint64 最大血量
		 */
		private function onBiaoCheLifeUpdate(byte:ByteBuffer) : void
		{
			var hp:int = byte.readVarint64();
			var maxLife:int = byte.readVarint64();
			
			var biaoche : RoleData = MainRoleManager.actorInfo.biaoCheData;
			if(!biaoche)return;
			biaoche.hp = hp;
			biaoche.totalStat.life = maxLife;
			CharAttributeManager.setCharHp(biaoche, hp);
			
			EventManager.dispatchEvent( YunBiaoEvent.BIAO_LIFE_UPDATE, biaoche, false );
			NoticeManager.showNotify( LangYunBiao.YUN_BIAO_HURT );
			YunBiaoManager.setBiaoHurtState( biaoche );
		}
		
		/**
		 * 镖车挂了
		 */
		private function onBiaoCheDead(byte:ByteBuffer) : void
		{
			YunBiaoManager.hasBiao = false;
			MainRoleManager.actorInfo.biaoCheData = null;
			YunBiaoManager.nextIndex = 0;
			EventManager.dispatchEvent( YunBiaoEvent.BIAO_DISAPPER, EmEvenTrackType.YUN_BIAO );
			AppManager.showApp( AppConstant.YUN_BIAO_BOTTOM_TIP, [ 0 ] );
		}
		
		/**
		 * 镖车破损了，新的镖车要刷出来了，准备好啊
		 * <p>
		 * varint64 场景id
		 * varint32 场景所属国家
		 * varint32 x
		 * varint32 y
		 * <p>
		 * varint64 当前生命值
		 * varint64 最大生命值
		 * varint64 移动速度
		 */
		private function onBiaoCheBroken(byte:ByteBuffer) : void
		{
			//保存当前上下镖车的状态
			var data:BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
			var isInBiao:Boolean = data.isInBiao;
			YunBiaoManager.isInBiao = isInBiao;
			
			MainRoleManager.actorInfo.biaoCheData = null;
			var id:Number = byte.readVarint64();
			var quality:int = byte.readVarint32();
			var x:int = byte.readVarint32();
			var y:int = byte.readVarint32();
			var curHp:Number = byte.readVarint64();
			var maxHp:Number = byte.readVarint64();
			var moveSpeed:Number = byte.readVarint64();
			YunBiaoManager.moveSpeed = moveSpeed;
			YunBiaoManager.updateMyQuality(quality);
			YunBiaoManager.biaoQuality = quality;
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_QUALITY_SUCCESS);
			AppManager.showApp( AppConstant.YUN_BIAO_TIPS, [ 0 ] );
		}
		
		/**
		 * 刷新成功
		 *
		 * varint32 刷新的npcId，客户端标记该npc被刷新的次数+1
		 * varint64 下次刷新时间
		 */
		private function onRefreshBiaoCheSucceed(byte:ByteBuffer) : void
		{
			var npcId:Number = byte.readVarint32();
			var nextTime:int = byte.readVarint64();
			YunBiaoManager.refreshBiaoNextTime = nextTime;
			YunBiaoManager.updateBiaoRefreshCount(npcId);
			EventManager.dispatchEvent(YunBiaoEvent.REFRESH_YUN_BIAO_SUCCESS);
//			YunBiaoManager.yunBiaoNextTime( nextTime );
		}
		
		/**
		 * 刷新失败
		 *
		 * 1. 不在本国普通场景
		 * 2. npc没找到
		 * 3. 玩家距离npc过远
		 * 4. 没有镖车
		 * 5. npc不可以刷新镖车
		 * 6. 该npc刷新次数已经很多了
		 * 7. 服务器bug
		 * 8. 镖车距离npc过远
		 */
		private function onRefreshBiaoCheFail(byte:ByteBuffer) : void
		{
			var errID:int = byte.readByte();
			if( errID != 5 )
				NoticeManager.showNotify( LangYunBiao[ "YUN_BIAO_REFRESH_BIAO_CHE_FAIL_" + errID ] );
		}
		
		/**
		 * 品质变更了，客户端收到该消息，变更场景中对象的外观
		 *
		 * varint64 场景中的id
		 * varint32 品质
		 */
		private function onBiaoCheQualityChang(byte:ByteBuffer) : void
		{
			var id:Number = byte.readVarint64();
			var quality:int = byte.readVarint32();
			YunBiaoManager.yunBiaoSucceed( quality, id );
		}
		
		/**
		 * 完成运镖成功
		 *
		 * 不带任何其他参数
		 */
		private function onSubmitYunBiaoSucceed(byte:ByteBuffer) : void
		{
			YunBiaoManager.hasBiao = false;
			YunBiaoManager.nextIndex = 0;
			YunBiaoManager.brokenCount = 0;
			EventManager.dispatchEvent( YunBiaoEvent.COMPLETED_BIAO, EmEvenTrackType.YUN_BIAO );
		}
		
		/**
		 * 完成运镖失败，返回varint32错误码
		 * <p>
		 * 1. 不在本国普通场景
		 * 2. npc没找到
		 * 3. 玩家距离npc过远
		 * 4. 没有镖车
		 * 5. 镖车距离npc过远
		 * 6. 不能托运破损的镖车
		 * 7. 不是王帮成员不可以托运
		 * 8. 每日托运次数达到了上限了
		 * 9. 还没有验完所有镖
		 */
		private function onSubmitYunBiaoFail(byte:ByteBuffer) : void
		{
			var errID:int = byte.readByte();
			NoticeManager.showNotify( LangYunBiao[ "YUN_BIAO_SUBMIT_YUN_BIAO_FAIL_" + errID ] );
		}
		
		/**
		 * 视野中添加一台镖车
		 * <p>
		 * varint64 镖车id
		 * utf 镖车名字
		 * varint32 等级
		 * varint32 镖车品质
		 * varint64 主人id
		 * utf 主人名字
		 * bool 是否是无敌镖车
		 * bool 是否破损
		 * bool 是否是国运期间接的镖车
		 * varint32 接受时花费了多少数值型的钱,用于计算投保时候的显示
		 * bool 是否投保
		 * <p>
		 * 后面数据是个通用方法
		 * varint32 x点
		 * varint32 y点
		 * varint64 当前生命值
		 * varint64 最大生命值
		 * varint64 当前魔法值
		 * varint64 最大魔法值
		 * <p>
		 * while(buffer.readable()){
		 * stateID =  byteArray.readVarInt32() // 状态的id, 去config.proto中的状态大全里找
		 * currentStackCount = byteArray.readVarInt32() // 这个状态的层数
		 * disappearTime = byteArray.readVarInt64() // 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
		 * }
		 */
		private function onAddBiaoChe(byte:ByteBuffer) : void
		{
			var biaoId:Number = byte.readVarint64();//镖车id
			var name:String = byte.readUTF();//镖车名字
			var level:int = byte.readVarint32();//等级
			var quality:int = byte.readVarint32();//镖车品质
			var ownerID:Number = byte.readVarint64();//主人id
			var ownerName:String = byte.readUTF();//主人名字
			var isInvivcibleBiao:Boolean = byte.readBoolean();//是否是无敌镖车
			var isBroken:Boolean = byte.readBoolean();//是否破损
			var isGuoInTime:Boolean = byte.readBoolean();//是否是国运期间接的镖车
			var useSilver:int = byte.readVarint32();//接受时花费了多少数值型的钱,用于计算投保时候的显示
			var isTouBao:Boolean = byte.readBoolean();//是否投保
			var data:BiaoCheData;
			
			var selfBiaoData:BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
			var selfId:Number = MainRoleManager.actorID;
			if( selfBiaoData != null && ownerID == selfId )
			{
				//自己的镖车数据
				selfBiaoData.id = biaoId;
				selfBiaoData.name = name;
				selfBiaoData.level = level;
				selfBiaoData.quality = quality;
				selfBiaoData.ownerID = ownerID;
				selfBiaoData.ownerName = ownerName;
				selfBiaoData.isBroken = isBroken;
				selfBiaoData.isInvivcibleBiao = isInvivcibleBiao;
				selfBiaoData.isGuoInTime = isGuoInTime;
				selfBiaoData.useSilver = useSilver;
				selfBiaoData.isTouBao = isTouBao;
				RoleData.readGeneric( selfBiaoData, byte );
				SceneRoleManager.getInstance().createBiaoChe(selfBiaoData);
				
				data = selfBiaoData;
				MainRoleManager.actorInfo.biaoCheData = data;
				YunBiaoManager.hasBiao = true;
			}
			else
			{
				//别人的镖车数据
				data = new BiaoCheData(RoleType.TYPE_BIAOCHE);
				data.id = biaoId;
				data.name = name;
				data.level = level;
				data.quality = quality;
				data.ownerID = ownerID;
				data.ownerName = ownerName;
				data.isInvivcibleBiao = isInvivcibleBiao;
				data.isBroken = isBroken;
				data.isGuoInTime = isGuoInTime;
				data.useSilver = useSilver;
				data.isTouBao = isTouBao;
				RoleData.readGeneric( data, byte );
				SceneRoleManager.getInstance().createBiaoChe(data);
				
				if( selfBiaoData == null && ownerID == selfId )//说明自己刚接的镖车
				{
					data.totalStat.moveSpeed = YunBiaoManager.moveSpeed;
					MainRoleManager.actorInfo.biaoCheData = data;
				}
				else
				{
					YunBiaoManager.setOtherBiaoCheData(data);
				}
			}
			//场景角色的镖车数据
			var sceneRole:SceneRole = SceneManager.getSceneObjByID( data.ownerID ) as SceneRole;
			if( sceneRole != null )
			{
				var heroData:HeroData = sceneRole.data as HeroData;
				if( heroData != null )
				{
					heroData.biaoCheData = data;
					if( data.isBroken && YunBiaoManager.isInBiao )
						heroData.biaoCheData.isInBiao = YunBiaoManager.isInBiao
					else
						heroData.biaoCheData.isInBiao = heroData.isInBiao;
					YunBiaoManager.setCamouflageEntity( sceneRole, true, heroData.isInBiao );
				}
			}
			if(data.isTouBao)
				BiaoJuManager.onScenetHaveTouBao(data.id);
			EventManager.dispatchEvent( YunBiaoEvent.ADD_BIAO );
		}
		
		/**
		 * 传送到镖车
		 */
		private function onTransportToBiao(byte:ByteBuffer):void
		{
			trace( "传送到镖车" );
		}
		
		/**
		 * 放弃运镖成功
		 */
		private function onGiveUpYunbiaoSucceed(byte:ByteBuffer) : void
		{
			YunBiaoManager.hasBiao = false;
			YunBiaoManager.nextIndex = 0;
//			YunBiaoManager.onGiveUpYunBiaoSucceed();
		}
		
		/**
		 * 放弃失败，返回varint32错误码
		 *
		 * 1. 没有镖车
		 */
		private function onGiveUpYunbiaoFail(byte:ByteBuffer) : void
		{
			var err:int = byte.readByte();
			switch (err)
			{
				case 1:
					NoticeManager.showNotify( LangYunBiao.YUN_BIAO_CMDLISTENER_13 );
					break;
			}
		}
		
		/**
		 * 获得增镖令
		 */
		private function onGotAddBiaoGoods(byte:ByteBuffer):void
		{
			
		}
		
		/**
		 * 传送成功
		 */	
		private function onTransportToSelfBiao(byte:ByteBuffer):void
		{
			trace( "传送成功" );
		}
		
		/**
		 * 传送失败，返回varint32错误码
		 */
		private function onTransportToSelfBiaoFail(byte:ByteBuffer):void
		{
			trace( "传送失败" );
		}
		
		/**
		 * 上下镖车成功
		 *
		 * bool true(上镖车)/false(下镖车)
		 */ 
		private function onUpOrDownFromBiao(byte:ByteBuffer):void
		{
			var isUpOrDown:Boolean = byte.readBoolean();
			YunBiaoManager.biaoSceneId = MainRoleManager.actorInfo.mapID;
			
			var biaoche:BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
			if( biaoche )
			{
				biaoche.isInBiao = isUpOrDown;
				biaoche.sceneId = MainRoleManager.actorInfo.mapID;
				biaoche.sceneSequence = MainRoleManager.actorInfo.sceneSequence;
				
				biaoche.x = MainRoleManager.actor.position.x;
				biaoche.y = MainRoleManager.actor.position.z;
				EventManager.dispatchEvent( YunBiaoEvent.BIAO_SCENE_POINT, biaoche );
			}
		}
		
		/**
		 * 上下镖车失败,返回varint32错误码
		 *
		 * 1.挂了无法上下车
		 * 2.没有在镖车上面,无法下车
		 * 3.已经在镖车上面,无法上车
		 * 4.当前没有镖车
		 * 5.镖车已经死了
		 * 6.距离镖车过远
		 * 7.当前状态无法上镖车
		 * 8.距离下车地点过远
		 */
		private function onUpOrDownFromBiaoFail(byte:ByteBuffer):void
		{
			var errID:int = byte.readByte();
			NoticeManager.showNotify( LangYunBiao[ "YUN_BIAO_UP_ORDOWN_FROM_BIAO_FAIL_" + errID ] );
		}
		
		/**
		 * 上下镖车广播
		 *
		 * varint64 玩家id
		 * bool true(上镖车)/false(下镖车)
		 * if(下车){
		 *      varint32 x
		 *      varint32 y
		 * }
		 */
		private function onUpOrDownFromBiaoBroadcast(byte:ByteBuffer):void
		{
			var id:Number = byte.readVarint64();
			var isInBiao:Boolean = byte.readBoolean();
			var sceneRole:SceneRole = SceneManager.getSceneObjByID( id ) as SceneRole;
			if( sceneRole != null )
			{
				var heroData:HeroData = sceneRole.data as HeroData;
				if( heroData != null )
				{
					heroData.isInBiao = isInBiao;
					YunBiaoManager.setCamouflageEntity( sceneRole, true, isInBiao );
					
					//镖车往前走的时候，点击下镖车，镖车停下来了，人也跟着停下来
					sceneRole.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
					if (sceneRole.stateMachine.isPrewarWaiting)
						sceneRole.stateMachine.transition(RoleStateType.ACTION_PREWAR);
					else
						sceneRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
					
					if( !isInBiao )
					{
						//同步下车的位置
						var posx:int = byte.readVarint32();
						var posy:int = byte.readVarint32();
						sceneRole.setGroundXY( posx, posy );	
					}
				}
			}
		}
		
		/**
		 * 验镖成功
		 * 
		 * varint32 下一个需要验镖的npc的下标
		 */
		private function onCheckBiao(byte:ByteBuffer):void
		{
			var nextIndex:int = byte.readVarint32();
			YunBiaoManager.nextIndex = nextIndex;
			EventManager.dispatchEvent( YunBiaoEvent.BIAO_UPDATE_BIAO_STATE );
			
			var checkBiaoArr:Array = BiaoCfgData.miscData.check_biao_npcs;
			if( checkBiaoArr != null && checkBiaoArr.length > 0 )
			{
				if( nextIndex >= checkBiaoArr.length )
					NoticeManager.showNotify( LangYunBiao.YUN_BIAO_CHECK_BIAO_2 );
				else
					NoticeManager.showNotify( LangYunBiao.YUN_BIAO_CHECK_BIAO_1 );
			}
		}
		
		/**
		 * 验镖失败,返回varint32错误码
		 *
		 * 1. 当前没有镖车,无法验镖
		 * 2. 验镖，镖车距离npc过远
		 * 3. 当前不需要验镖
		 * 4. 验镖必须一步一步来
		 */
		private function onCheckBiaoFail(byte:ByteBuffer):void
		{
			var errID:int = byte.readByte();
			NoticeManager.showNotify( LangYunBiao[ "YUN_BIAO_CHECK_BIAO_FAIL_" + errID ] );
		}
		
		/**
		 * 无敌镖车回血了
		 *
		 * varint64 无敌镖车id
		 */
		private function onInvicinbleBiaoRecoveryLife(byte:ByteBuffer):void
		{
			var InvicinbleBiaoId:Number = byte.readVarint64();
			var biaoSceneRole:SceneRole = SceneManager.getSceneObjByID(InvicinbleBiaoId) as SceneRole;
			if( !biaoSceneRole )
				return;
			
			var biaoCheData:BiaoCheData = biaoSceneRole.data as BiaoCheData;
			if( !biaoCheData )
				return;
		}
		
		/**
		 * 弄出了个最高品质的镖车
		 *
		 * varint32 品质
		 * varint32 玩家所属国家
		 * bytes 玩家名字
		 */
		private function onMaxQualityYunBiaoBroadcast(buffer : ByteBuffer):void
		{
			var quality:int = buffer.readVarint32();
			var countryId:int = buffer.readVarint32();
			var name:String = BytesUtil.readRemainUTF( buffer );
			
			var countryName : String = CountryManager.getCountryName(countryId);
			var qualityName:String = TouJingManager.getJingShuColor(quality);
			
			if (quality >= EmQuality.QUALITY_ORANGE && quality != EmQuality.QUALITY_GRAY)
				NoticeManager.showNotify( LangYunBiao.YUN_BIAO_MAX_QUALITY_JING_SHU_BROADCAST, countryName, name, qualityName);
		}
	}
}
