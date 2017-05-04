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
		
		//技能类型,1主动,2被动
		private var _skillType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能增加信息
			writeBean(_skillInfo);
			//技能类型,1主动,2被动
			writeByte(_skillType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能增加信息
			_skillInfo = readBean(SkillInfo) as SkillInfo;
			//技能类型,1主动,2被动
			_skillType = readByte();
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
		
		/**
		 * get 技能类型,1主动,2被动
		 * @return 
		 */
		public function get skillType(): int{
			return _skillType;
		}
		
		/**
		 * set 技能类型,1主动,2被动
		 */
		public function set skillType(value: int): void{
			this._skillType = value;
		}
		
	}
}