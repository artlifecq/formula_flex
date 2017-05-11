package com.rpgGame.netData.cooldown.message{
	import com.rpgGame.netData.cooldown.bean.CooldownInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 同步冷却列表
	 */
	public class ResCooldownInfoListMessage extends Message {
	
		//同步冷却列表
		private var _list: Vector.<CooldownInfo> = new Vector.<CooldownInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//同步冷却列表
			writeShort(_list.length);
			for (i = 0; i < _list.length; i++) {
				writeBean(_list[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//同步冷却列表
			var list_length : int = readShort();
			for (i = 0; i < list_length; i++) {
				_list[i] = readBean(CooldownInfo) as CooldownInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 228100;
		}
		
		/**
		 * get 同步冷却列表
		 * @return 
		 */
		public function get list(): Vector.<CooldownInfo>{
			return _list;
		}
		
		/**
		 * set 同步冷却列表
		 */
		public function set list(value: Vector.<CooldownInfo>): void{
			this._list = value;
		}
		
	}
}