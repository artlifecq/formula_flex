package com.rpgGame.netData.offlineres.message{
	import com.rpgGame.netData.offlineres.bean.OfflineResAwardInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 离线收益面板信息消息
	 */
	public class ResOfflineAwardPanelMessage extends Message {
	
		//离线收益面板
		private var _offlineAward: OfflineResAwardInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//离线收益面板
			writeBean(_offlineAward);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//离线收益面板
			_offlineAward = readBean(OfflineResAwardInfo) as OfflineResAwardInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 209101;
		}
		
		/**
		 * get 离线收益面板
		 * @return 
		 */
		public function get offlineAward(): OfflineResAwardInfo{
			return _offlineAward;
		}
		
		/**
		 * set 离线收益面板
		 */
		public function set offlineAward(value: OfflineResAwardInfo): void{
			this._offlineAward = value;
		}
		
	}
}