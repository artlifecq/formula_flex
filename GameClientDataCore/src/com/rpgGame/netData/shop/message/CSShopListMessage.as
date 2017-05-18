package com.rpgGame.netData.shop.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求商店出售物品列表
	 */
	public class CSShopListMessage extends Message {
	
		//模型编号
		private var _shopModelId: int;
		
		//商店页面编号
		private var _shopPageId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//模型编号
			writeInt(_shopModelId);
			//商店页面编号
			writeInt(_shopPageId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//模型编号
			_shopModelId = readInt();
			//商店页面编号
			_shopPageId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149205;
		}
		
		/**
		 * get 模型编号
		 * @return 
		 */
		public function get shopModelId(): int{
			return _shopModelId;
		}
		
		/**
		 * set 模型编号
		 */
		public function set shopModelId(value: int): void{
			this._shopModelId = value;
		}
		
		/**
		 * get 商店页面编号
		 * @return 
		 */
		public function get shopPageId(): int{
			return _shopPageId;
		}
		
		/**
		 * set 商店页面编号
		 */
		public function set shopPageId(value: int): void{
			this._shopPageId = value;
		}
		
	}
}