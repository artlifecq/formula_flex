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
	 * 强化装备结果
	 */
	public class ResStrengthenResultMessage extends Message {
	
		//操作类型(1 强化 2注灵 3觉醒 4添加强化次数 5添加注灵次数)
		private var _type: int;
		
		//0不成功 1成功
		private var _suc: int;
		
		//成功后变动物品你信息
		private var _itemInfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作类型(1 强化 2注灵 3觉醒 4添加强化次数 5添加注灵次数)
			writeByte(_type);
			//0不成功 1成功
			writeByte(_suc);
			//成功后变动物品你信息
			writeBean(_itemInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作类型(1 强化 2注灵 3觉醒 4添加强化次数 5添加注灵次数)
			_type = readByte();
			//0不成功 1成功
			_suc = readByte();
			//成功后变动物品你信息
			_itemInfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204102;
		}
		
		/**
		 * get 操作类型(1 强化 2注灵 3觉醒 4添加强化次数 5添加注灵次数)
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 操作类型(1 强化 2注灵 3觉醒 4添加强化次数 5添加注灵次数)
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 0不成功 1成功
		 * @return 
		 */
		public function get suc(): int{
			return _suc;
		}
		
		/**
		 * set 0不成功 1成功
		 */
		public function set suc(value: int): void{
			this._suc = value;
		}
		
		/**
		 * get 成功后变动物品你信息
		 * @return 
		 */
		public function get itemInfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _itemInfo;
		}
		
		/**
		 * set 成功后变动物品你信息
		 */
		public function set itemInfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._itemInfo = value;
		}
		
	}
}