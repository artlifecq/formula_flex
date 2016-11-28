package com.rpgGame.netData.fight.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 广播打断吟唱,如果前端已经发了攻击请求,后端还有验证当前吟唱时间到达没
	 */
	public class ResAttackBreakSingingToClientMessage extends Message {
	
		//角色Id
		private var _playerid: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_playerid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_playerid = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102109;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get playerid(): long{
			return _playerid;
		}
		
		/**
		 * set 角色Id
		 */
		public function set playerid(value: long): void{
			this._playerid = value;
		}
		
	}
}