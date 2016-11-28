package com.rpgGame.netData.chat.bean{
	import com.rpgGame.netData.chat.bean.ChatGoodInfo;
	import com.rpgGame.netData.chat.bean.HyperInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 聊天返回的附加信息
	 */
	public class ExtraResInfo extends Bean {
	
		//目标玩家名称
		private var _targetPlayerName: String;
		
		//发送者vip等级,-1表示引导员(优先显示)
		private var _viplevel: int;
		
		//发送者帮会职位
		private var _guildOfficial: int;
		
		//展示内容列表
		private var _hyperInfos: Vector.<HyperInfo> = new Vector.<HyperInfo>();
		//物品信息
		private var _itemInfos: Vector.<ChatGoodInfo> = new Vector.<ChatGoodInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//目标玩家名称
			writeString(_targetPlayerName);
			//发送者vip等级,-1表示引导员(优先显示)
			writeByte(_viplevel);
			//发送者帮会职位
			writeByte(_guildOfficial);
			//展示内容列表
			writeShort(_hyperInfos.length);
			for (var i: int = 0; i < _hyperInfos.length; i++) {
				writeBean(_hyperInfos[i]);
			}
			//物品信息
			writeShort(_itemInfos.length);
			for (var i: int = 0; i < _itemInfos.length; i++) {
				writeBean(_itemInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//目标玩家名称
			_targetPlayerName = readString();
			//发送者vip等级,-1表示引导员(优先显示)
			_viplevel = readByte();
			//发送者帮会职位
			_guildOfficial = readByte();
			//展示内容列表
			var hyperInfos_length : int = readShort();
			for (var i: int = 0; i < hyperInfos_length; i++) {
				_hyperInfos[i] = readBean(HyperInfo) as HyperInfo;
			}
			//物品信息
			var itemInfos_length : int = readShort();
			for (var i: int = 0; i < itemInfos_length; i++) {
				_itemInfos[i] = readBean(ChatGoodInfo) as ChatGoodInfo;
			}
			return true;
		}
		
		/**
		 * get 目标玩家名称
		 * @return 
		 */
		public function get targetPlayerName(): String{
			return _targetPlayerName;
		}
		
		/**
		 * set 目标玩家名称
		 */
		public function set targetPlayerName(value: String): void{
			this._targetPlayerName = value;
		}
		
		/**
		 * get 发送者vip等级,-1表示引导员(优先显示)
		 * @return 
		 */
		public function get viplevel(): int{
			return _viplevel;
		}
		
		/**
		 * set 发送者vip等级,-1表示引导员(优先显示)
		 */
		public function set viplevel(value: int): void{
			this._viplevel = value;
		}
		
		/**
		 * get 发送者帮会职位
		 * @return 
		 */
		public function get guildOfficial(): int{
			return _guildOfficial;
		}
		
		/**
		 * set 发送者帮会职位
		 */
		public function set guildOfficial(value: int): void{
			this._guildOfficial = value;
		}
		
		/**
		 * get 展示内容列表
		 * @return 
		 */
		public function get hyperInfos(): Vector.<HyperInfo>{
			return _hyperInfos;
		}
		
		/**
		 * set 展示内容列表
		 */
		public function set hyperInfos(value: Vector.<HyperInfo>): void{
			this._hyperInfos = value;
		}
		
		/**
		 * get 物品信息
		 * @return 
		 */
		public function get itemInfos(): Vector.<ChatGoodInfo>{
			return _itemInfos;
		}
		
		/**
		 * set 物品信息
		 */
		public function set itemInfos(value: Vector.<ChatGoodInfo>): void{
			this._itemInfos = value;
		}
		
	}
}