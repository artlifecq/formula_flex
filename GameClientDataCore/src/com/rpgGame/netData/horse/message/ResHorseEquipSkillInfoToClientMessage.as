package com.rpgGame.netData.horse.message{
	import com.rpgGame.netData.skill.bean.SkillInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送坐骑技能信息
	 */
	public class ResHorseEquipSkillInfoToClientMessage extends Message {
	
		//坐骑技能信息
		private var _euipSkillInfo: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//坐骑技能信息
			writeShort(_euipSkillInfo.length);
			for (i = 0; i < _euipSkillInfo.length; i++) {
				writeBean(_euipSkillInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//坐骑技能信息
			var euipSkillInfo_length : int = readShort();
			for (i = 0; i < euipSkillInfo_length; i++) {
				_euipSkillInfo[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144104;
		}
		
		/**
		 * get 坐骑技能信息
		 * @return 
		 */
		public function get euipSkillInfo(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _euipSkillInfo;
		}
		
		/**
		 * set 坐骑技能信息
		 */
		public function set euipSkillInfo(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._euipSkillInfo = value;
		}
		
	}
}