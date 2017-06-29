package com.rpgGame.netData.team.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 确认离开退伍
	 */
	public class CSConfirmQuitTeamMessage extends Message {
	
		//退队原因
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//退队原因
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//退队原因
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109219;
		}
		
		/**
		 * get 退队原因
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 退队原因
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}