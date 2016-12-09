package com.rpgGame.netData.fate.message{
	import com.rpgGame.netData.fate.bean.FateInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 绝命面板数据
	 */
	public class ResFatePanleInfoMessage extends Message {
	
		//绝命任务数据
		private var _fateInfo: Vector.<FateInfo> = new Vector.<FateInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//绝命任务数据
			writeShort(_fateInfo.length);
			for (i = 0; i < _fateInfo.length; i++) {
				writeBean(_fateInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//绝命任务数据
			var fateInfo_length : int = readShort();
			for (i = 0; i < fateInfo_length; i++) {
				_fateInfo[i] = readBean(FateInfo) as FateInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 213101;
		}
		
		/**
		 * get 绝命任务数据
		 * @return 
		 */
		public function get fateInfo(): Vector.<FateInfo>{
			return _fateInfo;
		}
		
		/**
		 * set 绝命任务数据
		 */
		public function set fateInfo(value: Vector.<FateInfo>): void{
			this._fateInfo = value;
		}
		
	}
}