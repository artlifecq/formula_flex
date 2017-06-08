package com.rpgGame.netData.pvp.message{
	import com.rpgGame.netData.pvp.bean.DianFengRankInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 打开巅峰排名返回
	 */
	public class SCOpenDianFengRankMessage extends Message {
	
		//排名
		private var _dianFengRankInfos: Vector.<DianFengRankInfo> = new Vector.<DianFengRankInfo>();
		//当前页
		private var _currentPage: int;
		
		//最大页
		private var _maxPage: int;
		
		//玩家自己的数据
		private var _dianFengRankInfo: DianFengRankInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//排名
			writeShort(_dianFengRankInfos.length);
			for (i = 0; i < _dianFengRankInfos.length; i++) {
				writeBean(_dianFengRankInfos[i]);
			}
			//当前页
			writeInt(_currentPage);
			//最大页
			writeInt(_maxPage);
			//玩家自己的数据
			writeBean(_dianFengRankInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//排名
			var dianFengRankInfos_length : int = readShort();
			for (i = 0; i < dianFengRankInfos_length; i++) {
				_dianFengRankInfos[i] = readBean(DianFengRankInfo) as DianFengRankInfo;
			}
			//当前页
			_currentPage = readInt();
			//最大页
			_maxPage = readInt();
			//玩家自己的数据
			_dianFengRankInfo = readBean(DianFengRankInfo) as DianFengRankInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 128111;
		}
		
		/**
		 * get 排名
		 * @return 
		 */
		public function get dianFengRankInfos(): Vector.<DianFengRankInfo>{
			return _dianFengRankInfos;
		}
		
		/**
		 * set 排名
		 */
		public function set dianFengRankInfos(value: Vector.<DianFengRankInfo>): void{
			this._dianFengRankInfos = value;
		}
		
		/**
		 * get 当前页
		 * @return 
		 */
		public function get currentPage(): int{
			return _currentPage;
		}
		
		/**
		 * set 当前页
		 */
		public function set currentPage(value: int): void{
			this._currentPage = value;
		}
		
		/**
		 * get 最大页
		 * @return 
		 */
		public function get maxPage(): int{
			return _maxPage;
		}
		
		/**
		 * set 最大页
		 */
		public function set maxPage(value: int): void{
			this._maxPage = value;
		}
		
		/**
		 * get 玩家自己的数据
		 * @return 
		 */
		public function get dianFengRankInfo(): DianFengRankInfo{
			return _dianFengRankInfo;
		}
		
		/**
		 * set 玩家自己的数据
		 */
		public function set dianFengRankInfo(value: DianFengRankInfo): void{
			this._dianFengRankInfo = value;
		}
		
	}
}