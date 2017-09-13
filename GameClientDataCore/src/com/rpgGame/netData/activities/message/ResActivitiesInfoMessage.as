package com.rpgGame.netData.activities.message{
	import com.rpgGame.netData.activities.bean.ActivityInfo;
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
	public class ResActivitiesInfoMessage extends Message {
	
		//活动面板类型 ,0全部
		private var _mainPanelType: int;
		
		//活动信息
		private var _activities: Vector.<ActivityInfo> = new Vector.<ActivityInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//活动面板类型 ,0全部
			writeInt(_mainPanelType);
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
			//活动面板类型 ,0全部
			_mainPanelType = readInt();
			//活动信息
			var activities_length : int = readShort();
			for (i = 0; i < activities_length; i++) {
				_activities[i] = readBean(ActivityInfo) as ActivityInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 181101;
		}
		
		/**
		 * get 活动面板类型 ,0全部
		 * @return 
		 */
		public function get mainPanelType(): int{
			return _mainPanelType;
		}
		
		/**
		 * set 活动面板类型 ,0全部
		 */
		public function set mainPanelType(value: int): void{
			this._mainPanelType = value;
		}
		
		/**
		 * get 活动信息
		 * @return 
		 */
		public function get activities(): Vector.<ActivityInfo>{
			return _activities;
		}
		
		/**
		 * set 活动信息
		 */
		public function set activities(value: Vector.<ActivityInfo>): void{
			this._activities = value;
		}
		
	}
}