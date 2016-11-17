package com.rpgGame.app.cmdlistener.task
{
	import com.rpgGame.app.cmdlistener.enum.EmEvenTrackType;
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.coreData.info.roulette.RouletteInfo;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.task.daily.MiXinTaskData;
	import com.rpgGame.coreData.lang.LangJiMaoXin;
	import com.rpgGame.coreData.utils.ProtoParseToInfo;
	
	import flash.utils.ByteArray;
	
	import app.cmd.CountryModuleMessages;
	import app.cmd.TaskModuleMessages;
	import app.message.PrizeProto;
	import app.message.RoulettePrizesProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	import org.game.netCore.net_protobuff.BytesUtil;

	/**
	 * 鸡毛信事件侦听器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MiXinCmdListener extends BaseBean
	{
		public function MiXinCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_ACCEPT_MIXIN_FAIL, onRecAcceptMixinFail );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_ACCEPT_MIXIN_SUCCEED, onRecAcceptMixinSucceed );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_GIVE_UP_MI_XIN, onGiveupMixinSucceed );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_GIVE_UP_MI_XIN_FAIL, onGiveupMixinFail );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_REFRESH_MIXIN_FAIL, onRecRefreshMixinFail );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_REFRESH_MIXIN_SUCCEED, onRecRefreshMixinSucceed );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_COMPLETE_MIXIN_FAIL, onRecCompleteMixinFail );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_COMPLETE_MIXIN_SUCCEED, onCompleteMixinSucceed );
			
			//开启刺探
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_START_MI_XIN, onStartMiXin );
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_START_MI_XIN_FAIL, onStartMiXinFail );
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_START_MI_XIN_BROADCAST, onMiXinStart );
			
			//开启抽奖
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_ROULETTE, onRoulette );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_COLLECT_ROULETTE_PRIZE, onCollectRoulettePrize );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_COLLECT_ROULETTE_PRIZE_FAIL, onCollectRoulettePrizeFail );
			
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_MAX_QUALITY_MIXIN_BROADCAST, onMaxQualityMiXinBroadcast );
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_MIXIN_STATUS, onRecMiXinStatus);
			
			finish();
		}
		
		/**
		 * 开启国家刺探广播
		 * <p>
		 * varint32 哪个国家
		 * varint64 刺探结束时间
		 * <p>
		 * if(buffer.readable()){
		 * varint32 召唤id，检测条件满足，发送：C2S_COUNTRY_OFFICER_SUMMON
		 * varint64 召唤结束时间
		 * }
		 */
		private function onMiXinStart(buffer:ByteBuffer):void
		{
			var countryId:int = buffer.readVarint32();
			var endTime:int = buffer.readVarint64();
			if( buffer.bytesAvailable )
			{
				var summonId:int = buffer.readVarint32();
				var summonEndTime:int = buffer.readVarint64();
			}
		}
		
		/**
		 * 大转盘
		 *
		 * varint32 奖励id
		 * varint32 基础经验
		 * varint32 奖励下标
		 *
		 * varint32 后面数据长度
		 * bytes 解析成 RoulettePrizesProto
		 *
		 * bytes 解析成PrizeProto
		 */
		private function onRoulette(buffer:ByteBuffer):void
		{
			var id:int = buffer.readVarint32();
			var normalExp:int = buffer.readVarint32();
			var index:int = buffer.readVarint32();
			var len:int = buffer.readVarint32();
			
			//RoulettePrizes
			var prizesProto:RoulettePrizesProto = new RoulettePrizesProto();
			var bytes:ByteArray = new ByteArray();
			buffer.readBytes(bytes, 0, len);
			prizesProto.mergeFrom(bytes);
			
			//PrizeProto
			var prize:PrizeProto = new PrizeProto();
			bytes = new ByteArray();
			buffer.readBytes(bytes);
			prize.mergeFrom(bytes);
			var prizeInfo:PrizeInfo = ProtoParseToInfo.decodePrizeProto(prize);
			
			var info:RouletteInfo = MiXinManager.rouletteInfo;
			if(info == null)
			{
				 info = new RouletteInfo();
			}
			
			info.id = id;
			info.index = index;
			info.normalExp = normalExp;
			info.setRoulette(prizesProto);
			info.prizeInfo = prizeInfo;
			MiXinManager.rouletteInfo = info;
				
			//策划说鸡毛信任务暂时去掉轮盘
//			AppManager.showAppNoHide(AppConstant.ROULETTE_PANEL);
		}
		
		/**
		 * 领取奖励成功
		 *
		 * varint32 奖励id
		 *
		 * 删除密信转盘
		 */
		private function onCollectRoulettePrize(buffer:ByteBuffer):void
		{
			var id:int = buffer.readVarint32();
		}
		
		/**
		 * 领取转盘奖励失败，返回varint32错误码
		 *
		 * 1. 没有奖励可以领取
		 */
		private function onCollectRoulettePrizeFail(buffer:ByteBuffer):void
		{
			NoticeManager.showNotify( LangJiMaoXin.MI_XIN_COLLECT_ROULETTE_PRIZE_FAIL );
		}
		
		/**
		 * 接受密信失败，附带varint32错误码：
		 *
		 * 1.距离NPC太远
		 * 2.密信功能没有开启
		 * 3.当前已经有密信任务了，无法再接受
		 * 4.次数不够，无法接受密信任务
		 */
		private function onRecAcceptMixinFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangJiMaoXin[ "MI_XIN_ACCEPT_FAIL_" + errID ] );
		}
		
		/**
		 * 接受密信成功，接受密信次数+1
		 *
		 * varint32 接受密信的等级
		 * bool 是不是在密信活动中接的
		 */
		private function onRecAcceptMixinSucceed(buffer:ByteBuffer):void
		{
			var level:int = buffer.readVarint32();
			var isInMiXinActivityTime:Boolean = buffer.readBoolean();
			
			if(MiXinManager.mixinTask == null)
			{
				MiXinManager.mixinTask = new MiXinTaskData();
			}
			
			MiXinManager.mixinTask.level = level;
			MiXinManager.mixinTask.isInMiXinActivityTime = isInMiXinActivityTime;
			MiXinManager.mixinTask.acceptTimes ++;
			
			NoticeManager.showNotify( LangJiMaoXin.MI_XIN_ACCEPT_MI_XIN_SUCCEED );
			EventManager.dispatchEvent( TouJingEvent.MIXIN_ACCEPT_TASK, EmEvenTrackType.SECRET_MESSAGE );
		}
		
//		/**
//		 * 交密信成功
//		 * 
//		 * varint64 下次能够刷新密信的时间
//		 */
//		private function onRecSubmitMixin(buffer:ByteBuffer):void
//		{
//			var nextRefreshTime:Number = buffer.readVarint64();
//			MiXinManager.mixinTask.nextRandomMiXinTime = nextRefreshTime;
//			MiXinManager.mixinTask.isSubmit = true;
//			NoticeManager.showNotify( LangJiMaoXin.MI_XIN_SUBMIT_MI_XIN_SUCCEED );
//			MiXinManager.gotoMiXin();
//			EventManager.dispatchEvent( TaskEvent.MIXIN_SUBMIT_SUCCES );
//		}
		
		/**
		 * 放弃密信任务成功
		 * 
		 * 将已经接取的密信任务次数-1，-1后，该值必须>=0
		 */	
		private function onGiveupMixinSucceed(buffer:ByteBuffer):void
		{
			if(MiXinManager.mixinTask.acceptTimes > 0)
			{
				MiXinManager.mixinTask.acceptTimes--
			}
			MiXinManager.mixinTask = null;
			MiXinManager.showMiXinHeroEffect( MainRoleManager.actor, -1 );
			EventManager.dispatchEvent( TaskEvent.MIXIN_GIVEUP_SUCCES, EmEvenTrackType.SECRET_MESSAGE );
		}
		
		/**
		 * 放弃密信任务失败，返回varint32错误码
		 *
		 * 1. 没有密信任务
		 */
		private function onGiveupMixinFail(buffer:ByteBuffer):void
		{
			var failId:int = buffer.readVarint32();
			NoticeManager.showNotify( LangJiMaoXin.MI_XIN_GIVE_UP_MI_XIN_FAIL );
		}
		
		/**
		 * 随机密信失败，附带varint32错误码：
		 *
		 * 1.没有密信任务
		 * 2.CD中
		 * 3.距离npc过远
		 * 4.已经是最高品质，无法刷新
		 */
		private function onRecRefreshMixinFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangJiMaoXin[ "MI_XIN_REFRESH_FAIL_" + errID ] );
			EventManager.dispatchEvent(TaskEvent.MIXIN_REFRESH_FAIL);
		}
		
		/**
		 * 刷新密信成功
		 *
		 * varint32 新的密信品质
		 * varint64 下次能够刷新密信的时间
		 */
		private function onRecRefreshMixinSucceed(buffer:ByteBuffer):void
		{
			var quality:int = buffer.readVarint32();
			var nextRefreshTime:Number = buffer.readVarint64();
			
			if( MiXinManager.mixinTask == null )
				MiXinManager.mixinTask = new MiXinTaskData();
			
			MiXinManager.mixinTask.quality = quality;
			MiXinManager.mixinTask.nextRandomMiXinTime = nextRefreshTime;
			MiXinManager.mixinTask.isSubmit = true;
			EventManager.dispatchEvent(TaskEvent.MIXIN_REFRESH_SUCCES);
		}
		
		/**
		 * 完成密信失败，附带varint32错误码：
		 *
		 * 1.没有密信任务
		 * 2.没有交密信任务
		 * 3.距离npc太远
		 * 4.你已经死亡了
		 */
		private function onRecCompleteMixinFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangJiMaoXin[ "MI_XIN_COMPLETE_FAIL_" + errID ] );
		}
		
		/**
		 * 完成密信成功
		 * 
		 * 客户端清空密信任务，完成密信任务次数+1
		 */
		private function onCompleteMixinSucceed(buffer:ByteBuffer):void
		{
//			MiXinManager.miXinTimes ++;
			MiXinManager.mixinTask = null;
			NoticeManager.showNotify( LangJiMaoXin.MI_XIN_XOMPLETE_MI_XIN_SUCCEED );
			MiXinManager.showMiXinHeroEffect( MainRoleManager.actor, -1 );
			EventManager.dispatchEvent( TaskEvent.MIXIN_COMPLETED_SUCCES, EmEvenTrackType.SECRET_MESSAGE );
		}
		
		/**
		 * 开启国家刺探成功
		 */
		private function onStartMiXin(buffer:ByteBuffer):void
		{
			trace("开启国家刺探成功");
		}
		
		/**
		 * 开启国家刺探失败，返回varint32错误码
		 * <p>
		 * 1. 权限不够
		 * 2. 已经开启了
		 * 3. 没在开启时间段内
		 */		
		private function onStartMiXinFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangJiMaoXin[ "MI_XIN_START_FAIL_" + errID ] );
		}
		
		/**
		 * 头顶上面的密信状态
		 *
		 * varint64 哪个角色头顶上
		 * if(buffer.readable()){
		 *     varint32 密信的品质[0：白色, 1：绿, 2：蓝, 3：紫, 4：橙 ]
		 * } else {
		 *     头顶上的密信状态消失
		 * }
		 */
		private function onRecMiXinStatus(buffer : ByteBuffer) : void
		{
			//玩家id
			var heroID:Number = buffer.readVarint64();
			var atkor:SceneRole = SceneManager.getSceneObjByID(heroID) as SceneRole;
			if ( atkor == null )
				return;
			
			if ( buffer.bytesAvailable > 0 )
			{
				var quality : int = buffer.readVarint32();//品质
				MiXinManager.delayShowEffect(atkor,quality);
			}
			else
			{
				MiXinManager.showMiXinHeroEffect( atkor, -1 );
			}
		}
		
		/**
		 * 弄出了个最高品质的密信
		 *
		 * varint32 品质
		 * varint32 玩家所属国家
		 * bytes 玩家名字
		 */
		private function onMaxQualityMiXinBroadcast(buffer : ByteBuffer):void
		{
			var quality:int = buffer.readVarint32();
			var countryId:int = buffer.readVarint32();
			var name:String = BytesUtil.readRemainUTF( buffer );
			
			var countryName : String = CountryManager.getCountryName(countryId);
			var qualityName:String = TouJingManager.getJingShuColor(quality);
			
			if (quality >= EmQuality.QUALITY_ORANGE && quality != EmQuality.QUALITY_GRAY)
				NoticeManager.showNotify( LangJiMaoXin.MI_XIN_MAX_QUALITY_JING_SHU_BROADCAST, countryName, name, qualityName);
		}
	}
}