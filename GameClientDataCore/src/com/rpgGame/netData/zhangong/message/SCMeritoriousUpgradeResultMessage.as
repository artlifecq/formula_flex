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
	 * 升级结果
	 */
	public class SCMeritoriousUpgradeResultMessage extends Message {
	
		//0 升级失败   1 升级成功
		private var _flag: int;
		
		//发生变化的战功对象
		private var _meritoriousInfo: MeritoriousInfo;
		
		//战斗力
		private var _fightPower: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0 升级失败   1 升级成功
			writeByte(_flag);
			//发生变化的战功对象
			writeBean(_meritoriousInfo);
			//战斗力
			writeInt(_fightPower);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0 升级失败   1 升级成功
			_flag = readByte();
			//发生变化的战功对象
			_meritoriousInfo = readBean(MeritoriousInfo) as MeritoriousInfo;
			//战斗力
			_fightPower = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 125103;
		}
		
		/**
		 * get 0 升级失败   1 升级成功
		 * @return 
		 */
		public function get flag(): int{
			return _flag;
		}
		
		/**
		 * set 0 升级失败   1 升级成功
		 */
		public function set flag(value: int): void{
			this._flag = value;
		}
		
		/**
		 * get 发生变化的战功对象
		 * @return 
		 */
		public function get meritoriousInfo(): MeritoriousInfo{
			return _meritoriousInfo;
		}
		
		/**
		 * set 发生变化的战功对象
		 */
		public function set meritoriousInfo(value: MeritoriousInfo): void{
			this._meritoriousInfo = value;
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