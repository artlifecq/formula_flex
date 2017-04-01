package com.rpgGame.netData.stall.message{
	import com.rpgGame.netData.stall.bean.StallGoodsInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 摊位搜索结果
	 */
	public class ResStallGoodsSearchMessage extends Message {
	
		//摊位商品信息列表
		private var _stallGoodsInfoList: Vector.<StallGoodsInfo> = new Vector.<StallGoodsInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//摊位商品信息列表
			writeShort(_stallGoodsInfoList.length);
			for (i = 0; i < _stallGoodsInfoList.length; i++) {
				writeBean(_stallGoodsInfoList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//摊位商品信息列表
			var stallGoodsInfoList_length : int = readShort();
			for (i = 0; i < stallGoodsInfoList_length; i++) {
				_stallGoodsInfoList[i] = readBean(StallGoodsInfo) as StallGoodsInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142104;
		}
		
		/**
		 * get 摊位商品信息列表
		 * @return 
		 */
		public function get stallGoodsInfoList(): Vector.<StallGoodsInfo>{
			return _stallGoodsInfoList;
		}
		
		/**
		 * set 摊位商品信息列表
		 */
		public function set stallGoodsInfoList(value: Vector.<StallGoodsInfo>): void{
			this._stallGoodsInfoList = value;
		}
		
	}
}