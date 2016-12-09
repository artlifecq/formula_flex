package com.rpgGame.netData.equip.message{
	import com.rpgGame.netData.equip.bean.KindInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送补天神石使用消息
	 */
	public class ResBuTianShenShiKindInfoMessage extends Message {
	
		//当前部位数据
		private var _kindInfo: KindInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前部位数据
			writeBean(_kindInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前部位数据
			_kindInfo = readBean(KindInfo) as KindInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107104;
		}
		
		/**
		 * get 当前部位数据
		 * @return 
		 */
		public function get kindInfo(): KindInfo{
			return _kindInfo;
		}
		
		/**
		 * set 当前部位数据
		 */
		public function set kindInfo(value: KindInfo): void{
			this._kindInfo = value;
		}
		
	}
}