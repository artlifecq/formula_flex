package com.rpgGame.netData.monster.message{
	import com.rpgGame.netData.monster.bean.WGBossInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送单个boss的概要信息
	 */
	public class ResWGBossInfoToClientMessage extends Message {
	
		//世界或帮会boss信息
		private var _wgBossInfo: WGBossInfo;
		
		//同步类型
		private var _notifyType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//世界或帮会boss信息
			writeBean(_wgBossInfo);
			//同步类型
			writeByte(_notifyType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//世界或帮会boss信息
			_wgBossInfo = readBean(WGBossInfo) as WGBossInfo;
			//同步类型
			_notifyType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114114;
		}
		
		/**
		 * get 世界或帮会boss信息
		 * @return 
		 */
		public function get wgBossInfo(): WGBossInfo{
			return _wgBossInfo;
		}
		
		/**
		 * set 世界或帮会boss信息
		 */
		public function set wgBossInfo(value: WGBossInfo): void{
			this._wgBossInfo = value;
		}
		
		/**
		 * get 同步类型
		 * @return 
		 */
		public function get notifyType(): int{
			return _notifyType;
		}
		
		/**
		 * set 同步类型
		 */
		public function set notifyType(value: int): void{
			this._notifyType = value;
		}
		
	}
}