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
	 * 发送摊位商品信息列表
	 */
	public class ResStallGoodsMessage extends Message {
	
		//商品大类型
		private var _maxType: int;
		
		//商品小类型
		private var _minType: int;
		
		//索引起点
		private var _indexStart: int;
		
		//索引终点
		private var _indexEnd: int;
		
		//摊位商品信息列表
		private var _stallGoodsInfoList: Vector.<StallGoodsInfo> = new Vector.<StallGoodsInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//商品大类型
			writeInt(_maxType);
			//商品小类型
			writeInt(_minType);
			//索引起点
			writeInt(_indexStart);
			//索引终点
			writeInt(_indexEnd);
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
			//商品大类型
			_maxType = readInt();
			//商品小类型
			_minType = readInt();
			//索引起点
			_indexStart = readInt();
			//索引终点
			_indexEnd = readInt();
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
			return 142101;
		}
		
		/**
		 * get 商品大类型
		 * @return 
		 */
		public function get maxType(): int{
			return _maxType;
		}
		
		/**
		 * set 商品大类型
		 */
		public function set maxType(value: int): void{
			this._maxType = value;
		}
		
		/**
		 * get 商品小类型
		 * @return 
		 */
		public function get minType(): int{
			return _minType;
		}
		
		/**
		 * set 商品小类型
		 */
		public function set minType(value: int): void{
			this._minType = value;
		}
		
		/**
		 * get 索引起点
		 * @return 
		 */
		public function get indexStart(): int{
			return _indexStart;
		}
		
		/**
		 * set 索引起点
		 */
		public function set indexStart(value: int): void{
			this._indexStart = value;
		}
		
		/**
		 * get 索引终点
		 * @return 
		 */
		public function get indexEnd(): int{
			return _indexEnd;
		}
		
		/**
		 * set 索引终点
		 */
		public function set indexEnd(value: int): void{
			this._indexEnd = value;
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