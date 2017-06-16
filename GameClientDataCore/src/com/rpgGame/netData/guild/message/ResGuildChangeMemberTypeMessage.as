package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知玩家帮派职位改变
	 */
	public class ResGuildChangeMemberTypeMessage extends Message {
	
		//帮派职位
		private var _memberType: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//帮派职位
			writeShort(_memberType.length);
			for (i = 0; i < _memberType.length; i++) {
				writeByte(_memberType[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//帮派职位
			var memberType_length : int = readShort();
			for (i = 0; i < memberType_length; i++) {
				_memberType[i] = readByte();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111107;
		}
		
		/**
		 * get 帮派职位
		 * @return 
		 */
		public function get memberType(): Vector.<int>{
			return _memberType;
		}
		
		/**
		 * set 帮派职位
		 */
		public function set memberType(value: Vector.<int>): void{
			this._memberType = value;
		}
		
	}
}