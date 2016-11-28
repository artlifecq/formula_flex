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
	 * 绝命单个数据
	 */
	public class ResFateInfoMessage extends Message {
	
		//绝命任务数据
		private var _fateInfo: FateInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//绝命任务数据
			writeBean(_fateInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//绝命任务数据
			_fateInfo = readBean(FateInfo) as FateInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 213102;
		}
		
		/**
		 * get 绝命任务数据
		 * @return 
		 */
		public function get fateInfo(): FateInfo{
			return _fateInfo;
		}
		
		/**
		 * set 绝命任务数据
		 */
		public function set fateInfo(value: FateInfo): void{
			this._fateInfo = value;
		}
		
	}
}