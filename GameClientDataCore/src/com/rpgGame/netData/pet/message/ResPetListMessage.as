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
	 * 所以侍宠信息列表
	 */
	public class ResPetListMessage extends Message {
	
		//侍宠属性
		private var _player: Vector.<PetInfo> = new Vector.<PetInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//侍宠属性
			writeShort(_player.length);
			for (i = 0; i < _player.length; i++) {
				writeBean(_player[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//侍宠属性
			var player_length : int = readShort();
			for (i = 0; i < player_length; i++) {
				_player[i] = readBean(PetInfo) as PetInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148105;
		}
		
		/**
		 * get 侍宠属性
		 * @return 
		 */
		public function get player(): Vector.<PetInfo>{
			return _player;
		}
		
		/**
		 * set 侍宠属性
		 */
		public function set player(value: Vector.<PetInfo>): void{
			this._player = value;
		}
		
	}
}