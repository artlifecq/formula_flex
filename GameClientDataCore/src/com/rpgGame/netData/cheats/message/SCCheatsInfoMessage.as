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
	 * 发送单个信息
	 */
	public class SCCheatsInfoMessage extends Message {
	
		//功法信息
		private var _info: CheatsInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//功法信息
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//功法信息
			_info = readBean(CheatsInfo) as CheatsInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 226102;
		}
		
		/**
		 * get 功法信息
		 * @return 
		 */
		public function get info(): CheatsInfo{
			return _info;
		}
		
		/**
		 * set 功法信息
		 */
		public function set info(value: CheatsInfo): void{
			this._info = value;
		}
		
	}
}