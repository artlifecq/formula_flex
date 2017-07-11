package com.rpgGame.netData.guildWar.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 阵营矿信息
	 */
	public class CampOreInfo extends Bean {
	
		//矿刷新Id
		private var _oreId: int;
		
		//矿刷配置Id
		private var _oreCfgId: int;
		
		//当前数量
		private var _curNum: int;
		
		//最大数量
		private var _maxNum: int;
		
		//下次刷新时间(s)
		private var _nextRefreshTime: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//矿刷新Id
			writeInt(_oreId);
			//矿刷配置Id
			writeInt(_oreCfgId);
			//当前数量
			writeInt(_curNum);
			//最大数量
			writeInt(_maxNum);
			//下次刷新时间(s)
			writeInt(_nextRefreshTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//矿刷新Id
			_oreId = readInt();
			//矿刷配置Id
			_oreCfgId = readInt();
			//当前数量
			_curNum = readInt();
			//最大数量
			_maxNum = readInt();
			//下次刷新时间(s)
			_nextRefreshTime = readInt();
			return true;
		}
		
		/**
		 * get 矿刷新Id
		 * @return 
		 */
		public function get oreId(): int{
			return _oreId;
		}
		
		/**
		 * set 矿刷新Id
		 */
		public function set oreId(value: int): void{
			this._oreId = value;
		}
		
		/**
		 * get 矿刷配置Id
		 * @return 
		 */
		public function get oreCfgId(): int{
			return _oreCfgId;
		}
		
		/**
		 * set 矿刷配置Id
		 */
		public function set oreCfgId(value: int): void{
			this._oreCfgId = value;
		}
		
		/**
		 * get 当前数量
		 * @return 
		 */
		public function get curNum(): int{
			return _curNum;
		}
		
		/**
		 * set 当前数量
		 */
		public function set curNum(value: int): void{
			this._curNum = value;
		}
		
		/**
		 * get 最大数量
		 * @return 
		 */
		public function get maxNum(): int{
			return _maxNum;
		}
		
		/**
		 * set 最大数量
		 */
		public function set maxNum(value: int): void{
			this._maxNum = value;
		}
		
		/**
		 * get 下次刷新时间(s)
		 * @return 
		 */
		public function get nextRefreshTime(): int{
			return _nextRefreshTime;
		}
		
		/**
		 * set 下次刷新时间(s)
		 */
		public function set nextRefreshTime(value: int): void{
			this._nextRefreshTime = value;
		}
		
	}
}