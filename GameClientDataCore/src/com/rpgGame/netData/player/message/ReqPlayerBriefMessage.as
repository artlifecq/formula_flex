package com.rpgGame.netData.player.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家简要信息
	 */
	public class ReqPlayerBriefMessage extends Message {
	
		//角色Id
		private var _personIds: Vector.<long> = new Vector.<long>();
		//控件类型
		private var _controlType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//角色Id
			writeShort(_personIds.length);
			for (i = 0; i < _personIds.length; i++) {
				writeLong(_personIds[i]);
			}
			//控件类型
			writeByte(_controlType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//角色Id
			var personIds_length : int = readShort();
			for (i = 0; i < personIds_length; i++) {
				_personIds[i] = readLong();
			}
			//控件类型
			_controlType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103207;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personIds(): Vector.<long>{
			return _personIds;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personIds(value: Vector.<long>): void{
			this._personIds = value;
		}
		
		/**
		 * get 控件类型
		 * @return 
		 */
		public function get controlType(): int{
			return _controlType;
		}
		
		/**
		 * set 控件类型
		 */
		public function set controlType(value: int): void{
			this._controlType = value;
		}
		
	}
}