package com.rpgGame.netData.offlineres.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取离线收益消息
	 */
	public class ReqGetOfflineAwardMessage extends Message {
	
		//领取倍数
		private var _multiple: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//领取倍数
			writeByte(_multiple);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//领取倍数
			_multiple = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 209201;
		}
		
		/**
		 * get 领取倍数
		 * @return 
		 */
		public function get multiple(): int{
			return _multiple;
		}
		
		/**
		 * set 领取倍数
		 */
		public function set multiple(value: int): void{
			this._multiple = value;
		}
		
	}
}