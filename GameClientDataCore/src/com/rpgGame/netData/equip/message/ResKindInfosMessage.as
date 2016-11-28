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
	 * 发送所有部位消息
	 */
	public class ResKindInfosMessage extends Message {
	
		//部位数据
		private var _kindInfo: Vector.<KindInfo> = new Vector.<KindInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//部位数据
			writeShort(_kindInfo.length);
			for (i = 0; i < _kindInfo.length; i++) {
				writeBean(_kindInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//部位数据
			var kindInfo_length : int = readShort();
			for (i = 0; i < kindInfo_length; i++) {
				_kindInfo[i] = readBean(KindInfo) as KindInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107103;
		}
		
		/**
		 * get 部位数据
		 * @return 
		 */
		public function get kindInfo(): Vector.<KindInfo>{
			return _kindInfo;
		}
		
		/**
		 * set 部位数据
		 */
		public function set kindInfo(value: Vector.<KindInfo>): void{
			this._kindInfo = value;
		}
		
	}
}