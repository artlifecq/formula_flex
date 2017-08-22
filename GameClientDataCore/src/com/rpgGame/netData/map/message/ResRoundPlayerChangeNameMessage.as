package com.rpgGame.netData.map.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 广播玩家改变名字消息
	 */
	public class ResRoundPlayerChangeNameMessage extends Message {
	
		//玩家Id
		private var _pid: long;
		
		//改变后名字(失败返回原名)
		private var _name: String;
		
		//修改是否成功(0.失败   1.成功)
		private var _success: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_pid);
			//改变后名字(失败返回原名)
			writeString(_name);
			//修改是否成功(0.失败   1.成功)
			writeByte(_success);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_pid = readLong();
			//改变后名字(失败返回原名)
			_name = readString();
			//修改是否成功(0.失败   1.成功)
			_success = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101144;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get pid(): long{
			return _pid;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set pid(value: long): void{
			this._pid = value;
		}
		
		/**
		 * get 改变后名字(失败返回原名)
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 改变后名字(失败返回原名)
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 修改是否成功(0.失败   1.成功)
		 * @return 
		 */
		public function get success(): int{
			return _success;
		}
		
		/**
		 * set 修改是否成功(0.失败   1.成功)
		 */
		public function set success(value: int): void{
			this._success = value;
		}
		
	}
}