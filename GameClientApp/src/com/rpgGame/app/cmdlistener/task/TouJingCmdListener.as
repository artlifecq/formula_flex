package com.rpgGame.app.cmdlistener.task
{
	import com.rpgGame.app.cmdlistener.enum.EmEvenTrackType;
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.collect.CollectManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TouJingSender;
	import com.rpgGame.app.state.role.action.CollectStateReference;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.task.TouJingCfgData;
	import com.rpgGame.coreData.info.toujing.TouJingTaskData;
	import com.rpgGame.coreData.lang.LangTouJing;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import app.cmd.CountryModuleMessages;
	import app.cmd.TaskModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	import org.game.netCore.net.BytesUtil;

	/**
	 * 夺经事件侦听器 
	 * @author 陈鹉光
	 * 
	 */	
	public class TouJingCmdListener extends BaseBean
	{
		public function TouJingCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_ACCEPT_TOU_JING, onAcceptTouJing);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_ACCEPT_TOU_JING_FAIL, onAcceptTouJingFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_START_TOU_JING_FAIL, onRecStartTouJingFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TOU_JING_PROGRESS, onRecTouJingProgress);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_DO_TOU_JING_FAIL, onRecDoTouJingFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_DO_TOU_JING, onRecDoTouJing);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TOU_JING_STATUS, onRecTouJingStatus);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_COMPLETE_TOU_JING_TASK_FAIL, onRecCompleteTouJingTaskFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_COMPLETE_TOU_JING_TASK, onRecCompleteTouJingTask);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_MAX_QUALITY_JING_SHU_BROADCAST, onMaxQualityJingShuBroadcast);
			
			//开启国家夺经
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_START_DUO_JING, onStartDuoJing);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_START_DUO_JING_FAIL, onStartDuoJingFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_START_DUO_JING_BROADCAST, onStartDuoJingBroadCast);

			finish();
		}

		/**
		 * 接受偷经成功
		 *
		 * varint32 接受任务的奖励等级
		 * bool 是否是偷经活动期间接受的
		 */
		private function onAcceptTouJing(buffer : ByteBuffer) : void
		{
			var level : int = buffer.readVarint32();
			var isInTouJingActivityTime:Boolean = buffer.readBoolean();
			if (TouJingManager.touJingData == null)
				TouJingManager.touJingData = new TouJingTaskData();

			TouJingManager.touJingData.level = level;
			TouJingManager.touJingData.isInTouJingActivityTime = isInTouJingActivityTime;
			NoticeManager.showNotify(LangTouJing.TASK_TOUJING_ACCEPT_SUCCESS);
			EventManager.dispatchEvent(TouJingEvent.TOUJING_ACCEPT_TASK, EmEvenTrackType.TOU_JING);
		}

		/**
		 * 接受偷经失败，返回varint32错误码
		 *
		 * 1.你死了
		 * 2.距离npc过远
		 * 3.功能没开启
		 * 4.没在活动期间
		 * 5.已经有了偷经任务
		 * 6.国战期间不可以接取该任务
		 */
		private function onAcceptTouJingFail(buffer : ByteBuffer) : void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangTouJing[ "TOU_JING_ACCEPT_FAIL_" + errID ] );
		}

		/**
		 * 偷经失败，返回varint32错误码
		 *
		 * 0.你已经死了
		 * 1.你在跳跃中
		 * 2.被击晕或者不可以移动
		 * 3.没在普通场景
		 * 4.偷经任务已经完成了
		 * 5.任务目标已经完成了
		 * 6.没接取偷经任务
		 * 7.不在偷经范围内
		 * 8.服务器bug
		 * 9.盟国不能够去偷经
		 * 10.偷经功能没有开启
		 * 11.偷经时间没到
		 * 12.不能够在已经偷到的经书国家以外的其他国家更换
		 */
		private function onRecStartTouJingFail(buffer : ByteBuffer) : void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangTouJing[ "TOU_JING_START_TOU_JING_FAIL_" + errID ] );
		}

		/**
		 * 场景中有人在偷经，附带偷经结束时间，客户端根据时间做玩家的偷经动作
		 *
		 * varint64 场景中谁在偷经
		 * varint64 偷经结束时间
		 *
		 * 说明：这条消息可能会在S2C_DO_TOU_JING消息之后[因为被攻击会导致偷经结束时间变更]
		 *      客户端需要判断当前有没有进度条
		 */
		private function onRecTouJingProgress(buffer : ByteBuffer) : void
		{
			var playerID : Number = buffer.readVarint64();
			var endTime : Number = buffer.readVarint64();
			
			var curTime : Number = SystemTimeManager.curtTm;
			var collect : Number = endTime - curTime;
			var id:Number = MainRoleManager.actorInfo.id;
			
			if( playerID == id )//是自己的时候，才显示采集条
			{
				//夺经优化list2需求
				var isBool:Boolean = (TouJingManager.touJingData.isTouSuccess && TouJingManager.curJingShuQuality != -1);
				if( isBool || TouJingManager.curJingShuQuality == EmQuality.QUALITY_GRAY)//偷到了经书
					CollectManager.show(LanguageConfig.getText(LangTouJing.TOU_JING_REFRESH_JING_SHU), collect, sendDoTouJing);
				else
					CollectManager.show(LanguageConfig.getText(LangTouJing.TOU_JING_TOU_JING), collect, sendDoTouJing);
			}
			else
			{
				//场景中别人在偷经，只显示偷经的动作，不显示采集条
				var sceneRole:SceneRole = SceneManager.getSceneObjByID( playerID ) as SceneRole;
				if( sceneRole != null )
				{
					var ref:CollectStateReference = sceneRole.stateMachine.getReference(CollectStateReference) as CollectStateReference;
					ref.setParams(collect);
					sceneRole.stateMachine.transition(RoleStateType.ACTION_COLLECT, ref);
				}
			}
		}

		/**
		 * 读条完毕，偷经，不需要附带任何参数
		 */
		private function sendDoTouJing(args : Array) : void
		{
			TouJingSender.reqDoTouJing();
		}

		/**
		 * 偷经失败，返回varint32错误码
		 * 0.你已经死了
		 * 1.你在跳跃中
		 * 2.击晕或者不可移动不可以采灵
		 * 3.没在普通场景中
		 * 4.最好的经书了
		 * 5.任务目标已经完成了
		 * 6.不是偷经任务
		 * 7.不在偷经范围内
		 * 8.服务器bug
		 * 9.盟国不能够去偷经
		 * 10.进度条还没读完呢
		 * 11.偷经功能没有开启
		 * 12.偷经时间没到
		 * 13.目标国家经书不够
		 * 14.偷经任务都已经完成了
		 * 15.国战期间无法偷经
		 */
		private function onRecDoTouJingFail(buffer : ByteBuffer) : void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangTouJing[ "TOU_JING_DO_TOU_JING_FAIL_" + errID ] );
		}

		/**
		 * 偷经成功，客户端清掉进度条
		 *
		 * varint32 偷盗的经书所属的国家
		 * varint32 偷盗的经书的品质[ 0：白色, 1：绿, 2：蓝, 3：紫, 4：橙, 5：灰色，特殊品质 ]
		 * bool 是不是偷经书偷成功了 true(偷到了)/false(没偷到)显示灰色
		 */
		private function onRecDoTouJing(buffer : ByteBuffer) : void
		{
			var countryID : int = buffer.readVarint32();
			var quality : int = buffer.readVarint32();
			var isTou : Boolean = buffer.readBoolean();

			var data : TouJingTaskData;
			if (TouJingManager.touJingData == null)
				data = new TouJingTaskData();

			if (!isTou) //是不是偷经书偷成功了 true(偷到了)/false(没偷到)显示灰色
			{
				quality = EmQuality.QUALITY_GRAY;
			}
			TouJingManager.touJingData.countryID = countryID;
			TouJingManager.touJingData.quality = quality;
			TouJingManager.touJingData.isTouSuccess = isTou;
			TouJingManager.touJingSucceed(quality);
			EventManager.dispatchEvent(TouJingEvent.TOUJING_SUCCEED);
			
			//更新护国寺特效
			var id:int = TouJingCfgData.acceptNpcID = TouJingCfgData.submitNpcID = TouJingCfgData.completeNpcID;
			var sceneRole:SceneRole = SceneManager.getSceneObjByID( id ) as SceneRole;
			if( sceneRole != null )
				TouJingManager.setHuGuoSiEffect( id, sceneRole, true );
			else
				TouJingManager.setHuGuoSiEffect( id, sceneRole, false );
		}

		/**
		 * 偷经头顶上面的状态
		 *
		 * varint64 哪个角色头顶上
		 * if(readable()){
		 *      varint32 偷盗的经书的品质[ 0：白色, 1：绿, 2：蓝, 3：紫, 4：橙, 5：灰色，特殊品质 ]
		 * } else{
		 *      头顶上的偷经状态消失
		 * }
		 */
		private function onRecTouJingStatus(buffer : ByteBuffer) : void
		{
			//玩家id
			var heroID:Number = buffer.readVarint64();
			var atkor:SceneRole = SceneManager.getSceneObjByID(heroID) as SceneRole;
			if ( atkor == null )
				return;
			
			var selfId:Number = MainRoleManager.actorID
			if ( buffer.bytesAvailable > 0 )
			{
				var quality : int = buffer.readVarint32();//品质
				TouJingManager.showJingHeroEffect( atkor, -1 );
				TouJingManager.showJingHeroEffect(atkor, quality);
			}
			else
			{
				TouJingManager.showJingHeroEffect( atkor, -1 );
			}
		}

		/**
		 * 完成偷经任务失败，返回varint32错误码
		 *
		 * 1.当前没有偷经任务
		 * 2.没有偷到经书
		 * 3.距离偷经任务完成npc过远
		 * 4.国战期间不可以交经书任务
		 */
		private function onRecCompleteTouJingTaskFail(buffer : ByteBuffer) : void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangTouJing[ "TOU_JING_COMPLETE_TOU_JING_FAIL_" + errID ] );
		}

		/**
		 * 完成偷经任务，客户端偷经次数+1，清空偷经任务
		 * 如果当前还有偷经任务次数，客户端默认又获得该任务
		 */
		private function onRecCompleteTouJingTask(buffer : ByteBuffer) : void
		{
			TouJingManager.touJingCount++;
			TouJingManager.curJingShuQuality = -1;
			TouJingManager.touJingData = null;

			if (TouJingManager.touJingCount >= TouJingCfgData.hasPrizeTimes)
			{
				EventManager.dispatchEvent(TouJingEvent.TOUJING_COMPLETE_TASK_MAX, EmEvenTrackType.TOU_JING);
			}
			//捐赠经书提示
			NoticeManager.showNotify(LangTouJing.TASK_TOUJING_COMPLETE_PRIZE);
			//捐赠经书后，人物头顶经书标志消失
			TouJingManager.showJingHeroEffect(MainRoleManager.actor, -1);
			EventManager.dispatchEvent(TouJingEvent.TOUJING_COMPLETE);
		}
		
		/**
		 * 弄出了个最高品质的经书
		 *
		 * varint32 品质
		 * varint32 玩家所属国家
		 * varint32 ji经书所属国家
		 * bytes 玩家名字
		 */
		private function onMaxQualityJingShuBroadcast(buffer : ByteBuffer):void
		{
			var quality:int = buffer.readVarint32();
			var countryId:int = buffer.readVarint32();
			var jingShuCountryId:int = buffer.readVarint32();
			var name:String = BytesUtil.readRemainUTF( buffer );
			var countryName : String = CountryManager.getCountryName(countryId);
			var jingShuCountryName : String = CountryManager.getCountryName(jingShuCountryId);
			var qualityName:String = TouJingManager.getJingShuColor(quality);
			
			if (quality >= EmQuality.QUALITY_ORANGE && quality != EmQuality.QUALITY_GRAY)
				NoticeManager.showNotify( LangTouJing.TOU_JING_WORLD_BROADCAST, countryName, name, jingShuCountryName, qualityName );
		}
		
		/**
		 * 开启国家夺经成功
		 */
		private function onStartDuoJing(buffer : ByteBuffer):void
		{
			trace("开启国家夺经成功");
		}
		
		/**
		 * 开启国家夺经失败，返回varint32错误码
		 * <p>
		 * 1. 权限不够
		 * 2. 已经开启了
		 * 3. 没在活动期间
		 */
		private function onStartDuoJingFail(buffer : ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangTouJing[ "TOU_JING_START_GUO_JIA_TOU_JING_FAIL_" + errID ] );
		}
		
		/**
		 * 开启国家夺经广播
		 * <p>
		 * varint32 哪个国家
		 * varint64 夺经结束时间
		 * <p>
		 * if(buffer.readable()){
		 * varint32 召唤id，检测条件满足，发送：C2S_COUNTRY_OFFICER_SUMMON
		 * varint64 召唤结束时间
		 * bytes 召唤者的名字
		 * }
		 */
		private function onStartDuoJingBroadCast(buffer : ByteBuffer):void
		{
			var countryId:int = buffer.readVarint32();
			var endTime:int = buffer.readVarint64();
			if( buffer.bytesAvailable )
			{
				var summonId:int = buffer.readVarint32();
				var summonEndTime:int = buffer.readVarint64();
				var summonName:String = BytesUtil.readRemainUTF( buffer );
			}
		}
	}
}
