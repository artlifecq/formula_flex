package com.rpgGame.netData.npc.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 任务NPC采集完成消息
	 */
	public class ResTaskNpcGatherFinishMessage extends Message {
	
		//npcId
		private var _npcId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//npcId
			writeShort(_npcId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//npcId
			_npcId = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 104105;
		}
		
		/**
		 * get npcId
		 * @return 
		 */
		public function get npcId(): int{
			return _npcId;
		}
		
		/**
		 * set npcId
		 */
		public function set npcId(value: int): void{
			this._npcId = value;
		}
		
	}
}