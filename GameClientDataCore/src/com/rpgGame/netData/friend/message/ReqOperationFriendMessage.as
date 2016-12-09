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
	 * 请求操作好友信息列表
	 */
	public class ReqOperationFriendMessage extends Message {
	
		//角色Id
		private var _playerId: long;
		
		//操作类型(1 添加 2 删除 3 移动 )
		private var _operationType: int;
		
		//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人 )如果是移动操作则此为原关系
		private var _relationType: int;
		
		//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 5最近联系人 )仅移动操作使用,此为目标关系
		private var _relationTargetType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_playerId);
			//操作类型(1 添加 2 删除 3 移动 )
			writeByte(_operationType);
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人 )如果是移动操作则此为原关系
			writeByte(_relationType);
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 5最近联系人 )仅移动操作使用,此为目标关系
			writeByte(_relationTargetType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_playerId = readLong();
			//操作类型(1 添加 2 删除 3 移动 )
			_operationType = readByte();
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人 )如果是移动操作则此为原关系
			_relationType = readByte();
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 5最近联系人 )仅移动操作使用,此为目标关系
			_relationTargetType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 116202;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
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
		 * get 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人 )如果是移动操作则此为原关系
		 * @return 
		 */
		public function get relationType(): int{
			return _relationType;
		}
		
		/**
		 * set 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人 )如果是移动操作则此为原关系
		 */
		public function set relationType(value: int): void{
			this._relationType = value;
		}
		
		/**
		 * get 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 5最近联系人 )仅移动操作使用,此为目标关系
		 * @return 
		 */
		public function get relationTargetType(): int{
			return _relationTargetType;
		}
		
		/**
		 * set 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 5最近联系人 )仅移动操作使用,此为目标关系
		 */
		public function set relationTargetType(value: int): void{
			this._relationTargetType = value;
		}
		
	}
}