package com.rpgGame.netData.map.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 头盔换装
	 */
	public class ResHelmChangeMessage extends Message {
	
		//角色Id
		private var _personId: int;
		
		//头盔资源Id
		private var _helmResId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeShort(_personId);
			//头盔资源Id
			writeInt(_helmResId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readShort();
			//头盔资源Id
			_helmResId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101150;
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
		 * get 头盔资源Id
		 * @return 
		 */
		public function get helmResId(): int{
			return _helmResId;
		}
		
		/**
		 * set 头盔资源Id
		 */
		public function set helmResId(value: int): void{
			this._helmResId = value;
		}
		
	}
}