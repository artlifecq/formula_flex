package com.rpgGame.netData.activities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 前端请求活动信息
	 */
	public class ReqActivitiesInfoMessage extends Message {
	
		//活动面板类型
		private var _mainPanelType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动面板类型
			writeInt(_mainPanelType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动面板类型
			_mainPanelType = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 181202;
		}
		
		/**
		 * get 活动面板类型
		 * @return 
		 */
		public function get mainPanelType(): int{
			return _mainPanelType;
		}
		
		/**
		 * set 活动面板类型
		 */
		public function set mainPanelType(value: int): void{
			this._mainPanelType = value;
		}
		
	}
}