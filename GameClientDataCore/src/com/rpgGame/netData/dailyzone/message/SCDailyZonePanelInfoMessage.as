package com.rpgGame.netData.dailyzone.message{
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回日常副本面板信息
	 */
	public class SCDailyZonePanelInfoMessage extends Message {
	
		//面板信息列表
		private var _panelInfos: Vector.<DailyZonePanelInfo> = new Vector.<DailyZonePanelInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//面板信息列表
			writeShort(_panelInfos.length);
			for (i = 0; i < _panelInfos.length; i++) {
				writeBean(_panelInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//面板信息列表
			var panelInfos_length : int = readShort();
			for (i = 0; i < panelInfos_length; i++) {
				_panelInfos[i] = readBean(DailyZonePanelInfo) as DailyZonePanelInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 400101;
		}
		
		/**
		 * get 面板信息列表
		 * @return 
		 */
		public function get panelInfos(): Vector.<DailyZonePanelInfo>{
			return _panelInfos;
		}
		
		/**
		 * set 面板信息列表
		 */
		public function set panelInfos(value: Vector.<DailyZonePanelInfo>): void{
			this._panelInfos = value;
		}
		
	}
}