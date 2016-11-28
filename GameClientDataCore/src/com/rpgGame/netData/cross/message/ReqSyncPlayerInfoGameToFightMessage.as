package com.rpgGame.netData.cross.message{
	import com.rpgGame.netData.cross.bean.CrossPlayerinfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 响应跨服请求,发送玩家数据到战斗服
	 */
	public class ReqSyncPlayerInfoGameToFightMessage extends Message {
	
		//玩家跨服数据信息
		private var _crossPlayerinfo: CrossPlayerinfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家跨服数据信息
			writeBean(_crossPlayerinfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家跨服数据信息
			_crossPlayerinfo = readBean(CrossPlayerinfo) as CrossPlayerinfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250254;
		}
		
		/**
		 * get 玩家跨服数据信息
		 * @return 
		 */
		public function get crossPlayerinfo(): CrossPlayerinfo{
			return _crossPlayerinfo;
		}
		
		/**
		 * set 玩家跨服数据信息
		 */
		public function set crossPlayerinfo(value: CrossPlayerinfo): void{
			this._crossPlayerinfo = value;
		}
		
	}
}