package com.rpgGame.netData.zhangong.message{
	import com.rpgGame.netData.zhangong.bean.MeritoriousInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送战功对象列表
	 */
	public class SCMeritoriousInfoListMessage extends Message {
	
		//战功对象列表
		private var _meritoriousInfos: Vector.<MeritoriousInfo> = new Vector.<MeritoriousInfo>();
		//战斗力
		private var _fightPower: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//战功对象列表
			writeShort(_meritoriousInfos.length);
			for (i = 0; i < _meritoriousInfos.length; i++) {
				writeBean(_meritoriousInfos[i]);
			}
			//战斗力
			writeInt(_fightPower);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//战功对象列表
			var meritoriousInfos_length : int = readShort();
			for (i = 0; i < meritoriousInfos_length; i++) {
				_meritoriousInfos[i] = readBean(MeritoriousInfo) as MeritoriousInfo;
			}
			//战斗力
			_fightPower = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 125101;
		}
		
		/**
		 * get 战功对象列表
		 * @return 
		 */
		public function get meritoriousInfos(): Vector.<MeritoriousInfo>{
			return _meritoriousInfos;
		}
		
		/**
		 * set 战功对象列表
		 */
		public function set meritoriousInfos(value: Vector.<MeritoriousInfo>): void{
			this._meritoriousInfos = value;
		}
		
		/**
		 * get 战斗力
		 * @return 
		 */
		public function get fightPower(): int{
			return _fightPower;
		}
		
		/**
		 * set 战斗力
		 */
		public function set fightPower(value: int): void{
			this._fightPower = value;
		}
		
	}
}