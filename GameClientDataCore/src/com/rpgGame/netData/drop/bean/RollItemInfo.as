package com.rpgGame.netData.drop.bean{
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	
	import org.game.netCore.data.long;
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * Roll点物品信息
	 */
	public class RollItemInfo extends Bean {
	
		//唯一ID
		private var _uniqueId: long;
		
		//物品消息
		private var _tempItemInfo: TempItemInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//唯一ID
			writeLong(_uniqueId);
			//物品消息
			writeBean(_tempItemInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//唯一ID
			_uniqueId = readLong();
			//物品消息
			_tempItemInfo = readBean(TempItemInfo) as TempItemInfo;
			return true;
		}
		
		/**
		 * get 唯一ID
		 * @return 
		 */
		public function get uniqueId(): long{
			return _uniqueId;
		}
		
		/**
		 * set 唯一ID
		 */
		public function set uniqueId(value: long): void{
			this._uniqueId = value;
		}
		
		/**
		 * get 物品消息
		 * @return 
		 */
		public function get tempItemInfo(): TempItemInfo{
			return _tempItemInfo;
		}
		
		/**
		 * set 物品消息
		 */
		public function set tempItemInfo(value: TempItemInfo): void{
			this._tempItemInfo = value;
		}
		
	}
}