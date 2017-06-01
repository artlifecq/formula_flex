package com.rpgGame.netData.zhengba.message{
	import com.rpgGame.netData.zhengba.bean.PlayerBriefInfo;
	import com.rpgGame.netData.zhengba.bean.ZhengBaData;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回挑战数据集合
	 */
	public class SCChallengeDataMessage extends Message {
	
		//玩家自己的争霸信息
		private var _zhengBaData: ZhengBaData;
		
		//1 正常数据     2 挑战 前三 名
		private var _type: int;
		
		//挑战集合
		private var _playerBriefInfos: Vector.<PlayerBriefInfo> = new Vector.<PlayerBriefInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家自己的争霸信息
			writeBean(_zhengBaData);
			//1 正常数据     2 挑战 前三 名
			writeInt(_type);
			//挑战集合
			writeShort(_playerBriefInfos.length);
			for (i = 0; i < _playerBriefInfos.length; i++) {
				writeBean(_playerBriefInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家自己的争霸信息
			_zhengBaData = readBean(ZhengBaData) as ZhengBaData;
			//1 正常数据     2 挑战 前三 名
			_type = readInt();
			//挑战集合
			var playerBriefInfos_length : int = readShort();
			for (i = 0; i < playerBriefInfos_length; i++) {
				_playerBriefInfos[i] = readBean(PlayerBriefInfo) as PlayerBriefInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127102;
		}
		
		/**
		 * get 玩家自己的争霸信息
		 * @return 
		 */
		public function get zhengBaData(): ZhengBaData{
			return _zhengBaData;
		}
		
		/**
		 * set 玩家自己的争霸信息
		 */
		public function set zhengBaData(value: ZhengBaData): void{
			this._zhengBaData = value;
		}
		
		/**
		 * get 1 正常数据     2 挑战 前三 名
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 正常数据     2 挑战 前三 名
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 挑战集合
		 * @return 
		 */
		public function get playerBriefInfos(): Vector.<PlayerBriefInfo>{
			return _playerBriefInfos;
		}
		
		/**
		 * set 挑战集合
		 */
		public function set playerBriefInfos(value: Vector.<PlayerBriefInfo>): void{
			this._playerBriefInfos = value;
		}
		
	}
}