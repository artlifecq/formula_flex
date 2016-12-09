package com.rpgGame.netData.crossdatasync.message{
	import com.rpgGame.netData.vip.bean.VipCardInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 开通vip同步到战斗服
	 */
	public class ReqOptainVipToFightMessage extends Message {
	
		//vip card
		private var _card: com.rpgGame.netData.vip.bean.VipCardInfo;
		
		//结束时间
		private var _endTime: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//vip card
			writeBean(_card);
			//结束时间
			writeLong(_endTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//vip card
			_card = readBean(com.rpgGame.netData.vip.bean.VipCardInfo) as com.rpgGame.netData.vip.bean.VipCardInfo;
			//结束时间
			_endTime = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251280;
		}
		
		/**
		 * get vip card
		 * @return 
		 */
		public function get card(): com.rpgGame.netData.vip.bean.VipCardInfo{
			return _card;
		}
		
		/**
		 * set vip card
		 */
		public function set card(value: com.rpgGame.netData.vip.bean.VipCardInfo): void{
			this._card = value;
		}
		
		/**
		 * get 结束时间
		 * @return 
		 */
		public function get endTime(): long{
			return _endTime;
		}
		
		/**
		 * set 结束时间
		 */
		public function set endTime(value: long): void{
			this._endTime = value;
		}
		
	}
}