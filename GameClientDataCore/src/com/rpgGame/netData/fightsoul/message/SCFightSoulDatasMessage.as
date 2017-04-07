package com.rpgGame.netData.fightsoul.message{
	import com.rpgGame.netData.fightsoul.bean.FightSoulInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战魂数据消息
	 */
	public class SCFightSoulDatasMessage extends Message {
	
		//战魂数据
		private var _fightSoulInfo: FightSoulInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战魂数据
			writeBean(_fightSoulInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战魂数据
			_fightSoulInfo = readBean(FightSoulInfo) as FightSoulInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 223004;
		}
		
		/**
		 * get 战魂数据
		 * @return 
		 */
		public function get fightSoulInfo(): FightSoulInfo{
			return _fightSoulInfo;
		}
		
		/**
		 * set 战魂数据
		 */
		public function set fightSoulInfo(value: FightSoulInfo): void{
			this._fightSoulInfo = value;
		}
		
	}
}