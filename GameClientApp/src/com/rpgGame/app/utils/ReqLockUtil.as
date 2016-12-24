package  com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 消息请求锁定管理器
	 * @author luguozheng
	 */
	public class ReqLockUtil
	{
		private static var _reqLockMap:HashMap = new HashMap; //锁定请求的列表
		
		/**
		 * 发送消息前锁上，当然要先判断一下是否已经锁上了，锁上了就不用发消息了
		 * @param reqType			消息类型，服务器生成的那个类型
		 * @param lockTime			多少毫秒后自动解锁，默认为100毫秒。
		 * 							正常用默认的吧，要可防止别人狂点。
		 * 							有些消息是10秒缓存的，同时可以手动解锁
		 * 
		 */		
		public static function lockReq( cmdID:int, lockTime:Number = 100):void
		{
			_reqLockMap.add(cmdID, SystemTimeManager.curtTm + lockTime );
		}
		
		/**
		 * 消息解锁
		 * @reqType 消息类型
		 */
		public static function unlockReq( cmdID:int ):void
		{
			_reqLockMap.remove( cmdID );
		}
		
		/**
		 * 消息是否被锁定
		 * @reqType 消息类型
		 */
		public static function isReqLocked(cmdID:int,hint:Boolean = false):Boolean
		{
			if( _reqLockMap.getValue( cmdID ) == null )
				return false;
			
			var unlockTime:Number = _reqLockMap.getValue( cmdID );
			if(hint && SystemTimeManager.curtTm < unlockTime)
				NoticeManager.showNotify("请求过于频繁");
			return SystemTimeManager.curtTm < unlockTime;
		}
	}
}