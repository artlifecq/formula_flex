package com.rpgGame.netData.player.message{
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 本人玩家信息
	 */
	public class ResMyPlayerInfoMessage extends Message {
	
		//本人玩家信息
		private var _myPlayerInfo: MyPlayerInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//本人玩家信息
			writeBean(_myPlayerInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//本人玩家信息
			_myPlayerInfo = readBean(MyPlayerInfo) as MyPlayerInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103101;
		}
		
		/**
		 * get 本人玩家信息
		 * @return 
		 */
		public function get myPlayerInfo(): MyPlayerInfo{
			return _myPlayerInfo;
		}
		
		/**
		 * set 本人玩家信息
		 */
		public function set myPlayerInfo(value: MyPlayerInfo): void{
			this._myPlayerInfo = value;
		}
		
	}
}