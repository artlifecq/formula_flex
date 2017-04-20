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
	 * 绝学技能数据
	 */
	public class SCLostSkillInfosMessage extends Message {
	
		//当前启用技能ID
		private var _curSkillId: int;
		
		//绝学技能信息列表
		private var _infos: Vector.<SkillStateInfo> = new Vector.<SkillStateInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前启用技能ID
			writeInt(_curSkillId);
			//绝学技能信息列表
			writeShort(_infos.length);
			for (i = 0; i < _infos.length; i++) {
				writeBean(_infos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前启用技能ID
			_curSkillId = readInt();
			//绝学技能信息列表
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(SkillStateInfo) as SkillStateInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 224501;
		}
		
		/**
		 * get 当前启用技能ID
		 * @return 
		 */
		public function get curSkillId(): int{
			return _curSkillId;
		}
		
		/**
		 * set 当前启用技能ID
		 */
		public function set curSkillId(value: int): void{
			this._curSkillId = value;
		}
		
		/**
		 * get 绝学技能信息列表
		 * @return 
		 */
		public function get infos(): Vector.<SkillStateInfo>{
			return _infos;
		}
		
		/**
		 * set 绝学技能信息列表
		 */
		public function set infos(value: Vector.<SkillStateInfo>): void{
			this._infos = value;
		}
		
	}
}