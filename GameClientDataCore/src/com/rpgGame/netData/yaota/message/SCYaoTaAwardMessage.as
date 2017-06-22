package com.rpgGame.netData.yaota.message{
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	import com.rpgGame.netData.yaota.bean.YaoTaInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 妖塔奖励显示
	 */
	public class SCYaoTaAwardMessage extends Message {
	
		//自己的数据
		private var _myYaoTaInfo: YaoTaInfo;
		
		//奖励
		private var _tempItems: Vector.<com.rpgGame.netData.backpack.bean.TempItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.TempItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//自己的数据
			writeBean(_myYaoTaInfo);
			//奖励
			writeShort(_tempItems.length);
			for (i = 0; i < _tempItems.length; i++) {
				writeBean(_tempItems[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//自己的数据
			_myYaoTaInfo = readBean(YaoTaInfo) as YaoTaInfo;
			//奖励
			var tempItems_length : int = readShort();
			for (i = 0; i < tempItems_length; i++) {
				_tempItems[i] = readBean(com.rpgGame.netData.backpack.bean.TempItemInfo) as com.rpgGame.netData.backpack.bean.TempItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129109;
		}
		
		/**
		 * get 自己的数据
		 * @return 
		 */
		public function get myYaoTaInfo(): YaoTaInfo{
			return _myYaoTaInfo;
		}
		
		/**
		 * set 自己的数据
		 */
		public function set myYaoTaInfo(value: YaoTaInfo): void{
			this._myYaoTaInfo = value;
		}
		
		/**
		 * get 奖励
		 * @return 
		 */
		public function get tempItems(): Vector.<com.rpgGame.netData.backpack.bean.TempItemInfo>{
			return _tempItems;
		}
		
		/**
		 * set 奖励
		 */
		public function set tempItems(value: Vector.<com.rpgGame.netData.backpack.bean.TempItemInfo>): void{
			this._tempItems = value;
		}
		
	}
}