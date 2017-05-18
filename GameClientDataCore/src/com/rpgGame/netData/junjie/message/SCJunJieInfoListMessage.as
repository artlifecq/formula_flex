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
	 * 发送军阶对象列表
	 */
	public class SCJunJieInfoListMessage extends Message {
	
		//军阶对象列表
		private var _junJieInfos: Vector.<JunJieInfo> = new Vector.<JunJieInfo>();
		//战斗力
		private var _fightPower: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//军阶对象列表
			writeShort(_junJieInfos.length);
			for (i = 0; i < _junJieInfos.length; i++) {
				writeBean(_junJieInfos[i]);
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
			//军阶对象列表
			var junJieInfos_length : int = readShort();
			for (i = 0; i < junJieInfos_length; i++) {
				_junJieInfos[i] = readBean(JunJieInfo) as JunJieInfo;
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
			return 126101;
		}
		
		/**
		 * get 军阶对象列表
		 * @return 
		 */
		public function get junJieInfos(): Vector.<JunJieInfo>{
			return _junJieInfos;
		}
		
		/**
		 * set 军阶对象列表
		 */
		public function set junJieInfos(value: Vector.<JunJieInfo>): void{
			this._junJieInfos = value;
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