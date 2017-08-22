package com.rpgGame.netData.npc.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 采集完成
	 */
	public class CSGatherFinishMessage extends Message {
	
		//采集物id
		private var _gatherId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//采集物id
			writeLong(_gatherId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//采集物id
			_gatherId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 104203;
		}
		
		/**
		 * get 采集物id
		 * @return 
		 */
		public function get gatherId(): long{
			return _gatherId;
		}
		
		/**
		 * set 采集物id
		 */
		public function set gatherId(value: long): void{
			this._gatherId = value;
		}
		
	}
}