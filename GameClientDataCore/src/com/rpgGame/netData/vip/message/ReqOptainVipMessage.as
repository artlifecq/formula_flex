package com.rpgGame.netData.vip.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 开通/续费vip
	 */
	public class ReqOptainVipMessage extends Message {
	
		//vip类型  对应vip表Id
		private var _vipId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//vip类型  对应vip表Id
			writeShort(_vipId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//vip类型  对应vip表Id
			_vipId = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 191202;
		}
		
		/**
		 * get vip类型  对应vip表Id
		 * @return 
		 */
		public function get vipId(): int{
			return _vipId;
		}
		
		/**
		 * set vip类型  对应vip表Id
		 */
		public function set vipId(value: int): void{
			this._vipId = value;
		}
		
	}
}