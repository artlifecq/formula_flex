package com.rpgGame.netData.fightsoul.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战魂当前经验值
	 */
	public class SCFightSoulExpChangeMessage extends Message {
	
		//当前经验值
		private var _curExp: int;
		
		//活跃度
		private var _vitality: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前经验值
			writeInt(_curExp);
			//活跃度
			writeInt(_vitality);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前经验值
			_curExp = readInt();
			//活跃度
			_vitality = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 223001;
		}
		
		/**
		 * get 当前经验值
		 * @return 
		 */
		public function get curExp(): int{
			return _curExp;
		}
		
		/**
		 * set 当前经验值
		 */
		public function set curExp(value: int): void{
			this._curExp = value;
		}
		
		/**
		 * get 活跃度
		 * @return 
		 */
		public function get vitality(): int{
			return _vitality;
		}
		
		/**
		 * set 活跃度
		 */
		public function set vitality(value: int): void{
			this._vitality = value;
		}
		
	}
}