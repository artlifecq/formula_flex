package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildStoreOptInfo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送帮会仓库物品信息
	 */
	public class ResSendGuildStoreInfoMessage extends Message {
	
		//最大格子
		private var _maxCell: int;
		
		//物品信息列表
		private var _items: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//操作记录
		private var _storeOpts: Vector.<GuildStoreOptInfo> = new Vector.<GuildStoreOptInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//最大格子
			writeInt(_maxCell);
			//物品信息列表
			writeShort(_items.length);
			for (i = 0; i < _items.length; i++) {
				writeBean(_items[i]);
			}
			//操作记录
			writeShort(_storeOpts.length);
			for (i = 0; i < _storeOpts.length; i++) {
				writeBean(_storeOpts[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//最大格子
			_maxCell = readInt();
			//物品信息列表
			var items_length : int = readShort();
			for (i = 0; i < items_length; i++) {
				_items[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//操作记录
			var storeOpts_length : int = readShort();
			for (i = 0; i < storeOpts_length; i++) {
				_storeOpts[i] = readBean(GuildStoreOptInfo) as GuildStoreOptInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111401;
		}
		
		/**
		 * get 最大格子
		 * @return 
		 */
		public function get maxCell(): int{
			return _maxCell;
		}
		
		/**
		 * set 最大格子
		 */
		public function set maxCell(value: int): void{
			this._maxCell = value;
		}
		
		/**
		 * get 物品信息列表
		 * @return 
		 */
		public function get items(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _items;
		}
		
		/**
		 * set 物品信息列表
		 */
		public function set items(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._items = value;
		}
		
		/**
		 * get 操作记录
		 * @return 
		 */
		public function get storeOpts(): Vector.<GuildStoreOptInfo>{
			return _storeOpts;
		}
		
		/**
		 * set 操作记录
		 */
		public function set storeOpts(value: Vector.<GuildStoreOptInfo>): void{
			this._storeOpts = value;
		}
		
	}
}