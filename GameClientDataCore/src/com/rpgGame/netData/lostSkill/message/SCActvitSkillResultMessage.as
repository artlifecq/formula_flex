package com.rpgGame.netData.lostSkill.message{
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 激活绝学技能结果
	 */
	public class SCActvitSkillResultMessage extends Message {
	
		//绝学技能信息
		private var _info: SkillStateInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//绝学技能信息
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//绝学技能信息
			_info = readBean(SkillStateInfo) as SkillStateInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 224502;
		}
		
		/**
		 * get 绝学技能信息
		 * @return 
		 */
		public function get info(): SkillStateInfo{
			return _info;
		}
		
		/**
		 * set 绝学技能信息
		 */
		public function set info(value: SkillStateInfo): void{
			this._info = value;
		}
		
	}
}