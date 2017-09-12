package com.rpgGame.netData.activities.message{
	import com.rpgGame.netData.activities.bean.ActivityInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回单个活动信息
	 */
	public class ResSingelActivitiesInfoMessage extends Message {
	
		//单个活动信息
		private var _singleActivitie: ActivityInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//单个活动信息
			writeBean(_singleActivitie);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//单个活动信息
			_singleActivitie = readBean(ActivityInfo) as ActivityInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 181104;
		}
		
		/**
		 * get 单个活动信息
		 * @return 
		 */
		public function get singleActivitie(): ActivityInfo{
			return _singleActivitie;
		}
		
		/**
		 * set 单个活动信息
		 */
		public function set singleActivitie(value: ActivityInfo): void{
			this._singleActivitie = value;
		}
		
	}
}