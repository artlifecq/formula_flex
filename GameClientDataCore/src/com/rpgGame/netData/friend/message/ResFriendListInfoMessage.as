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
	 * 发送好友列表信息
	 */
	public class ResFriendListInfoMessage extends Message {
	
		//好友列表信息
		private var _friendList: Vector.<FriendRelationInfo> = new Vector.<FriendRelationInfo>();
		//仇人信息列表
		private var _enemyList: Vector.<FriendRelationInfo> = new Vector.<FriendRelationInfo>();
		//黑名单信息列表
		private var _blackList: Vector.<FriendRelationInfo> = new Vector.<FriendRelationInfo>();
		//陌生人信息列表
		private var _strangerList: Vector.<FriendRelationInfo> = new Vector.<FriendRelationInfo>();
		//最近联系人信息列表
		private var _latelyList: Vector.<FriendRelationInfo> = new Vector.<FriendRelationInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//好友列表信息
			writeShort(_friendList.length);
			for (i = 0; i < _friendList.length; i++) {
				writeBean(_friendList[i]);
			}
			//仇人信息列表
			writeShort(_enemyList.length);
			for (i = 0; i < _enemyList.length; i++) {
				writeBean(_enemyList[i]);
			}
			//黑名单信息列表
			writeShort(_blackList.length);
			for (i = 0; i < _blackList.length; i++) {
				writeBean(_blackList[i]);
			}
			//陌生人信息列表
			writeShort(_strangerList.length);
			for (i = 0; i < _strangerList.length; i++) {
				writeBean(_strangerList[i]);
			}
			//最近联系人信息列表
			writeShort(_latelyList.length);
			for (i = 0; i < _latelyList.length; i++) {
				writeBean(_latelyList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//好友列表信息
			var friendList_length : int = readShort();
			for (i = 0; i < friendList_length; i++) {
				_friendList[i] = readBean(FriendRelationInfo) as FriendRelationInfo;
			}
			//仇人信息列表
			var enemyList_length : int = readShort();
			for (i = 0; i < enemyList_length; i++) {
				_enemyList[i] = readBean(FriendRelationInfo) as FriendRelationInfo;
			}
			//黑名单信息列表
			var blackList_length : int = readShort();
			for (i = 0; i < blackList_length; i++) {
				_blackList[i] = readBean(FriendRelationInfo) as FriendRelationInfo;
			}
			//陌生人信息列表
			var strangerList_length : int = readShort();
			for (i = 0; i < strangerList_length; i++) {
				_strangerList[i] = readBean(FriendRelationInfo) as FriendRelationInfo;
			}
			//最近联系人信息列表
			var latelyList_length : int = readShort();
			for (i = 0; i < latelyList_length; i++) {
				_latelyList[i] = readBean(FriendRelationInfo) as FriendRelationInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 116101;
		}
		
		/**
		 * get 好友列表信息
		 * @return 
		 */
		public function get friendList(): Vector.<FriendRelationInfo>{
			return _friendList;
		}
		
		/**
		 * set 好友列表信息
		 */
		public function set friendList(value: Vector.<FriendRelationInfo>): void{
			this._friendList = value;
		}
		
		/**
		 * get 仇人信息列表
		 * @return 
		 */
		public function get enemyList(): Vector.<FriendRelationInfo>{
			return _enemyList;
		}
		
		/**
		 * set 仇人信息列表
		 */
		public function set enemyList(value: Vector.<FriendRelationInfo>): void{
			this._enemyList = value;
		}
		
		/**
		 * get 黑名单信息列表
		 * @return 
		 */
		public function get blackList(): Vector.<FriendRelationInfo>{
			return _blackList;
		}
		
		/**
		 * set 黑名单信息列表
		 */
		public function set blackList(value: Vector.<FriendRelationInfo>): void{
			this._blackList = value;
		}
		
		/**
		 * get 陌生人信息列表
		 * @return 
		 */
		public function get strangerList(): Vector.<FriendRelationInfo>{
			return _strangerList;
		}
		
		/**
		 * set 陌生人信息列表
		 */
		public function set strangerList(value: Vector.<FriendRelationInfo>): void{
			this._strangerList = value;
		}
		
		/**
		 * get 最近联系人信息列表
		 * @return 
		 */
		public function get latelyList(): Vector.<FriendRelationInfo>{
			return _latelyList;
		}
		
		/**
		 * set 最近联系人信息列表
		 */
		public function set latelyList(value: Vector.<FriendRelationInfo>): void{
			this._latelyList = value;
		}
		
	}
}