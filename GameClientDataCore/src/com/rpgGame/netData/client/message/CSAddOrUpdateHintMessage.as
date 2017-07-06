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
	 * 客户端更新红标或添加
	 */
	public class CSAddOrUpdateHintMessage extends Message {
	
		//内容
		private var _systemHint: SystemHint;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//内容
			writeBean(_systemHint);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//内容
			_systemHint = readBean(SystemHint) as SystemHint;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301202;
		}
		
		/**
		 * get 内容
		 * @return 
		 */
		public function get systemHint(): SystemHint{
			return _systemHint;
		}
		
		/**
		 * set 内容
		 */
		public function set systemHint(value: SystemHint): void{
			this._systemHint = value;
		}
		
	}
}