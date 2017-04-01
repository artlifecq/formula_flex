package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 删除私有物品
	 */
	public class ResRemovePrivateItemMessage extends Message {
	
		//类型
		private var _type: int;
		
		//删除类型 0发送失败 1发背包 2发邮件
		private var _removeType: int;
		
		//私有物品特殊唯一Id列表
		private var _itemUIds: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//类型
			writeInt(_type);
			//删除类型 0发送失败 1发背包 2发邮件
			writeInt(_removeType);
			//私有物品特殊唯一Id列表
			writeShort(_itemUIds.length);
			for (i = 0; i < _itemUIds.length; i++) {
				writeInt(_itemUIds[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//类型
			_type = readInt();
			//删除类型 0发送失败 1发背包 2发邮件
			_removeType = readInt();
			//私有物品特殊唯一Id列表
			var itemUIds_length : int = readShort();
			for (i = 0; i < itemUIds_length; i++) {
				_itemUIds[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108114;
		}
		
		/**
		 * get 类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 删除类型 0发送失败 1发背包 2发邮件
		 * @return 
		 */
		public function get removeType(): int{
			return _removeType;
		}
		
		/**
		 * set 删除类型 0发送失败 1发背包 2发邮件
		 */
		public function set removeType(value: int): void{
			this._removeType = value;
		}
		
		/**
		 * get 私有物品特殊唯一Id列表
		 * @return 
		 */
		public function get itemUIds(): Vector.<int>{
			return _itemUIds;
		}
		
		/**
		 * set 私有物品特殊唯一Id列表
		 */
		public function set itemUIds(value: Vector.<int>): void{
			this._itemUIds = value;
		}
		
	}
}