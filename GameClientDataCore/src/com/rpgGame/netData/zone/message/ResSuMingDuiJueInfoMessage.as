package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.zone.bean.SuMingInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回玩家宿命对决信息
	 */
	public class ResSuMingDuiJueInfoMessage extends Message {
	
		//今日刷新次数
		private var _refreshCount: int;
		
		//机器人列表
		private var _infos: Vector.<SuMingInfo> = new Vector.<SuMingInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//今日刷新次数
			writeInt(_refreshCount);
			//机器人列表
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
			//今日刷新次数
			_refreshCount = readInt();
			//机器人列表
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(SuMingInfo) as SuMingInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155130;
		}
		
		/**
		 * get 今日刷新次数
		 * @return 
		 */
		public function get refreshCount(): int{
			return _refreshCount;
		}
		
		/**
		 * set 今日刷新次数
		 */
		public function set refreshCount(value: int): void{
			this._refreshCount = value;
		}
		
		/**
		 * get 机器人列表
		 * @return 
		 */
		public function get infos(): Vector.<SuMingInfo>{
			return _infos;
		}
		
		/**
		 * set 机器人列表
		 */
		public function set infos(value: Vector.<SuMingInfo>): void{
			this._infos = value;
		}
		
	}
}