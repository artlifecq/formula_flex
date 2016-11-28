package com.rpgGame.netData.grown.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送成就基本信息
	 */
	public class ResGrownInfoMessage extends Message {
	
		//已领取的等级礼包
		private var _info: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//已领取的等级礼包
			writeShort(_info.length);
			for (i = 0; i < _info.length; i++) {
				writeInt(_info[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//已领取的等级礼包
			var info_length : int = readShort();
			for (i = 0; i < info_length; i++) {
				_info[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 192101;
		}
		
		/**
		 * get 已领取的等级礼包
		 * @return 
		 */
		public function get info(): Vector.<int>{
			return _info;
		}
		
		/**
		 * set 已领取的等级礼包
		 */
		public function set info(value: Vector.<int>): void{
			this._info = value;
		}
		
	}
}