package com.rpgGame.netData.dailyzone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 副本结算面板
	 */
	public class SCDailyZoneRewardPanelInfoMessage extends Message {
	
		//0失败,1成功
		private var _success: int;
		
		//获得星数
		private var _star: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0失败,1成功
			writeByte(_success);
			//获得星数
			writeByte(_star);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0失败,1成功
			_success = readByte();
			//获得星数
			_star = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 400104;
		}
		
		/**
		 * get 0失败,1成功
		 * @return 
		 */
		public function get success(): int{
			return _success;
		}
		
		/**
		 * set 0失败,1成功
		 */
		public function set success(value: int): void{
			this._success = value;
		}
		
		/**
		 * get 获得星数
		 * @return 
		 */
		public function get star(): int{
			return _star;
		}
		
		/**
		 * set 获得星数
		 */
		public function set star(value: int): void{
			this._star = value;
		}
		
	}
}