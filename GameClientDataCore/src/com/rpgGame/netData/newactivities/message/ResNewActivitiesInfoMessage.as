package com.rpgGame.netData.newactivities.message{
	import com.rpgGame.netData.newactivities.bean.BaseActivityInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回活动信息
	 */
	public class ResNewActivitiesInfoMessage extends Message {
	
		//活动信息
		private var _activities: Vector.<BaseActivityInfo> = new Vector.<BaseActivityInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//活动信息
			writeShort(_activities.length);
			for (i = 0; i < _activities.length; i++) {
				writeBean(_activities[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//活动信息
			var activities_length : int = readShort();
			for (i = 0; i < activities_length; i++) {
				_activities[i] = readBean(BaseActivityInfo) as BaseActivityInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 182101;
		}
		
		/**
		 * get 活动信息
		 * @return 
		 */
		public function get activities(): Vector.<BaseActivityInfo>{
			return _activities;
		}
		
		/**
		 * set 活动信息
		 */
		public function set activities(value: Vector.<BaseActivityInfo>): void{
			this._activities = value;
		}
		
	}
}