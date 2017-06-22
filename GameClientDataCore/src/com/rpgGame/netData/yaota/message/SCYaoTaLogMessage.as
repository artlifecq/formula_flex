package com.rpgGame.netData.yaota.message{
	import com.rpgGame.netData.yaota.bean.YaoTaInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战场日志
	 */
	public class SCYaoTaLogMessage extends Message {
	
		//战场日志
		private var _yaoTaInfos: Vector.<YaoTaInfo> = new Vector.<YaoTaInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//战场日志
			writeShort(_yaoTaInfos.length);
			for (i = 0; i < _yaoTaInfos.length; i++) {
				writeBean(_yaoTaInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//战场日志
			var yaoTaInfos_length : int = readShort();
			for (i = 0; i < yaoTaInfos_length; i++) {
				_yaoTaInfos[i] = readBean(YaoTaInfo) as YaoTaInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129103;
		}
		
		/**
		 * get 战场日志
		 * @return 
		 */
		public function get yaoTaInfos(): Vector.<YaoTaInfo>{
			return _yaoTaInfos;
		}
		
		/**
		 * set 战场日志
		 */
		public function set yaoTaInfos(value: Vector.<YaoTaInfo>): void{
			this._yaoTaInfos = value;
		}
		
	}
}