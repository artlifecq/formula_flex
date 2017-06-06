package com.rpgGame.netData.warFlag.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战旗基本数据信息
	 */
	public class WarFlagDataInfo extends Bean {
	
		//战旗当前祝福值
		private var _exp: int;
		
		//战旗当前阶数
		private var _warFlagModelId: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战旗当前祝福值
			writeInt(_exp);
			//战旗当前阶数
			writeInt(_warFlagModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战旗当前祝福值
			_exp = readInt();
			//战旗当前阶数
			_warFlagModelId = readInt();
			return true;
		}
		
		/**
		 * get 战旗当前祝福值
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 战旗当前祝福值
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
		/**
		 * get 战旗当前阶数
		 * @return 
		 */
		public function get warFlagModelId(): int{
			return _warFlagModelId;
		}
		
		/**
		 * set 战旗当前阶数
		 */
		public function set warFlagModelId(value: int): void{
			this._warFlagModelId = value;
		}
		
	}
}