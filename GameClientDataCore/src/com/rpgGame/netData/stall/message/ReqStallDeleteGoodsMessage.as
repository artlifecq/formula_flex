package com.rpgGame.netData.stall.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 商品下架
	 */
	public class ReqStallDeleteGoodsMessage extends Message {
	
		//道具唯一ID，-1元宝，-2金币
		private var _goodsId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具唯一ID，-1元宝，-2金币
			writeLong(_goodsId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具唯一ID，-1元宝，-2金币
			_goodsId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142204;
		}
		
		/**
		 * get 道具唯一ID，-1元宝，-2金币
		 * @return 
		 */
		public function get goodsId(): long{
			return _goodsId;
		}
		
		/**
		 * set 道具唯一ID，-1元宝，-2金币
		 */
		public function set goodsId(value: long): void{
			this._goodsId = value;
		}
		
	}
}