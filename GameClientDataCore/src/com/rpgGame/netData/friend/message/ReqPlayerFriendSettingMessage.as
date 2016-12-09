package com.rpgGame.netData.friend.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求或者保存玩家好友设置和相关信息
	 */
	public class ReqPlayerFriendSettingMessage extends Message {
	
		//操作类型(1 请求获取 2是保存 )
		private var _operationType: int;
		
		//拒绝等级差
		private var _leveldiff: int;
		
		//是否公开我的地图位置0显示 1不显示
		private var _openMapLocation: int;
		
		//是否显示不在线的好友或仇人0显示 1不显示
		private var _showRelation: int;
		
		//是否显示不在线的好友或仇人0显示 1不显示
		private var _showIcon: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作类型(1 请求获取 2是保存 )
			writeByte(_operationType);
			//拒绝等级差
			writeInt(_leveldiff);
			//是否公开我的地图位置0显示 1不显示
			writeByte(_openMapLocation);
			//是否显示不在线的好友或仇人0显示 1不显示
			writeByte(_showRelation);
			//是否显示不在线的好友或仇人0显示 1不显示
			writeByte(_showIcon);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作类型(1 请求获取 2是保存 )
			_operationType = readByte();
			//拒绝等级差
			_leveldiff = readInt();
			//是否公开我的地图位置0显示 1不显示
			_openMapLocation = readByte();
			//是否显示不在线的好友或仇人0显示 1不显示
			_showRelation = readByte();
			//是否显示不在线的好友或仇人0显示 1不显示
			_showIcon = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 116204;
		}
		
		/**
		 * get 操作类型(1 请求获取 2是保存 )
		 * @return 
		 */
		public function get operationType(): int{
			return _operationType;
		}
		
		/**
		 * set 操作类型(1 请求获取 2是保存 )
		 */
		public function set operationType(value: int): void{
			this._operationType = value;
		}
		
		/**
		 * get 拒绝等级差
		 * @return 
		 */
		public function get leveldiff(): int{
			return _leveldiff;
		}
		
		/**
		 * set 拒绝等级差
		 */
		public function set leveldiff(value: int): void{
			this._leveldiff = value;
		}
		
		/**
		 * get 是否公开我的地图位置0显示 1不显示
		 * @return 
		 */
		public function get openMapLocation(): int{
			return _openMapLocation;
		}
		
		/**
		 * set 是否公开我的地图位置0显示 1不显示
		 */
		public function set openMapLocation(value: int): void{
			this._openMapLocation = value;
		}
		
		/**
		 * get 是否显示不在线的好友或仇人0显示 1不显示
		 * @return 
		 */
		public function get showRelation(): int{
			return _showRelation;
		}
		
		/**
		 * set 是否显示不在线的好友或仇人0显示 1不显示
		 */
		public function set showRelation(value: int): void{
			this._showRelation = value;
		}
		
		/**
		 * get 是否显示不在线的好友或仇人0显示 1不显示
		 * @return 
		 */
		public function get showIcon(): int{
			return _showIcon;
		}
		
		/**
		 * set 是否显示不在线的好友或仇人0显示 1不显示
		 */
		public function set showIcon(value: int): void{
			this._showIcon = value;
		}
		
	}
}