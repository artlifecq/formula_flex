package com.rpgGame.netData.destiny.message{
	import com.rpgGame.netData.destiny.bean.DestinyInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 同步天命任务数据
	 */
	public class ResDestinyInfoMessage extends Message {
	
		//天命任务数据
		private var _destinyInfo: DestinyInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//天命任务数据
			writeBean(_destinyInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//天命任务数据
			_destinyInfo = readBean(DestinyInfo) as DestinyInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 215102;
		}
		
		/**
		 * get 天命任务数据
		 * @return 
		 */
		public function get destinyInfo(): DestinyInfo{
			return _destinyInfo;
		}
		
		/**
		 * set 天命任务数据
		 */
		public function set destinyInfo(value: DestinyInfo): void{
			this._destinyInfo = value;
		}
		
	}
}