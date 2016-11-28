package com.rpgGame.netData.friend.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送好友设置给玩家
	 */
	public class ResPlayerFriendSettingMessage extends Message {
	
		//签名心情
		private var _signature: String;
		
		//是否公开我的地图位置0显示 1不显示
		private var _openMapLocation: int;
		
		//是否显示不在线的好友或仇人0显示 1不显示
		private var _showRelation: int;
		
		//是否显示不在线的好友或仇人0显示 1不显示
		private var _showIcon: int;
		
		//拒绝等级差
		private var _leveldiff: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//签名心情
			writeString(_signature);
			//是否公开我的地图位置0显示 1不显示
			writeByte(_openMapLocation);
			//是否显示不在线的好友或仇人0显示 1不显示
			writeByte(_showRelation);
			//是否显示不在线的好友或仇人0显示 1不显示
			writeByte(_showIcon);
			//拒绝等级差
			writeInt(_leveldiff);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//签名心情
			_signature = readString();
			//是否公开我的地图位置0显示 1不显示
			_openMapLocation = readByte();
			//是否显示不在线的好友或仇人0显示 1不显示
			_showRelation = readByte();
			//是否显示不在线的好友或仇人0显示 1不显示
			_showIcon = readByte();
			//拒绝等级差
			_leveldiff = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 116104;
		}
		
		/**
		 * get 签名心情
		 * @return 
		 */
		public function get signature(): String{
			return _signature;
		}
		
		/**
		 * set 签名心情
		 */
		public function set signature(value: String): void{
			this._signature = value;
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
		
	}
}