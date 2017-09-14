package com.rpgGame.netData.gameactivities.message{
	import com.rpgGame.netData.gameactivities.bean.GrownInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 消息集合
	 */
	public class ResGrownInfoMessage extends Message {
	
		//单个信息
		private var _info: Vector.<GrownInfo> = new Vector.<GrownInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//单个信息
			writeShort(_info.length);
			for (i = 0; i < _info.length; i++) {
				writeBean(_info[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//单个信息
			var info_length : int = readShort();
			for (i = 0; i < info_length; i++) {
				_info[i] = readBean(GrownInfo) as GrownInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 192101;
		}
		
		/**
		 * get 单个信息
		 * @return 
		 */
		public function get info(): Vector.<GrownInfo>{
			return _info;
		}
		
		/**
		 * set 单个信息
		 */
		public function set info(value: Vector.<GrownInfo>): void{
			this._info = value;
		}
		
	}
}