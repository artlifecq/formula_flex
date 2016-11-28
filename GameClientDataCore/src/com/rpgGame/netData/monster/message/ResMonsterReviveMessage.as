package com.rpgGame.netData.monster.message{
	import com.rpgGame.netData.map.bean.MonsterInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 怪物复活
	 */
	public class ResMonsterReviveMessage extends Message {
	
		//怪物信息
		private var _monster: com.rpgGame.netData.map.bean.MonsterInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物信息
			writeBean(_monster);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物信息
			_monster = readBean(com.rpgGame.netData.map.bean.MonsterInfo) as com.rpgGame.netData.map.bean.MonsterInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114109;
		}
		
		/**
		 * get 怪物信息
		 * @return 
		 */
		public function get monster(): com.rpgGame.netData.map.bean.MonsterInfo{
			return _monster;
		}
		
		/**
		 * set 怪物信息
		 */
		public function set monster(value: com.rpgGame.netData.map.bean.MonsterInfo): void{
			this._monster = value;
		}
		
	}
}