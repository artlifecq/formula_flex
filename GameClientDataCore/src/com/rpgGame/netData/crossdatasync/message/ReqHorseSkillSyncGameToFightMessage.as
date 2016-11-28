package com.rpgGame.netData.crossdatasync.message{
	import com.rpgGame.netData.skill.bean.SkillInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 坐骑技能数据同步(覆盖到跨服)
	 */
	public class ReqHorseSkillSyncGameToFightMessage extends Message {
	
		//坐骑技能数据同步
		private var _skillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//坐骑技能数据同步
			writeShort(_skillInfos.length);
			for (i = 0; i < _skillInfos.length; i++) {
				writeBean(_skillInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//坐骑技能数据同步
			var skillInfos_length : int = readShort();
			for (i = 0; i < skillInfos_length; i++) {
				_skillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251267;
		}
		
		/**
		 * get 坐骑技能数据同步
		 * @return 
		 */
		public function get skillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _skillInfos;
		}
		
		/**
		 * set 坐骑技能数据同步
		 */
		public function set skillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._skillInfos = value;
		}
		
	}
}