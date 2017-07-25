package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.map.bean.TopLeaderInfo;
	
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新雕像数据
	 */
	public class SCUpdateTopLeaderMessage extends Message {
		
		//雕像数据
		private var _topLeaderInfo: TopLeaderInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//雕像数据
			writeBean(_topLeaderInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//雕像数据
			_topLeaderInfo = readBean(TopLeaderInfo) as TopLeaderInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101222;
		}
		
		/**
		 * get 雕像数据
		 * @return 
		 */
		public function get topLeaderInfo(): TopLeaderInfo{
			return _topLeaderInfo;
		}
		
		/**
		 * set 雕像数据
		 */
		public function set topLeaderInfo(value: TopLeaderInfo): void{
			this._topLeaderInfo = value;
		}
		
	}
}