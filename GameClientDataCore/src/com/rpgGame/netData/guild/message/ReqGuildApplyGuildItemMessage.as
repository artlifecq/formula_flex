package com.rpgGame.netData.guild.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 申请帮会物品
	 */
	public class ReqGuildApplyGuildItemMessage extends Message {
	
		//物品ID
		private var _itemId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品ID
			writeLong(_itemId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品ID
			_itemId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111233;
		}
		
		/**
		 * get 物品ID
		 * @return 
		 */
		public function get itemId(): long{
			return _itemId;
		}
		
		/**
		 * set 物品ID
		 */
		public function set itemId(value: long): void{
			this._itemId = value;
		}
		
	}
}