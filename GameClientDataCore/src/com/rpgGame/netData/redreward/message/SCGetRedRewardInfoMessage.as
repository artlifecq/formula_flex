package com.rpgGame.netData.redreward.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新红包信息
	 */
	public class SCGetRedRewardInfoMessage extends Message {
		
		//今日可领取数量
		private var _count: int;
		
		//可发红包数量
		private var _sendcount: int;
		
		//红包数量
		private var _redCount: int;
		
		//是否充值(0否1是)
		private var _recharged: int;
		
		//红包面板状态(0不弹面板1弹面板)
		private var _panelState: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//今日可领取数量
			writeShort(_count);
			//可发红包数量
			writeShort(_sendcount);
			//红包数量
			writeShort(_redCount);
			//是否充值(0否1是)
			writeByte(_recharged);
			//红包面板状态(0不弹面板1弹面板)
			writeByte(_panelState);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//今日可领取数量
			_count = readShort();
			//可发红包数量
			_sendcount = readShort();
			//红包数量
			_redCount = readShort();
			//是否充值(0否1是)
			_recharged = readByte();
			//红包面板状态(0不弹面板1弹面板)
			_panelState = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 254101;
		}
		
		/**
		 * get 今日可领取数量
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 今日可领取数量
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
		/**
		 * get 可发红包数量
		 * @return 
		 */
		public function get sendcount(): int{
			return _sendcount;
		}
		
		/**
		 * set 可发红包数量
		 */
		public function set sendcount(value: int): void{
			this._sendcount = value;
		}
		
		/**
		 * get 红包数量
		 * @return 
		 */
		public function get redCount(): int{
			return _redCount;
		}
		
		/**
		 * set 红包数量
		 */
		public function set redCount(value: int): void{
			this._redCount = value;
		}
		
		/**
		 * get 是否充值(0否1是)
		 * @return 
		 */
		public function get recharged(): int{
			return _recharged;
		}
		
		/**
		 * set 是否充值(0否1是)
		 */
		public function set recharged(value: int): void{
			this._recharged = value;
		}
		
		/**
		 * get 红包面板状态(0不弹面板1弹面板)
		 * @return 
		 */
		public function get panelState(): int{
			return _panelState;
		}
		
		/**
		 * set 红包面板状态(0不弹面板1弹面板)
		 */
		public function set panelState(value: int): void{
			this._panelState = value;
		}
		
	}
}