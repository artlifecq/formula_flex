package com.rpgGame.netData.friend.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知被操作的玩家自己被其他玩家(添加或删除或移动)
	 */
	public class ResOperationFriendMsgMessage extends Message {
	
		//操作源的角色Id
		private var _playerId: long;
		
		//操作源的角色头像
		private var _icon: int;
		
		//操作源角色名
		private var _name: String;
		
		//操作源等级
		private var _level: int;
		
		//操作类型(1 添加 2 删除 3 移动 )
		private var _operationType: int;
		
		//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )
		private var _relationType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作源的角色Id
			writeLong(_playerId);
			//操作源的角色头像
			writeInt(_icon);
			//操作源角色名
			writeString(_name);
			//操作源等级
			writeInt(_level);
			//操作类型(1 添加 2 删除 3 移动 )
			writeByte(_operationType);
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )
			writeByte(_relationType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作源的角色Id
			_playerId = readLong();
			//操作源的角色头像
			_icon = readInt();
			//操作源角色名
			_name = readString();
			//操作源等级
			_level = readInt();
			//操作类型(1 添加 2 删除 3 移动 )
			_operationType = readByte();
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )
			_relationType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 116103;
		}
		
		/**
		 * get 操作源的角色Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 操作源的角色Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 操作源的角色头像
		 * @return 
		 */
		public function get icon(): int{
			return _icon;
		}
		
		/**
		 * set 操作源的角色头像
		 */
		public function set icon(value: int): void{
			this._icon = value;
		}
		
		/**
		 * get 操作源角色名
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 操作源角色名
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 操作源等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 操作源等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 操作类型(1 添加 2 删除 3 移动 )
		 * @return 
		 */
		public function get operationType(): int{
			return _operationType;
		}
		
		/**
		 * set 操作类型(1 添加 2 删除 3 移动 )
		 */
		public function set operationType(value: int): void{
			this._operationType = value;
		}
		
		/**
		 * get 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )
		 * @return 
		 */
		public function get relationType(): int{
			return _relationType;
		}
		
		/**
		 * set 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )
		 */
		public function set relationType(value: int): void{
			this._relationType = value;
		}
		
	}
}