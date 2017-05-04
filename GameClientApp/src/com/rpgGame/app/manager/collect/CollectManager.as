package com.rpgGame.app.manager.collect
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.state.role.action.CollectStateReference;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.type.RoleStateType;

	import org.client.mainCore.manager.EventManager;

	/**
	 * 采集条
	 * @author luguozheng
	 *
	 */
	public class CollectManager
	{
		private static var isShowing : Boolean = false;

		public function CollectManager()
		{

		}

		public static function setup() : void
		{
			EventManager.addEvent(UserMoveEvent.MOVE_THROUGH, hideCollect);
		}

		private static function hideCollect() : void
		{
			hide();
		}

		/**
		 * 显示采集条
		 * @param title				标题
		 * @param time				毫秒时间
		 * @param callbackFun		回调
		 *
		 */
		public static function show(title : String, time : int, callBack : Function, args : Array = null) : void
		{
			if (time <= 0)
				return;

			isShowing = true;
			
			
			//AppManager.showAppNoHide(AppConstant.COLLECT_PANEL, [title, time]);
			var ref : CollectStateReference = MainRoleManager.actor.stateMachine.getReference(CollectStateReference) as CollectStateReference;
			ref.setParams(time);
			ref.onEnd(onCollectComplete, callBack, args);
			ref.onLeave(onCollectLeave, callBack, args);
			MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_COLLECT, ref);
		}

		private static function onCollectComplete(callBack : Function, args : Array, ref : CollectStateReference) : void
		{
			if (callBack != null)
				callBack(args);
		}

		private static function onCollectLeave(callBack : Function, args : Array, ref : CollectStateReference) : void
		{
			AppManager.hideApp(AppConstant.COLLECT_PANEL);
		}

		/**
		 * 隐藏采集条
		 *
		 */
		public static function hide() : void
		{
			if (isShowing)
			{
				isShowing = false;

				AppManager.hideApp(AppConstant.COLLECT_PANEL);
			}
		}

	}
}
