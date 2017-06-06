package com.rpgGame.netData.specialactivities.message{
	import com.rpgGame.netData.specialactivities.bean.ActivityNotifyInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回活动预告时间信息列表
	 */
	public class SCActivitiesNotifyListMessage extends Message {
	
		//活动预告列表信息
		private var _activityNotifyInfolist: Vector.<ActivityNotifyInfo> = new Vector.<ActivityNotifyInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//活动预告列表信息
			writeShort(_activityNotifyInfolist.length);
			for (i = 0; i < _activityNotifyInfolist.length; i++) {
				writeBean(_activityNotifyInfolist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//活动预告列表信息
			var activityNotifyInfolist_length : int = readShort();
			for (i = 0; i < activityNotifyInfolist_length; i++) {
				_activityNotifyInfolist[i] = readBean(ActivityNotifyInfo) as ActivityNotifyInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 162104;
		}
		
		/**
		 * get 活动预告列表信息
		 * @return 
		 */
		public function get activityNotifyInfolist(): Vector.<ActivityNotifyInfo>{
			return _activityNotifyInfolist;
		}
		
		/**
		 * set 活动预告列表信息
		 */
		public function set activityNotifyInfolist(value: Vector.<ActivityNotifyInfo>): void{
			this._activityNotifyInfolist = value;
		}
		
	}
}