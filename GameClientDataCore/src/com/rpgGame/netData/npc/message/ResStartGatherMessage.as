package com.rpgGame.netData.npc.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家开始采集
	 */
	public class ResStartGatherMessage extends Message {
	
		//角色Id
		private var _personId: int;
		
		//行为目标
		private var _tatget: int;
		
		//采集时间
		private var _costtime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeShort(_personId);
			//行为目标
			writeShort(_tatget);
			//采集时间
			writeInt(_costtime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readShort();
			//行为目标
			_tatget = readShort();
			//采集时间
			_costtime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 104102;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personId(): int{
			return _personId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personId(value: int): void{
			this._personId = value;
		}
		
		/**
		 * get 行为目标
		 * @return 
		 */
		public function get tatget(): int{
			return _tatget;
		}
		
		/**
		 * set 行为目标
		 */
		public function set tatget(value: int): void{
			this._tatget = value;
		}
		
		/**
		 * get 采集时间
		 * @return 
		 */
		public function get costtime(): int{
			return _costtime;
		}
		
		/**
		 * set 采集时间
		 */
		public function set costtime(value: int): void{
			this._costtime = value;
		}
		
	}
}