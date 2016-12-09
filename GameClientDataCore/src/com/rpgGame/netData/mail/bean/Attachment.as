package com.rpgGame.netData.mail.bean{
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 附件信息
	 */
	public class Attachment extends Bean {
	
		//物品信息
		private var _tempItemInfo: com.rpgGame.netData.backpack.bean.TempItemInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品信息
			writeBean(_tempItemInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品信息
			_tempItemInfo = readBean(com.rpgGame.netData.backpack.bean.TempItemInfo) as com.rpgGame.netData.backpack.bean.TempItemInfo;
			return true;
		}
		
		/**
		 * get 物品信息
		 * @return 
		 */
		public function get tempItemInfo(): com.rpgGame.netData.backpack.bean.TempItemInfo{
			return _tempItemInfo;
		}
		
		/**
		 * set 物品信息
		 */
		public function set tempItemInfo(value: com.rpgGame.netData.backpack.bean.TempItemInfo): void{
			this._tempItemInfo = value;
		}
		
	}
}