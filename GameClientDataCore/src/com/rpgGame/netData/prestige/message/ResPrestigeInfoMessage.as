package com.rpgGame.netData.prestige.message{
	import com.rpgGame.netData.prestige.bean.PrestigeInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家声望数据
	 */
	public class ResPrestigeInfoMessage extends Message {
	
		//声望信息
		private var _prestigeInfo: PrestigeInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//声望信息
			writeBean(_prestigeInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//声望信息
			_prestigeInfo = readBean(PrestigeInfo) as PrestigeInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 212101;
		}
		
		/**
		 * get 声望信息
		 * @return 
		 */
		public function get prestigeInfo(): PrestigeInfo{
			return _prestigeInfo;
		}
		
		/**
		 * set 声望信息
		 */
		public function set prestigeInfo(value: PrestigeInfo): void{
			this._prestigeInfo = value;
		}
		
	}
}