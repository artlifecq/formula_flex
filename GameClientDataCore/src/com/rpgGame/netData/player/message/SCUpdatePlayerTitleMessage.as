package com.rpgGame.netData.player.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新玩家的称号信息
	 */
	public class SCUpdatePlayerTitleMessage extends Message {
	
		//角色id
		private var _playerId: long;
		
		//1 添加      2 移除
		private var _flag: int;
		
		//称号编号
		private var _titleId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色id
			writeLong(_playerId);
			//1 添加      2 移除
			writeInt(_flag);
			//称号编号
			writeInt(_titleId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色id
			_playerId = readLong();
			//1 添加      2 移除
			_flag = readInt();
			//称号编号
			_titleId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103217;
		}
		
		/**
		 * get 角色id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 角色id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 1 添加      2 移除
		 * @return 
		 */
		public function get flag(): int{
			return _flag;
		}
		
		/**
		 * set 1 添加      2 移除
		 */
		public function set flag(value: int): void{
			this._flag = value;
		}
		
		/**
		 * get 称号编号
		 * @return 
		 */
		public function get titleId(): int{
			return _titleId;
		}
		
		/**
		 * set 称号编号
		 */
		public function set titleId(value: int): void{
			this._titleId = value;
		}
		
	}
}