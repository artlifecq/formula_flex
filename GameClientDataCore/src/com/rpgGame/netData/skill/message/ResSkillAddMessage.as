package com.rpgGame.netData.skill.message{
	import com.rpgGame.netData.skill.bean.SkillInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 技能增加
	 */
	public class ResSkillAddMessage extends Message {
	
		//技能增加信息
		private var _skillInfo: SkillInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能增加信息
			writeBean(_skillInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能增加信息
			_skillInfo = readBean(SkillInfo) as SkillInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 123102;
		}
		
		/**
		 * get 技能增加信息
		 * @return 
		 */
		public function get skillInfo(): SkillInfo{
			return _skillInfo;
		}
		
		/**
		 * set 技能增加信息
		 */
		public function set skillInfo(value: SkillInfo): void{
			this._skillInfo = value;
		}
		
	}
}