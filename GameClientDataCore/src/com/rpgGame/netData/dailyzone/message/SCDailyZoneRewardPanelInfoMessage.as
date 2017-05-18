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
		
		//每日副本ID
		private var _dailyZoneId: int;
		
		//1首通
		private var _firstPass: int;
		
		//0失败,1成功
		private var _success: int;
		
		//获得星数
		private var _star: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//每日副本ID
			writeInt(_dailyZoneId);
			//1首通
			writeByte(_firstPass);
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
			//每日副本ID
			_dailyZoneId = readInt();
			//1首通
			_firstPass = readByte();
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
		 * get 每日副本ID
		 * @return 
		 */
		public function get dailyZoneId(): int{
			return _dailyZoneId;
		}
		
		/**
		 * set 每日副本ID
		 */
		public function set dailyZoneId(value: int): void{
			this._dailyZoneId = value;
		}
		
		/**
		 * get 1首通
		 * @return 
		 */
		public function get firstPass(): int{
			return _firstPass;
		}
		
		/**
		 * set 1首通
		 */
		public function set firstPass(value: int): void{
			this._firstPass = value;
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