package com.rpgGame.netData.buff.message{
	import com.rpgGame.netData.buff.bean.BuffInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 别人能展示的Buff列表
	 */
	public class ResShowBuffInfoMessage extends Message {
	
		//角色Id
		private var _personId: long;
		
		//buff列表
		private var _buffs: Vector.<BuffInfo> = new Vector.<BuffInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//角色Id
			writeLong(_personId);
			//buff列表
			writeShort(_buffs.length);
			for (i = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//角色Id
			_personId = readLong();
			//buff列表
			var buffs_length : int = readShort();
			for (i = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(BuffInfo) as BuffInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 121106;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personId(): long{
			return _personId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personId(value: long): void{
			this._personId = value;
		}
		
		/**
		 * get buff列表
		 * @return 
		 */
		public function get buffs(): Vector.<BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff列表
		 */
		public function set buffs(value: Vector.<BuffInfo>): void{
			this._buffs = value;
		}
		
	}
}