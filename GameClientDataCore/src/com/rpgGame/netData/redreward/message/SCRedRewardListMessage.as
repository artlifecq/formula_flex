package com.rpgGame.netData.redreward.message{
	import com.rpgGame.netData.redreward.bean.RedRewardState;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 红包列表信息
	 */
	public class SCRedRewardListMessage extends Message {
		
		//本月红包已领取数量
		private var _monthCount: int;
		
		//红包列表
		private var _redRewards: Vector.<RedRewardState> = new Vector.<RedRewardState>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//本月红包已领取数量
			writeInt(_monthCount);
			//红包列表
			writeShort(_redRewards.length);
			for (i = 0; i < _redRewards.length; i++) {
				writeBean(_redRewards[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//本月红包已领取数量
			_monthCount = readInt();
			//红包列表
			var redRewards_length : int = readShort();
			for (i = 0; i < redRewards_length; i++) {
				_redRewards[i] = readBean(RedRewardState) as RedRewardState;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 254105;
		}
		
		/**
		 * get 本月红包已领取数量
		 * @return 
		 */
		public function get monthCount(): int{
			return _monthCount;
		}
		
		/**
		 * set 本月红包已领取数量
		 */
		public function set monthCount(value: int): void{
			this._monthCount = value;
		}
		
		/**
		 * get 红包列表
		 * @return 
		 */
		public function get redRewards(): Vector.<RedRewardState>{
			return _redRewards;
		}
		
		/**
		 * set 红包列表
		 */
		public function set redRewards(value: Vector.<RedRewardState>): void{
			this._redRewards = value;
		}
		
	}
}