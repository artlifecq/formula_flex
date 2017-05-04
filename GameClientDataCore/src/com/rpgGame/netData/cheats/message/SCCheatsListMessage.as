package com.rpgGame.netData.cheats.message{
	import com.rpgGame.netData.cheats.bean.CheatsInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送功法列表
	 */
	public class SCCheatsListMessage extends Message {
	
		//功法列表
		private var _infos: Vector.<CheatsInfo> = new Vector.<CheatsInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//功法列表
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
			//功法列表
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(CheatsInfo) as CheatsInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 226101;
		}
		
		/**
		 * get 功法列表
		 * @return 
		 */
		public function get infos(): Vector.<CheatsInfo>{
			return _infos;
		}
		
		/**
		 * set 功法列表
		 */
		public function set infos(value: Vector.<CheatsInfo>): void{
			this._infos = value;
		}
		
	}
}