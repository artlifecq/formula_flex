package com.rpgGame.netData.task.message{
	import com.rpgGame.netData.task.bean.TreasureInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 宝箱任务相关信息
	 */
	public class ResTreasureBoxInfoMessage extends Message {
	
		//宝箱任务状态 0-未开启 1-已领取宝箱任务未完成 2-已完成但未领取全部奖励 3-已领取全部奖励
		private var _treasureTaskState: int;
		
		//当天已接过宝箱任务的次数
		private var _taskCnt: int;
		
		//军功宝箱信息
		private var _treasureBoxInfo1: TreasureInfo;
		
		//道具宝箱信息
		private var _treasureBoxInfo2: TreasureInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//宝箱任务状态 0-未开启 1-已领取宝箱任务未完成 2-已完成但未领取全部奖励 3-已领取全部奖励
			writeByte(_treasureTaskState);
			//当天已接过宝箱任务的次数
			writeInt(_taskCnt);
			//军功宝箱信息
			writeBean(_treasureBoxInfo1);
			//道具宝箱信息
			writeBean(_treasureBoxInfo2);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//宝箱任务状态 0-未开启 1-已领取宝箱任务未完成 2-已完成但未领取全部奖励 3-已领取全部奖励
			_treasureTaskState = readByte();
			//当天已接过宝箱任务的次数
			_taskCnt = readInt();
			//军功宝箱信息
			_treasureBoxInfo1 = readBean(TreasureInfo) as TreasureInfo;
			//道具宝箱信息
			_treasureBoxInfo2 = readBean(TreasureInfo) as TreasureInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124105;
		}
		
		/**
		 * get 宝箱任务状态 0-未开启 1-已领取宝箱任务未完成 2-已完成但未领取全部奖励 3-已领取全部奖励
		 * @return 
		 */
		public function get treasureTaskState(): int{
			return _treasureTaskState;
		}
		
		/**
		 * set 宝箱任务状态 0-未开启 1-已领取宝箱任务未完成 2-已完成但未领取全部奖励 3-已领取全部奖励
		 */
		public function set treasureTaskState(value: int): void{
			this._treasureTaskState = value;
		}
		
		/**
		 * get 当天已接过宝箱任务的次数
		 * @return 
		 */
		public function get taskCnt(): int{
			return _taskCnt;
		}
		
		/**
		 * set 当天已接过宝箱任务的次数
		 */
		public function set taskCnt(value: int): void{
			this._taskCnt = value;
		}
		
		/**
		 * get 军功宝箱信息
		 * @return 
		 */
		public function get treasureBoxInfo1(): TreasureInfo{
			return _treasureBoxInfo1;
		}
		
		/**
		 * set 军功宝箱信息
		 */
		public function set treasureBoxInfo1(value: TreasureInfo): void{
			this._treasureBoxInfo1 = value;
		}
		
		/**
		 * get 道具宝箱信息
		 * @return 
		 */
		public function get treasureBoxInfo2(): TreasureInfo{
			return _treasureBoxInfo2;
		}
		
		/**
		 * set 道具宝箱信息
		 */
		public function set treasureBoxInfo2(value: TreasureInfo): void{
			this._treasureBoxInfo2 = value;
		}
		
	}
}