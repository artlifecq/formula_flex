package com.rpgGame.netData.monster.message{
	import com.rpgGame.netData.player.bean.OthersInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送玩家对BOSS的持有
	 */
	public class ResBossOwerInfoToClientMessage extends Message {
	
		//boss唯一id
		private var _monsterId: long;
		
		//持有者玩家的简要信息
		private var _owerPlayerInfo: com.rpgGame.netData.player.bean.OthersInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//boss唯一id
			writeLong(_monsterId);
			//持有者玩家的简要信息
			writeBean(_owerPlayerInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//boss唯一id
			_monsterId = readLong();
			//持有者玩家的简要信息
			_owerPlayerInfo = readBean(com.rpgGame.netData.player.bean.OthersInfo) as com.rpgGame.netData.player.bean.OthersInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114117;
		}
		
		/**
		 * get boss唯一id
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set boss唯一id
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get 持有者玩家的简要信息
		 * @return 
		 */
		public function get owerPlayerInfo(): com.rpgGame.netData.player.bean.OthersInfo{
			return _owerPlayerInfo;
		}
		
		/**
		 * set 持有者玩家的简要信息
		 */
		public function set owerPlayerInfo(value: com.rpgGame.netData.player.bean.OthersInfo): void{
			this._owerPlayerInfo = value;
		}
		
	}
}