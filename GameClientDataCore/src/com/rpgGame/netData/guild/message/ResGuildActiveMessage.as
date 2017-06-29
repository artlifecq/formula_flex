package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派活跃度信息
	 */
	public class ResGuildActiveMessage extends Message {
	
		//帮派活跃度
		private var _active: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮派活跃度
			writeInt(_active);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮派活跃度
			_active = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111109;
		}
		
		/**
		 * get 帮派活跃度
		 * @return 
		 */
		public function get active(): int{
			return _active;
		}
		
		/**
		 * set 帮派活跃度
		 */
		public function set active(value: int): void{
			this._active = value;
		}
		
	}
}