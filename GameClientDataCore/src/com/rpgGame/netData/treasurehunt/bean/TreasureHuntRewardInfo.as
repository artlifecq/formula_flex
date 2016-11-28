package com.rpgGame.netData.treasurehunt.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 寻宝获取的奖励数据
	 */
	public class TreasureHuntRewardInfo extends Bean {
	
		//自增ID
		private var _addId: int;
		
		//获得元宝数
		private var _getGold: int;
		
		//道具模版ID(元宝特殊处理)
		private var _itemModelId: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//自增ID
			writeInt(_addId);
			//获得元宝数
			writeInt(_getGold);
			//道具模版ID(元宝特殊处理)
			writeInt(_itemModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//自增ID
			_addId = readInt();
			//获得元宝数
			_getGold = readInt();
			//道具模版ID(元宝特殊处理)
			_itemModelId = readInt();
			return true;
		}
		
		/**
		 * get 自增ID
		 * @return 
		 */
		public function get addId(): int{
			return _addId;
		}
		
		/**
		 * set 自增ID
		 */
		public function set addId(value: int): void{
			this._addId = value;
		}
		
		/**
		 * get 获得元宝数
		 * @return 
		 */
		public function get getGold(): int{
			return _getGold;
		}
		
		/**
		 * set 获得元宝数
		 */
		public function set getGold(value: int): void{
			this._getGold = value;
		}
		
		/**
		 * get 道具模版ID(元宝特殊处理)
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 道具模版ID(元宝特殊处理)
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
	}
}