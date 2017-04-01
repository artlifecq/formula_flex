package com.rpgGame.netData.skill.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 设置默认技能
	 */
	public class ReqSetDefaultSkillMessage extends Message {
	
		//技能模板Id
		private var _defaultskillModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能模板Id
			writeInt(_defaultskillModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能模板Id
			_defaultskillModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 123202;
		}
		
		/**
		 * get 技能模板Id
		 * @return 
		 */
		public function get defaultskillModelId(): int{
			return _defaultskillModelId;
		}
		
		/**
		 * set 技能模板Id
		 */
		public function set defaultskillModelId(value: int): void{
			this._defaultskillModelId = value;
		}
		
	}
}