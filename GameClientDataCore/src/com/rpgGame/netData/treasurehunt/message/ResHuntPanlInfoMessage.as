package com.rpgGame.netData.treasurehunt.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回寻宝面板数据
	 */
	public class ResHuntPanlInfoMessage extends Message {
	
		//奖池元宝数量
		private var _golds: int;
		
		//12个格子的奖励表主键ID
		private var _gridIds: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//奖池元宝数量
			writeInt(_golds);
			//12个格子的奖励表主键ID
			writeShort(_gridIds.length);
			for (i = 0; i < _gridIds.length; i++) {
				writeInt(_gridIds[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//奖池元宝数量
			_golds = readInt();
			//12个格子的奖励表主键ID
			var gridIds_length : int = readShort();
			for (i = 0; i < gridIds_length; i++) {
				_gridIds[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 160106;
		}
		
		/**
		 * get 奖池元宝数量
		 * @return 
		 */
		public function get golds(): int{
			return _golds;
		}
		
		/**
		 * set 奖池元宝数量
		 */
		public function set golds(value: int): void{
			this._golds = value;
		}
		
		/**
		 * get 12个格子的奖励表主键ID
		 * @return 
		 */
		public function get gridIds(): Vector.<int>{
			return _gridIds;
		}
		
		/**
		 * set 12个格子的奖励表主键ID
		 */
		public function set gridIds(value: Vector.<int>): void{
			this._gridIds = value;
		}
		
	}
}