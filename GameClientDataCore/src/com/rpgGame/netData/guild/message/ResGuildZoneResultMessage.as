package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会副本内面板同步消息
	 */
	public class ResGuildZoneResultMessage extends Message {
	
		//0失败  1 成功
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0失败  1 成功
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0失败  1 成功
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111503;
		}
		
		/**
		 * get 0失败  1 成功
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 0失败  1 成功
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}