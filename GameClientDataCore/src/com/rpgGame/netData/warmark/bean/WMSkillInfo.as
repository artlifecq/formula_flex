package com.rpgGame.netData.warmark.bean{
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战印信息类
	 */
	public class WMSkillInfo extends Bean {
	
		//格子Id
		private var _gridId: int;
		
		//技能列表
		private var _info: com.rpgGame.netData.skill.bean.SkillInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//格子Id
			writeInt(_gridId);
			//技能列表
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//格子Id
			_gridId = readInt();
			//技能列表
			_info = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			return true;
		}
		
		/**
		 * get 格子Id
		 * @return 
		 */
		public function get gridId(): int{
			return _gridId;
		}
		
		/**
		 * set 格子Id
		 */
		public function set gridId(value: int): void{
			this._gridId = value;
		}
		
		/**
		 * get 技能列表
		 * @return 
		 */
		public function get info(): com.rpgGame.netData.skill.bean.SkillInfo{
			return _info;
		}
		
		/**
		 * set 技能列表
		 */
		public function set info(value: com.rpgGame.netData.skill.bean.SkillInfo): void{
			this._info = value;
		}
		
	}
}