package com.rpgGame.netData.client.message{
	import com.rpgGame.netData.client.bean.SystemHint;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 登陆发送系统提示红标
	 */
	public class SCSystemHintMessage extends Message {
	
		//红标集合
		private var _systemHints: Vector.<SystemHint> = new Vector.<SystemHint>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//红标集合
			writeShort(_systemHints.length);
			for (i = 0; i < _systemHints.length; i++) {
				writeBean(_systemHints[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//红标集合
			var systemHints_length : int = readShort();
			for (i = 0; i < systemHints_length; i++) {
				_systemHints[i] = readBean(SystemHint) as SystemHint;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301134;
		}
		
		/**
		 * get 红标集合
		 * @return 
		 */
		public function get systemHints(): Vector.<SystemHint>{
			return _systemHints;
		}
		
		/**
		 * set 红标集合
		 */
		public function set systemHints(value: Vector.<SystemHint>): void{
			this._systemHints = value;
		}
		
	}
}