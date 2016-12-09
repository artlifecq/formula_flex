package com.rpgGame.netData.pet.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求侍宠列表
	 */
	public class ReqShowPetListMessage extends Message {
	
		//角色Id
		private var _petTargetId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_petTargetId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_petTargetId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148203;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get petTargetId(): long{
			return _petTargetId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set petTargetId(value: long): void{
			this._petTargetId = value;
		}
		
	}
}