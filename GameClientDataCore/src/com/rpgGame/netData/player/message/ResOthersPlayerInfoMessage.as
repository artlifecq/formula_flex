package com.rpgGame.netData.player.message{
	import com.rpgGame.netData.player.bean.OthersInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回他人详细信息
	 */
	public class ResOthersPlayerInfoMessage extends Message {
	
		//他人详细信息
		private var _othersInfo: OthersInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//他人详细信息
			writeBean(_othersInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//他人详细信息
			_othersInfo = readBean(OthersInfo) as OthersInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103120;
		}
		
		/**
		 * get 他人详细信息
		 * @return 
		 */
		public function get othersInfo(): OthersInfo{
			return _othersInfo;
		}
		
		/**
		 * set 他人详细信息
		 */
		public function set othersInfo(value: OthersInfo): void{
			this._othersInfo = value;
		}
		
	}
}