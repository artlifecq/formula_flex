package com.rpgGame.netData.meridian.message{
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送单个信息
	 */
	public class SCMeridianInfoMessage extends Message {
	
		//1 升级  2 镶嵌
		private var _reason: int;
		
		//穴位信息
		private var _info: AcuPointInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 升级  2 镶嵌
			writeByte(_reason);
			//穴位信息
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 升级  2 镶嵌
			_reason = readByte();
			//穴位信息
			_info = readBean(AcuPointInfo) as AcuPointInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 225102;
		}
		
		/**
		 * get 1 升级  2 镶嵌
		 * @return 
		 */
		public function get reason(): int{
			return _reason;
		}
		
		/**
		 * set 1 升级  2 镶嵌
		 */
		public function set reason(value: int): void{
			this._reason = value;
		}
		
		/**
		 * get 穴位信息
		 * @return 
		 */
		public function get info(): AcuPointInfo{
			return _info;
		}
		
		/**
		 * set 穴位信息
		 */
		public function set info(value: AcuPointInfo): void{
			this._info = value;
		}
		
	}
}