package com.rpgGame.netData.redreward.message{
	import com.rpgGame.netData.redreward.bean.RedRewardPlayerInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 红包领取信息
	 */
	public class SCGetRedRewardInfosMessage extends Message {
		
		//红包获得者列表
		private var _rewardInfoList: Vector.<RedRewardPlayerInfo> = new Vector.<RedRewardPlayerInfo>();
		//自己获得礼金数量
		private var _seftCount: int;
		
		//是否领取多个
		private var _isMore: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//红包获得者列表
			writeShort(_rewardInfoList.length);
			for (i = 0; i < _rewardInfoList.length; i++) {
				writeBean(_rewardInfoList[i]);
			}
			//自己获得礼金数量
			writeByte(_seftCount);
			//是否领取多个
			writeByte(_isMore);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//红包获得者列表
			var rewardInfoList_length : int = readShort();
			for (i = 0; i < rewardInfoList_length; i++) {
				_rewardInfoList[i] = readBean(RedRewardPlayerInfo) as RedRewardPlayerInfo;
			}
			//自己获得礼金数量
			_seftCount = readByte();
			//是否领取多个
			_isMore = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 254102;
		}
		
		/**
		 * get 红包获得者列表
		 * @return 
		 */
		public function get rewardInfoList(): Vector.<RedRewardPlayerInfo>{
			return _rewardInfoList;
		}
		
		/**
		 * set 红包获得者列表
		 */
		public function set rewardInfoList(value: Vector.<RedRewardPlayerInfo>): void{
			this._rewardInfoList = value;
		}
		
		/**
		 * get 自己获得礼金数量
		 * @return 
		 */
		public function get seftCount(): int{
			return _seftCount;
		}
		
		/**
		 * set 自己获得礼金数量
		 */
		public function set seftCount(value: int): void{
			this._seftCount = value;
		}
		
		/**
		 * get 是否领取多个
		 * @return 
		 */
		public function get isMore(): int{
			return _isMore;
		}
		
		/**
		 * set 是否领取多个
		 */
		public function set isMore(value: int): void{
			this._isMore = value;
		}
		
	}
}