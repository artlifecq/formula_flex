package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回统领BOSS面板信息
	 */
	public class ResLeaderBossPanelInfoMessage extends Message {
	
		//玩家免费剩余次数
		private var _remain: int;
		
		//总次数
		private var _total: int;
		
		//当前时间(秒)
		private var _currentTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家免费剩余次数
			writeByte(_remain);
			//总次数
			writeByte(_total);
			//当前时间(秒)
			writeInt(_currentTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家免费剩余次数
			_remain = readByte();
			//总次数
			_total = readByte();
			//当前时间(秒)
			_currentTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155131;
		}
		
		/**
		 * get 玩家免费剩余次数
		 * @return 
		 */
		public function get remain(): int{
			return _remain;
		}
		
		/**
		 * set 玩家免费剩余次数
		 */
		public function set remain(value: int): void{
			this._remain = value;
		}
		
		/**
		 * get 总次数
		 * @return 
		 */
		public function get total(): int{
			return _total;
		}
		
		/**
		 * set 总次数
		 */
		public function set total(value: int): void{
			this._total = value;
		}
		
		/**
		 * get 当前时间(秒)
		 * @return 
		 */
		public function get currentTime(): int{
			return _currentTime;
		}
		
		/**
		 * set 当前时间(秒)
		 */
		public function set currentTime(value: int): void{
			this._currentTime = value;
		}
		
	}
}