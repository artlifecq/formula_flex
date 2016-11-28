package com.rpgGame.netData.vip.message{
	import com.rpgGame.netData.vip.bean.VipCardInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 离线收益面板信息消息
	 */
	public class ResVipPanelMessage extends Message {
	
		//当前vip开通信息
		private var _cardInfo: Vector.<VipCardInfo> = new Vector.<VipCardInfo>();
		//剩余时间
		private var _remain: int;
		
		//当前vip级别
		private var _validVipId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前vip开通信息
			writeShort(_cardInfo.length);
			for (i = 0; i < _cardInfo.length; i++) {
				writeBean(_cardInfo[i]);
			}
			//剩余时间
			writeInt(_remain);
			//当前vip级别
			writeInt(_validVipId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前vip开通信息
			var cardInfo_length : int = readShort();
			for (i = 0; i < cardInfo_length; i++) {
				_cardInfo[i] = readBean(VipCardInfo) as VipCardInfo;
			}
			//剩余时间
			_remain = readInt();
			//当前vip级别
			_validVipId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 191101;
		}
		
		/**
		 * get 当前vip开通信息
		 * @return 
		 */
		public function get cardInfo(): Vector.<VipCardInfo>{
			return _cardInfo;
		}
		
		/**
		 * set 当前vip开通信息
		 */
		public function set cardInfo(value: Vector.<VipCardInfo>): void{
			this._cardInfo = value;
		}
		
		/**
		 * get 剩余时间
		 * @return 
		 */
		public function get remain(): int{
			return _remain;
		}
		
		/**
		 * set 剩余时间
		 */
		public function set remain(value: int): void{
			this._remain = value;
		}
		
		/**
		 * get 当前vip级别
		 * @return 
		 */
		public function get validVipId(): int{
			return _validVipId;
		}
		
		/**
		 * set 当前vip级别
		 */
		public function set validVipId(value: int): void{
			this._validVipId = value;
		}
		
	}
}