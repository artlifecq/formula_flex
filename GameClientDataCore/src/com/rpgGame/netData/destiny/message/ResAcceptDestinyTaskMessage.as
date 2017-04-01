package com.rpgGame.netData.destiny.message{
	import com.rpgGame.netData.destiny.bean.DestinyInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 接收天命任务
	 */
	public class ResAcceptDestinyTaskMessage extends Message {
	
		//天命任务数据
		private var _destinyInfo: DestinyInfo;
		
		//随到的20个任务条件编号
		private var _tasklist: Vector.<String> = new Vector.<String>();
		//随到的12个道具奖励编号
		private var _rewardlist: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//天命任务数据
			writeBean(_destinyInfo);
			//随到的20个任务条件编号
			writeShort(_tasklist.length);
			for (i = 0; i < _tasklist.length; i++) {
				writeString(_tasklist[i]);
			}
			//随到的12个道具奖励编号
			writeShort(_rewardlist.length);
			for (i = 0; i < _rewardlist.length; i++) {
				writeInt(_rewardlist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//天命任务数据
			_destinyInfo = readBean(DestinyInfo) as DestinyInfo;
			//随到的20个任务条件编号
			var tasklist_length : int = readShort();
			for (i = 0; i < tasklist_length; i++) {
				_tasklist[i] = readString();
			}
			//随到的12个道具奖励编号
			var rewardlist_length : int = readShort();
			for (i = 0; i < rewardlist_length; i++) {
				_rewardlist[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 215101;
		}
		
		/**
		 * get 天命任务数据
		 * @return 
		 */
		public function get destinyInfo(): DestinyInfo{
			return _destinyInfo;
		}
		
		/**
		 * set 天命任务数据
		 */
		public function set destinyInfo(value: DestinyInfo): void{
			this._destinyInfo = value;
		}
		
		/**
		 * get 随到的20个任务条件编号
		 * @return 
		 */
		public function get tasklist(): Vector.<String>{
			return _tasklist;
		}
		
		/**
		 * set 随到的20个任务条件编号
		 */
		public function set tasklist(value: Vector.<String>): void{
			this._tasklist = value;
		}
		
		/**
		 * get 随到的12个道具奖励编号
		 * @return 
		 */
		public function get rewardlist(): Vector.<int>{
			return _rewardlist;
		}
		
		/**
		 * set 随到的12个道具奖励编号
		 */
		public function set rewardlist(value: Vector.<int>): void{
			this._rewardlist = value;
		}
		
	}
}