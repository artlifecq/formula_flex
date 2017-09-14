package com.rpgGame.netData.gameactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取
	 */
	public class CSGetSevenDayRewardMessage extends Message {
	
		//活动ID
		private var _activeId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动ID
			writeInt(_activeId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动ID
			_activeId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 410201;
		}
		
		/**
		 * get 活动ID
		 * @return 
		 */
		public function get activeId(): int{
			return _activeId;
		}
		
		/**
		 * set 活动ID
		 */
		public function set activeId(value: int): void{
			this._activeId = value;
		}
		
	}
}