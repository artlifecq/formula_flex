package com.rpgGame.netData.gameactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领取返回消息
	 */
	public class SCOnlineRewardMessage extends Message {
	
		//表中的ID
		private var _time: int;
		
		//返回成功的物品ID
		private var _itemId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//表中的ID
			writeInt(_time);
			//返回成功的物品ID
			writeInt(_itemId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//表中的ID
			_time = readInt();
			//返回成功的物品ID
			_itemId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 411102;
		}
		
		/**
		 * get 表中的ID
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 表中的ID
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 返回成功的物品ID
		 * @return 
		 */
		public function get itemId(): int{
			return _itemId;
		}
		
		/**
		 * set 返回成功的物品ID
		 */
		public function set itemId(value: int): void{
			this._itemId = value;
		}
		
	}
}