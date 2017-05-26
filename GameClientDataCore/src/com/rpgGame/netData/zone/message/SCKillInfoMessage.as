package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.zone.bean.KillMonsterInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 击杀信息
	 */
	public class SCKillInfoMessage extends Message {
	
		//击杀信息
		private var _info: KillMonsterInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//击杀信息
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//击杀信息
			_info = readBean(KillMonsterInfo) as KillMonsterInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155142;
		}
		
		/**
		 * get 击杀信息
		 * @return 
		 */
		public function get info(): KillMonsterInfo{
			return _info;
		}
		
		/**
		 * set 击杀信息
		 */
		public function set info(value: KillMonsterInfo): void{
			this._info = value;
		}
		
	}
}