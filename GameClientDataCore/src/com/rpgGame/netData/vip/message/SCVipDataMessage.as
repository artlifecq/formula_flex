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
	 * VIP信息消息
	 */
	public class SCVipDataMessage extends Message {
	
		//当前vip开通信息
		private var _cardInfos: Vector.<VipCardInfo> = new Vector.<VipCardInfo>();
		//剩余时间
		private var _remain: int;
		
		//当前VIP等级
		private var _curVipId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前vip开通信息
			writeShort(_cardInfos.length);
			for (i = 0; i < _cardInfos.length; i++) {
				writeBean(_cardInfos[i]);
			}
			//剩余时间
			writeInt(_remain);
			//当前VIP等级
			writeInt(_curVipId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前vip开通信息
			var cardInfos_length : int = readShort();
			for (i = 0; i < cardInfos_length; i++) {
				_cardInfos[i] = readBean(VipCardInfo) as VipCardInfo;
			}
			//剩余时间
			_remain = readInt();
			//当前VIP等级
			_curVipId = readInt();
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
		public function get cardInfos(): Vector.<VipCardInfo>{
			return _cardInfos;
		}
		
		/**
		 * set 当前vip开通信息
		 */
		public function set cardInfos(value: Vector.<VipCardInfo>): void{
			this._cardInfos = value;
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
		 * get 当前VIP等级
		 * @return 
		 */
		public function get curVipId(): int{
			return _curVipId;
		}
		
		/**
		 * set 当前VIP等级
		 */
		public function set curVipId(value: int): void{
			this._curVipId = value;
		}
		
	}
}