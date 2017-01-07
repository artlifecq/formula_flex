package com.rpgGame.netData.fight.message{
	import com.rpgGame.netData.fight.bean.AttackResultInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 攻击者收到的攻击结果
	 */
	public class SCAttackerResultMessage extends Message {
	
		//唯一ID
		private var _uid: int;
		
		//攻击结果
		private var _infos: Vector.<AttackResultInfo> = new Vector.<AttackResultInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//唯一ID
			writeInt(_uid);
			//攻击结果
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
			//唯一ID
			_uid = readInt();
			//攻击结果
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(AttackResultInfo) as AttackResultInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102114;
		}
		
		/**
		 * get 唯一ID
		 * @return 
		 */
		public function get uid(): int{
			return _uid;
		}
		
		/**
		 * set 唯一ID
		 */
		public function set uid(value: int): void{
			this._uid = value;
		}
		
		/**
		 * get 攻击结果
		 * @return 
		 */
		public function get infos(): Vector.<AttackResultInfo>{
			return _infos;
		}
		
		/**
		 * set 攻击结果
		 */
		public function set infos(value: Vector.<AttackResultInfo>): void{
			this._infos = value;
		}
		
	}
}