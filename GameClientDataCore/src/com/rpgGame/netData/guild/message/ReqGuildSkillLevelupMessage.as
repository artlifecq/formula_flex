package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求帮派技能升级
	 */
	public class ReqGuildSkillLevelupMessage extends Message {
	
		//技能类型,1:个人技能,2:统帅技能
		private var _type: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能类型,1:个人技能,2:统帅技能
			writeByte(_type);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能类型,1:个人技能,2:统帅技能
			_type = readByte();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111213;
		}
		
		/**
		 * get 技能类型,1:个人技能,2:统帅技能
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 技能类型,1:个人技能,2:统帅技能
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}