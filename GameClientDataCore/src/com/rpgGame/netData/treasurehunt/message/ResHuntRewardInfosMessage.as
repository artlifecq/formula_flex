package com.rpgGame.netData.treasurehunt.message{
	import com.rpgGame.netData.treasurehunt.bean.TreasureHuntRewardInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回寻宝获得的奖励列表
	 */
	public class ResHuntRewardInfosMessage extends Message {
	
		//奖励集合
		private var _infos: Vector.<TreasureHuntRewardInfo> = new Vector.<TreasureHuntRewardInfo>();
		//12个格子的奖励表主键ID
		private var _gridIds1: Vector.<int> = new Vector.<int>();
		//12个格子的奖励表主键ID
		private var _gridIds2: Vector.<int> = new Vector.<int>();
		//12个格子的奖励表主键ID
		private var _gridIds3: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//奖励集合
			writeShort(_infos.length);
			for (i = 0; i < _infos.length; i++) {
				writeBean(_infos[i]);
			}
			//12个格子的奖励表主键ID
			writeShort(_gridIds1.length);
			for (i = 0; i < _gridIds1.length; i++) {
				writeInt(_gridIds1[i]);
			}
			//12个格子的奖励表主键ID
			writeShort(_gridIds2.length);
			for (i = 0; i < _gridIds2.length; i++) {
				writeInt(_gridIds2[i]);
			}
			//12个格子的奖励表主键ID
			writeShort(_gridIds3.length);
			for (i = 0; i < _gridIds3.length; i++) {
				writeInt(_gridIds3[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//奖励集合
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(TreasureHuntRewardInfo) as TreasureHuntRewardInfo;
			}
			//12个格子的奖励表主键ID
			var gridIds1_length : int = readShort();
			for (i = 0; i < gridIds1_length; i++) {
				_gridIds1[i] = readInt();
			}
			//12个格子的奖励表主键ID
			var gridIds2_length : int = readShort();
			for (i = 0; i < gridIds2_length; i++) {
				_gridIds2[i] = readInt();
			}
			//12个格子的奖励表主键ID
			var gridIds3_length : int = readShort();
			for (i = 0; i < gridIds3_length; i++) {
				_gridIds3[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 160107;
		}
		
		/**
		 * get 奖励集合
		 * @return 
		 */
		public function get infos(): Vector.<TreasureHuntRewardInfo>{
			return _infos;
		}
		
		/**
		 * set 奖励集合
		 */
		public function set infos(value: Vector.<TreasureHuntRewardInfo>): void{
			this._infos = value;
		}
		
		/**
		 * get 12个格子的奖励表主键ID
		 * @return 
		 */
		public function get gridIds1(): Vector.<int>{
			return _gridIds1;
		}
		
		/**
		 * set 12个格子的奖励表主键ID
		 */
		public function set gridIds1(value: Vector.<int>): void{
			this._gridIds1 = value;
		}
		
		/**
		 * get 12个格子的奖励表主键ID
		 * @return 
		 */
		public function get gridIds2(): Vector.<int>{
			return _gridIds2;
		}
		
		/**
		 * set 12个格子的奖励表主键ID
		 */
		public function set gridIds2(value: Vector.<int>): void{
			this._gridIds2 = value;
		}
		
		/**
		 * get 12个格子的奖励表主键ID
		 * @return 
		 */
		public function get gridIds3(): Vector.<int>{
			return _gridIds3;
		}
		
		/**
		 * set 12个格子的奖励表主键ID
		 */
		public function set gridIds3(value: Vector.<int>): void{
			this._gridIds3 = value;
		}
		
	}
}