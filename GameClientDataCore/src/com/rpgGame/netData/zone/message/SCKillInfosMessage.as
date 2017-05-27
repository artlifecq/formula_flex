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
	 * 击杀信息列表
	 */
	public class SCKillInfosMessage extends Message {
	
		//击杀信息列表
		private var _infos: Vector.<KillMonsterInfo> = new Vector.<KillMonsterInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//击杀信息列表
			writeShort(_infos.length);
			for (i = 0; i < _infos.length; i++) {
				writeBean(_infos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//击杀信息列表
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(KillMonsterInfo) as KillMonsterInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155141;
		}
		
		/**
		 * get 击杀信息列表
		 * @return 
		 */
		public function get infos(): Vector.<KillMonsterInfo>{
			return _infos;
		}
		
		/**
		 * set 击杀信息列表
		 */
		public function set infos(value: Vector.<KillMonsterInfo>): void{
			this._infos = value;
		}
		
	}
}