package com.rpgGame.netData.monster.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 出错的怪物
	 */
	public class ReqErrorMonsterToGameMessage extends Message {
	
		//怪物唯一Id
		private var _monsterId: long;
		
		//1怪物死亡后还打人,2隐身怪物打人
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物唯一Id
			writeLong(_monsterId);
			//1怪物死亡后还打人,2隐身怪物打人
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物唯一Id
			_monsterId = readLong();
			//1怪物死亡后还打人,2隐身怪物打人
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114202;
		}
		
		/**
		 * get 怪物唯一Id
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set 怪物唯一Id
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get 1怪物死亡后还打人,2隐身怪物打人
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1怪物死亡后还打人,2隐身怪物打人
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}