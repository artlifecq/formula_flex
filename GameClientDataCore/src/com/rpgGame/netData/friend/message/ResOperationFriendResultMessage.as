package com.rpgGame.netData.friend.message{
	import com.rpgGame.netData.friend.bean.FriendRelationInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送操作好友结果给操作人
	 */
	public class ResOperationFriendResultMessage extends Message {
	
		//被操作源的关系信息
		private var _friendRelationInfo: FriendRelationInfo;
		
		//操作类型(1 添加 2 删除 3 移动 )
		private var _operationType: int;
		
		//结果(0 成功 1失败)
		private var _result: int;
		
		//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )如果是移动操作则此为原关系
		private var _relationType: int;
		
		//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )仅移动操作使用,此为目标关系
		private var _relationTargetType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//被操作源的关系信息
			writeBean(_friendRelationInfo);
			//操作类型(1 添加 2 删除 3 移动 )
			writeByte(_operationType);
			//结果(0 成功 1失败)
			writeByte(_result);
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )如果是移动操作则此为原关系
			writeByte(_relationType);
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )仅移动操作使用,此为目标关系
			writeByte(_relationTargetType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//被操作源的关系信息
			_friendRelationInfo = readBean(FriendRelationInfo) as FriendRelationInfo;
			//操作类型(1 添加 2 删除 3 移动 )
			_operationType = readByte();
			//结果(0 成功 1失败)
			_result = readByte();
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )如果是移动操作则此为原关系
			_relationType = readByte();
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )仅移动操作使用,此为目标关系
			_relationTargetType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 116102;
		}
		
		/**
		 * get 被操作源的关系信息
		 * @return 
		 */
		public function get friendRelationInfo(): FriendRelationInfo{
			return _friendRelationInfo;
		}
		
		/**
		 * set 被操作源的关系信息
		 */
		public function set friendRelationInfo(value: FriendRelationInfo): void{
			this._friendRelationInfo = value;
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
		 * get 结果(0 成功 1失败)
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果(0 成功 1失败)
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
		/**
		 * get 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )如果是移动操作则此为原关系
		 * @return 
		 */
		public function get relationType(): int{
			return _relationType;
		}
		
		/**
		 * set 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )如果是移动操作则此为原关系
		 */
		public function set relationType(value: int): void{
			this._relationType = value;
		}
		
		/**
		 * get 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )仅移动操作使用,此为目标关系
		 * @return 
		 */
		public function get relationTargetType(): int{
			return _relationTargetType;
		}
		
		/**
		 * set 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人5最近联系人  )仅移动操作使用,此为目标关系
		 */
		public function set relationTargetType(value: int): void{
			this._relationTargetType = value;
		}
		
	}
}