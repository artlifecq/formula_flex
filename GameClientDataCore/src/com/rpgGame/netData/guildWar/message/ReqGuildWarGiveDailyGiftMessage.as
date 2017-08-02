package com.rpgGame.netData.guildWar.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取帮会战每日奖励
	 */
	public class ReqGuildWarGiveDailyGiftMessage extends Message {
	
		//1:皇城,0:其他,-1:智能选择
		private var _type: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1:皇城,0:其他,-1:智能选择
			writeByte(_type);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1:皇城,0:其他,-1:智能选择
			_type = readByte();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253203;
		}
		
		/**
		 * get 1:皇城,0:其他,-1:智能选择
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1:皇城,0:其他,-1:智能选择
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}