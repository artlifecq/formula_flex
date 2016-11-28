package com.rpgGame.netData.refining.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 锻造物品列表消息
	 */
	public class ResRefiningItemInfosMessage extends Message {
	
		//锻造物品列表
		private var _iteminfoList: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//锻造物品列表
			writeShort(_iteminfoList.length);
			for (i = 0; i < _iteminfoList.length; i++) {
				writeBean(_iteminfoList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//锻造物品列表
			var iteminfoList_length : int = readShort();
			for (i = 0; i < iteminfoList_length; i++) {
				_iteminfoList[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204103;
		}
		
		/**
		 * get 锻造物品列表
		 * @return 
		 */
		public function get iteminfoList(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _iteminfoList;
		}
		
		/**
		 * set 锻造物品列表
		 */
		public function set iteminfoList(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._iteminfoList = value;
		}
		
	}
}