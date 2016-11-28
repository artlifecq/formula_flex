package com.rpgGame.netData.shop.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 刷新商品列表
	 */
	public class ReqRefreshShopMessage extends Message {
	
		//模型编号
		private var _shopModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//模型编号
			writeInt(_shopModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//模型编号
			_shopModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149207;
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
		
	}
}