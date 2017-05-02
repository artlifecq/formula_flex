package com.rpgGame.netData.meridian.message{
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送筋脉列表
	 */
	public class SCMeridianListMessage extends Message {
	
		//筋脉穴位列表
		private var _infos: Vector.<AcuPointInfo> = new Vector.<AcuPointInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//筋脉穴位列表
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
			//筋脉穴位列表
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(AcuPointInfo) as AcuPointInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 225101;
		}
		
		/**
		 * get 筋脉穴位列表
		 * @return 
		 */
		public function get infos(): Vector.<AcuPointInfo>{
			return _infos;
		}
		
		/**
		 * set 筋脉穴位列表
		 */
		public function set infos(value: Vector.<AcuPointInfo>): void{
			this._infos = value;
		}
		
	}
}