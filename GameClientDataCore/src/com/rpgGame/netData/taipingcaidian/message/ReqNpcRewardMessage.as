package com.rpgGame.netData.taipingcaidian.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * NPC领取
	 */
	public class ReqNpcRewardMessage extends Message {
	
		//npc模版ID
		private var _npcModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//npc模版ID
			writeInt(_npcModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//npc模版ID
			_npcModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 219203;
		}
		
		/**
		 * get npc模版ID
		 * @return 
		 */
		public function get npcModelId(): int{
			return _npcModelId;
		}
		
		/**
		 * set npc模版ID
		 */
		public function set npcModelId(value: int): void{
			this._npcModelId = value;
		}
		
	}
}