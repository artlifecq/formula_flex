package com.rpgGame.netData.skill.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 重置技能动作编号
	 */
	public class ResSkillResetEffectsidMessage extends Message {
	
		//未分离的技能动作编号
		private var _skilleffectsid: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//未分离的技能动作编号
			writeInt(_skilleffectsid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//未分离的技能动作编号
			_skilleffectsid = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 123105;
		}
		
		/**
		 * get 未分离的技能动作编号
		 * @return 
		 */
		public function get skilleffectsid(): int{
			return _skilleffectsid;
		}
		
		/**
		 * set 未分离的技能动作编号
		 */
		public function set skilleffectsid(value: int): void{
			this._skilleffectsid = value;
		}
		
	}
}