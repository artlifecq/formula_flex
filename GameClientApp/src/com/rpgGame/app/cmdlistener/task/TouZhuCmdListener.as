package com.rpgGame.app.cmdlistener.task
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TouZhuManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.TouZhuEvent;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.task.daily.TouZhuTaskData;
	
	import app.cmd.TaskModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 * 偷猪
	 * @author luguozheng
	 * 
	 */	
	public class TouZhuCmdListener extends BaseBean
	{
		public function TouZhuCmdListener()
		{	
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_ACCEPT_TOU_ZHU_TASK_FAIL, onRecAcceptTouZhuTaskFail );
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_ACCEPT_TOU_ZHU_TASK, onRecAcceptTouZhuTask );
			
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TOU_ZHU_BIAN_SHEN, onRecTouZhuBianShen );
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TOU_ZHU_BIAN_SHEN_DISAPPEAR, onRecTouZhuBianShenDisappear );
			
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TOU_ZHU_TASK_DISAPPER, onRecTouZhuTaskDisapper );
			
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_STRAT_TOU_ZHU_FAIL, onRecStratTouZhuFail );
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_STRAT_TOU_ZHU, onRecStratTouZhu );
			
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_DO_TOU_ZHU_FAIL, onRecDoTouZhuFail );
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_DO_TOU_ZHU, onRecDoTouZhu );
			
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_COMPLETE_TOU_ZHU_TASK_FAIL, onRecCompleteTouZhuTaskFail );
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_COMPLETE_TOU_ZHU_TASK, onRecCompleteTouZhuTask );
			
			finish();
		}
		
		/**
		 * 接受偷猪任务失败，返回varint32错误码
		 * 
		 * 1.偷猪任务没有开放
		 * 2.不在自己国家，无法领取偷猪任务
		 * 3.请求偷猪任务，但是距离NPC太远
		 * 4.请求偷猪任务，但是当前已经有偷猪任务了
		 * 5.不在偷猪活动期间
		 * 6.次数不够，无法接受偷猪任务
		 * 7.其他状态导致当前无法显示，有其他消息来提示，客户端不需要用这条消息提示
		 */
		private function onRecAcceptTouZhuTaskFail(buffer:ByteBuffer):void
		{
			var failId:int = buffer.readVarint32();
			switch(failId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.TOU_ZHU_TASK_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.TOU_ZHU_TASK_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.TOU_ZHU_TASK_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.TOU_ZHU_TASK_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.TOU_ZHU_TASK_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.TOU_ZHU_TASK_FAIL6 );
					break;
				case 7:
					NoticeManager.showHint( EnumHintInfo.TOU_ZHU_TASK_FAIL7 );
					break;
			}
			
		}
		
		/**
		 * 接取偷猪任务完成
		 * varint64 任务结束时间
		 * 偷猪任务次数+1
		 */
		private function onRecAcceptTouZhuTask(buffer:ByteBuffer):void
		{
			TouZhuManager.touZhuTimes ++;
			
			TouZhuManager.touZhuTask = new TouZhuTaskData();
			TouZhuManager.touZhuTask.failTime = buffer.readVarint64();
			
			TouZhuManager.changeTouZhuStats( MainRoleManager.actor, 0 ); 
			
			NoticeManager.showHint( EnumHintInfo.TOU_ZHU_TASK_SUCCEED );
			
			EventManager.dispatchEvent( TouZhuEvent.START_TOU_ZHU );
			
			
			TouZhuManager.gotoTouZhu();
		}
		
		/**
		 * 偷猪变身，将场景中的玩家换装
		 * varint64 玩家id
		 * if(readable()){
		 *      varint32 偷到的猪
		 * } else{
		 * 		当前有偷猪任务，只是没有偷到猪
		 * }
		 */
		private function onRecTouZhuBianShen(buffer:ByteBuffer):void
		{
			var heroID:Number = buffer.readVarint64();
			var touZhuStats:int = 0;
			if(buffer.bytesAvailable > 0 )
				touZhuStats = buffer.readVarint32();
			else
				touZhuStats = 0;
			
			var atkor:SceneRole = SceneManager.getSceneObjByID(heroID) as SceneRole;
			if( atkor == null )
				return;
			
			TouZhuManager.changeTouZhuStats( atkor, touZhuStats); 
		}
		
		/**
		 * 偷猪变身消失，将场景中的玩家换装
		 * varint64 玩家id
		 */
		private function onRecTouZhuBianShenDisappear(buffer:ByteBuffer):void
		{
			var heroID:Number = buffer.readVarint64();
			
			var atkor:SceneRole = SceneManager.getSceneObjByID(heroID) as SceneRole;
			if( atkor == null )
				return;
			
			TouZhuManager.changeTouZhuStats( atkor, -1 ); 
		}
		
		/**
		 * 偷猪任务结束，客户端将当前偷猪任务置空
		 */
		private function onRecTouZhuTaskDisapper(buffer:ByteBuffer):void
		{
			TouZhuManager.touZhuTask = null;
			
			TouZhuManager.changeTouZhuStats( MainRoleManager.actor, -1 ); 
			
			EventManager.dispatchEvent( TouZhuEvent.END_TOU_ZHU );
		}
		
		/**
		 * 开始偷猪失败，返回varint32错误码
		 * 1.不在敌国场景中
		 * 2.当前没有偷猪任务，无法偷猪
		 * 3.猪已经被偷到了
		 * 4.发送过来的目标不是猪
		 * 5.距离过远
		 */
		private function onRecStratTouZhuFail(buffer:ByteBuffer):void
		{
			var failId:int = buffer.readVarint32();
			switch(failId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.STRAT_TOU_ZHU_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.STRAT_TOU_ZHU_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.STRAT_TOU_ZHU_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.STRAT_TOU_ZHU_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.STRAT_TOU_ZHU_FAIL5 );
					break;
			}
		}
		
		/**
		 * 开始偷猪成功
		 * varint64 进度条的结束时间
		 */
		private function onRecStratTouZhu(buffer:ByteBuffer):void
		{
			var startEndTime:Number = buffer.readVarint64();
			var collect:Number = startEndTime - SystemTimeManager.curtTm;
			
			TouZhuManager.touZhuEndTime = startEndTime;
			
			TouZhuManager.onRecStratTouZhu( collect );
		}
		
		/**
		 * 偷猪失败，返回varint32错误码
		 * 
		 * 1.不在敌国场景中
		 * 2.当前没有偷猪任务，无法偷猪
		 * 3.猪已经被偷到了
		 * 4.偷猪进度条还没走完呢
		 * 5.目标没找到
		 * 6.距离过远
		 */
		private function onRecDoTouZhuFail(buffer:ByteBuffer):void
		{
			var failId:int = buffer.readVarint32();
			switch(failId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.DO_TOU_ZHU_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.DO_TOU_ZHU_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.DO_TOU_ZHU_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.DO_TOU_ZHU_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.DO_TOU_ZHU_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.DO_TOU_ZHU_FAIL6 );
					break;
			}
		}
		
		/**
		 * 偷猪成功
		 * varint32 猪的配置id
		 */
		private function onRecDoTouZhu(buffer:ByteBuffer):void
		{
			if( TouZhuManager.touZhuTask == null )
				TouZhuManager.touZhuTask = new TouZhuTaskData();
			
			TouZhuManager.touZhuTask.zhuId = buffer.readVarint32();
			
			NoticeManager.showHint( EnumHintInfo.DO_TOU_ZHU_SUCCEED );
		}
		
		/**
		 * 完成偷猪任务失败，返回varint32错误码
		 * 
		 * 1.不在本国
		 * 2.当前没有偷猪任务
		 * 3.偷猪目标没有完成
		 * 4.距离NPC太远
		 */
		private function onRecCompleteTouZhuTaskFail(buffer:ByteBuffer):void
		{
			var failId:int = buffer.readVarint32();
			switch(failId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.COMPLETE_TOU_ZHU_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.COMPLETE_TOU_ZHU_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.COMPLETE_TOU_ZHU_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.COMPLETE_TOU_ZHU_FAIL4 );
					break;
			}
		}
		
		/**
		 * 完成偷猪任务
		 * 
		 * 清掉当前偷猪任务
		 */
		private function onRecCompleteTouZhuTask(buffer:ByteBuffer):void
		{
			TouZhuManager.touZhuTask = null;
			TouZhuManager.changeTouZhuStats( MainRoleManager.actor, -1 ); 
			
			NoticeManager.showHint( EnumHintInfo.COMPLETE_TOU_ZHU_SUCCEED );
			
			EventManager.dispatchEvent( TouZhuEvent.END_TOU_ZHU );
		}
	}
}