package com.rpgGame.netData.guild.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知帮会成员帮贡信息
	 */
	public class G2CNotifyGuildMemberActiveMessage extends Message {
	
		//玩家Id
		private var _playerId: long;
		
		//本周活跃
		private var _curWeekendActive: int;
		
		//总活跃
		private var _allActive: int;
		
		//帮派贡献
		private var _contribution: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_playerId);
			//本周活跃
			writeInt(_curWeekendActive);
			//总活跃
			writeInt(_allActive);
			//帮派贡献
			writeInt(_contribution);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_playerId = readLong();
			//本周活跃
			_curWeekendActive = readInt();
			//总活跃
			_allActive = readInt();
			//帮派贡献
			_contribution = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111117;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 本周活跃
		 * @return 
		 */
		public function get curWeekendActive(): int{
			return _curWeekendActive;
		}
		
		/**
		 * set 本周活跃
		 */
		public function set curWeekendActive(value: int): void{
			this._curWeekendActive = value;
		}
		
		/**
		 * get 总活跃
		 * @return 
		 */
		public function get allActive(): int{
			return _allActive;
		}
		
		/**
		 * set 总活跃
		 */
		public function set allActive(value: int): void{
			this._allActive = value;
		}
		
		/**
		 * get 帮派贡献
		 * @return 
		 */
		public function get contribution(): int{
			return _contribution;
		}
		
		/**
		 * set 帮派贡献
		 */
		public function set contribution(value: int): void{
			this._contribution = value;
		}
		
	}
}