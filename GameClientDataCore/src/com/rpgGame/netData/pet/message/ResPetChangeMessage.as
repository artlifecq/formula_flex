package com.rpgGame.netData.pet.message{
	import com.rpgGame.netData.pet.bean.PetInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 单个美人变化消息
	 */
	public class ResPetChangeMessage extends Message {
	
		//单个美人消息
		private var _pets: PetInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//单个美人消息
			writeBean(_pets);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//单个美人消息
			_pets = readBean(PetInfo) as PetInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148109;
		}
		
		/**
		 * get 单个美人消息
		 * @return 
		 */
		public function get pets(): PetInfo{
			return _pets;
		}
		
		/**
		 * set 单个美人消息
		 */
		public function set pets(value: PetInfo): void{
			this._pets = value;
		}
		
	}
}