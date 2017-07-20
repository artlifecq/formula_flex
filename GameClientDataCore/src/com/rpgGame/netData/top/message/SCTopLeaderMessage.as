package com.rpgGame.netData.top.message{
	import com.rpgGame.netData.top.bean.TopInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 单个排行榜魁首数据
	 */
	public class SCTopLeaderMessage extends Message {
	
		//魁首数据
		private var _topInfo: TopInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//魁首数据
			writeBean(_topInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//魁首数据
			_topInfo = readBean(TopInfo) as TopInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141107;
		}
		
		/**
		 * get 魁首数据
		 * @return 
		 */
		public function get topInfo(): TopInfo{
			return _topInfo;
		}
		
		/**
		 * set 魁首数据
		 */
		public function set topInfo(value: TopInfo): void{
			this._topInfo = value;
		}
		
	}
}