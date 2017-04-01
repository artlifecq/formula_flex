package com.rpgGame.netData.stall.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求打开摊位商品信息列表
	 */
	public class ReqStallGoodsOpenMessage extends Message {
	
		//商品大类型
		private var _maxType: int;
		
		//商品小类型
		private var _minType: int;
		
		//商品品质 全部默认-1
		private var _quality: int;
		
		//商品等级 全部默认0
		private var _lvl: int;
		
		//模糊商品名称
		private var _searchName: String;
		
		//商品索引起点
		private var _indexStart: int;
		
		//商品索引终点
		private var _indexEnd: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//商品大类型
			writeInt(_maxType);
			//商品小类型
			writeInt(_minType);
			//商品品质 全部默认-1
			writeInt(_quality);
			//商品等级 全部默认0
			writeInt(_lvl);
			//模糊商品名称
			writeString(_searchName);
			//商品索引起点
			writeInt(_indexStart);
			//商品索引终点
			writeInt(_indexEnd);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//商品大类型
			_maxType = readInt();
			//商品小类型
			_minType = readInt();
			//商品品质 全部默认-1
			_quality = readInt();
			//商品等级 全部默认0
			_lvl = readInt();
			//模糊商品名称
			_searchName = readString();
			//商品索引起点
			_indexStart = readInt();
			//商品索引终点
			_indexEnd = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142201;
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
		 * get 商品品质 全部默认-1
		 * @return 
		 */
		public function get quality(): int{
			return _quality;
		}
		
		/**
		 * set 商品品质 全部默认-1
		 */
		public function set quality(value: int): void{
			this._quality = value;
		}
		
		/**
		 * get 商品等级 全部默认0
		 * @return 
		 */
		public function get lvl(): int{
			return _lvl;
		}
		
		/**
		 * set 商品等级 全部默认0
		 */
		public function set lvl(value: int): void{
			this._lvl = value;
		}
		
		/**
		 * get 模糊商品名称
		 * @return 
		 */
		public function get searchName(): String{
			return _searchName;
		}
		
		/**
		 * set 模糊商品名称
		 */
		public function set searchName(value: String): void{
			this._searchName = value;
		}
		
		/**
		 * get 商品索引起点
		 * @return 
		 */
		public function get indexStart(): int{
			return _indexStart;
		}
		
		/**
		 * set 商品索引起点
		 */
		public function set indexStart(value: int): void{
			this._indexStart = value;
		}
		
		/**
		 * get 商品索引终点
		 * @return 
		 */
		public function get indexEnd(): int{
			return _indexEnd;
		}
		
		/**
		 * set 商品索引终点
		 */
		public function set indexEnd(value: int): void{
			this._indexEnd = value;
		}
		
	}
}