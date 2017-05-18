package com.rpgGame.netData.junjie.message{
	import com.rpgGame.netData.junjie.bean.JunJieInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 激活结果
	 */
	public class SCJunJieActivateResultMessage extends Message {
	
		//0  失败   1  成功
		private var _flag: int;
		
		//战斗力
		private var _fightPower: int;
		
		//更新的数据
		private var _junJieInfo: JunJieInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0  失败   1  成功
			writeByte(_flag);
			//战斗力
			writeInt(_fightPower);
			//更新的数据
			writeBean(_junJieInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0  失败   1  成功
			_flag = readByte();
			//战斗力
			_fightPower = readInt();
			//更新的数据
			_junJieInfo = readBean(JunJieInfo) as JunJieInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 126103;
		}
		
		/**
		 * get 0  失败   1  成功
		 * @return 
		 */
		public function get flag(): int{
			return _flag;
		}
		
		/**
		 * set 0  失败   1  成功
		 */
		public function set flag(value: int): void{
			this._flag = value;
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
		
		/**
		 * get 更新的数据
		 * @return 
		 */
		public function get junJieInfo(): JunJieInfo{
			return _junJieInfo;
		}
		
		/**
		 * set 更新的数据
		 */
		public function set junJieInfo(value: JunJieInfo): void{
			this._junJieInfo = value;
		}
		
	}
}