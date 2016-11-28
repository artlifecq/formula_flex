package com.rpgGame.netData.warmark.message{
	import com.rpgGame.netData.warmark.bean.WarMarkInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战印列表
	 */
	public class ResWarMarkListMessage extends Message {
	
		//战印列表
		private var _infos: Vector.<WarMarkInfo> = new Vector.<WarMarkInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//战印列表
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
			//战印列表
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(WarMarkInfo) as WarMarkInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 193101;
		}
		
		/**
		 * get 战印列表
		 * @return 
		 */
		public function get infos(): Vector.<WarMarkInfo>{
			return _infos;
		}
		
		/**
		 * set 战印列表
		 */
		public function set infos(value: Vector.<WarMarkInfo>): void{
			this._infos = value;
		}
		
	}
}