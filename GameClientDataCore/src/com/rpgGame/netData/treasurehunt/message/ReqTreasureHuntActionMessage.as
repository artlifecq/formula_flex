package com.rpgGame.netData.treasurehunt.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求寻宝
	 */
	public class ReqTreasureHuntActionMessage extends Message {
	
		//次数类型 1、1次 2、10次 3、50次 4、100次
		private var _actionType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//次数类型 1、1次 2、10次 3、50次 4、100次
			writeByte(_actionType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//次数类型 1、1次 2、10次 3、50次 4、100次
			_actionType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 160201;
		}
		
		/**
		 * get 次数类型 1、1次 2、10次 3、50次 4、100次
		 * @return 
		 */
		public function get actionType(): int{
			return _actionType;
		}
		
		/**
		 * set 次数类型 1、1次 2、10次 3、50次 4、100次
		 */
		public function set actionType(value: int): void{
			this._actionType = value;
		}
		
	}
}