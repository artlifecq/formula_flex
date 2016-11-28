package com.rpgGame.netData.chat.bean{
	import com.rpgGame.netData.chat.bean.HyperInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送聊天的附加参数
	 */
	public class ExtraReqInfo extends Bean {
	
		//私聊目标玩家名称
		private var _targetPlayerName: String;
		
		//展示内容列表
		private var _hyperInfos: Vector.<HyperInfo> = new Vector.<HyperInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//私聊目标玩家名称
			writeString(_targetPlayerName);
			//展示内容列表
			writeShort(_hyperInfos.length);
			for (var i: int = 0; i < _hyperInfos.length; i++) {
				writeBean(_hyperInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//私聊目标玩家名称
			_targetPlayerName = readString();
			//展示内容列表
			var hyperInfos_length : int = readShort();
			for (var i: int = 0; i < hyperInfos_length; i++) {
				_hyperInfos[i] = readBean(HyperInfo) as HyperInfo;
			}
			return true;
		}
		
		/**
		 * get 私聊目标玩家名称
		 * @return 
		 */
		public function get targetPlayerName(): String{
			return _targetPlayerName;
		}
		
		/**
		 * set 私聊目标玩家名称
		 */
		public function set targetPlayerName(value: String): void{
			this._targetPlayerName = value;
		}
		
		/**
		 * get 展示内容列表
		 * @return 
		 */
		public function get hyperInfos(): Vector.<HyperInfo>{
			return _hyperInfos;
		}
		
		/**
		 * set 展示内容列表
		 */
		public function set hyperInfos(value: Vector.<HyperInfo>): void{
			this._hyperInfos = value;
		}
		
	}
}