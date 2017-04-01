package com.rpgGame.netData.team.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家离队
	 */
	public class ReqLeaveTeamMessage extends Message {
	
		//1 自己离开 ，2下线
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 自己离开 ，2下线
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 自己离开 ，2下线
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109203;
		}
		
		/**
		 * get 1 自己离开 ，2下线
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 自己离开 ，2下线
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}