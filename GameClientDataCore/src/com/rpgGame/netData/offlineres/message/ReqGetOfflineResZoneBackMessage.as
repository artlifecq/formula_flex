package com.rpgGame.netData.offlineres.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取离线资源追回消息
	 */
	public class ReqGetOfflineResZoneBackMessage extends Message {
	
		//类型
		private var _type: int;
		
		//0金币 1 元宝
		private var _costType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型
			writeInt(_type);
			//0金币 1 元宝
			writeInt(_costType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型
			_type = readInt();
			//0金币 1 元宝
			_costType = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 209202;
		}
		
		/**
		 * get 类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 0金币 1 元宝
		 * @return 
		 */
		public function get costType(): int{
			return _costType;
		}
		
		/**
		 * set 0金币 1 元宝
		 */
		public function set costType(value: int): void{
			this._costType = value;
		}
		
	}
}